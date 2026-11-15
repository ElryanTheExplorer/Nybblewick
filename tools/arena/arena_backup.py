#!/usr/bin/env python3
"""Local backup of your own Are.na account (API v3). Standard library only.

Usage (from the vault root):
    export ARENA_TOKEN=...            # or put the token in tools/arena/.token
    python3 tools/arena/arena_backup.py --list          # what would be backed up
    python3 tools/arena/arena_backup.py                 # back up every channel you own
    python3 tools/arena/arena_backup.py --channel some-slug --channel other-slug
    python3 tools/arena/arena_backup.py --user someone  # a public user's channels (no token needed)

Output (default: _arena/ at the vault root):
    _arena/blocks/<id>/block.json           raw API record, once per block
    _arena/blocks/<id>/<file>               original image / attachment / text.md
    _arena/channels/<slug>/channel.json     raw channel record
    _arena/channels/<slug>/contents.json    ordered list of {position, type, id}
    _arena/channels/<slug>/index.md         Obsidian-viewable gallery
    _arena/index.md                         list of all backed-up channels
    _arena/backup-log.json                  when each run happened and what it did

Re-running is incremental: unchanged blocks and already-downloaded files are skipped.

Are.na's API terms prohibit bulk scraping. This tool is meant for backing up
your own account: it paces itself well under the free-tier read limit and
backs off on 429.
"""
from __future__ import annotations

import argparse
import json
import os
import re
import sys
import time
import urllib.error
import urllib.parse
import urllib.request
from datetime import datetime, timezone
from pathlib import Path

API = "https://api.are.na/v3"
HERE = Path(__file__).resolve().parent
VAULT = HERE.parent.parent
# Are.na asks for `AppName/version (+contact)`. Set ARENA_CONTACT (a URL or email) to add one.
UA = "nybblewick-arena-backup/1.1" + (f" (+{os.environ['ARENA_CONTACT']})" if os.environ.get("ARENA_CONTACT") else "")


class Client:
    def __init__(self, token: str | None, api_interval: float, file_interval: float):
        self.token = token
        self.api_interval = api_interval
        self.file_interval = file_interval
        self._last_api = 0.0
        self._last_file = 0.0
        self.api_calls = 0

    def _wait(self, last: float, interval: float) -> None:
        gap = time.monotonic() - last
        if gap < interval:
            time.sleep(interval - gap)

    def get(self, path: str, **params) -> dict:
        query = {k: v for k, v in params.items() if v is not None}
        url = f"{API}{path}" + (f"?{urllib.parse.urlencode(query)}" if query else "")
        headers = {"User-Agent": UA, "Accept": "application/json"}
        if self.token:
            headers["Authorization"] = f"Bearer {self.token}"
        for attempt in range(8):
            self._wait(self._last_api, self.api_interval)
            self._last_api = time.monotonic()
            self.api_calls += 1
            try:
                with urllib.request.urlopen(urllib.request.Request(url, headers=headers), timeout=60) as r:
                    self._respect_headers(r.headers)
                    return json.load(r)
            except urllib.error.HTTPError as e:
                body = e.read().decode("utf-8", "replace")
                if e.code == 429:
                    wait = _retry_after(e, body, default=65)
                    reset = e.headers.get("X-RateLimit-Reset") if e.headers else None
                    if reset and reset.isdigit():
                        wait = max(wait, int(reset) - int(time.time()) + 2)
                    log(f"  rate limited; waiting {wait}s")
                    time.sleep(wait)
                    continue
                if e.code >= 500:
                    time.sleep(min(60, 2 ** attempt))
                    continue
                raise ApiError(e.code, url, body) from None
            except (urllib.error.URLError, TimeoutError) as e:
                log(f"  network error ({e}); retrying")
                time.sleep(min(60, 2 ** attempt))
        raise ApiError(0, url, "gave up after retries")

    def _respect_headers(self, h) -> None:
        """Pause until the window resets if under 10% of the binding bucket remains."""
        try:
            limit = int(h.get("X-RateLimit-Limit"))
            remaining = int(h.get("X-RateLimit-Remaining"))
            reset = int(h.get("X-RateLimit-Reset"))
        except (TypeError, ValueError):
            return
        self.tier = h.get("X-RateLimit-Tier") or getattr(self, "tier", None)
        if remaining < max(3, limit // 10):
            wait = max(1, reset - int(time.time()) + 1)
            log(f"  {remaining}/{limit} requests left in this window; pausing {wait}s")
            time.sleep(min(wait, 120))

    def pages(self, path: str, per: int = 100, **params):
        page = 1
        while True:
            data = self.get(path, page=page, per=per, **params)
            yield from data.get("data", [])
            meta = data.get("meta", {})
            nxt = meta.get("next_page")
            if not nxt or not meta.get("has_more_pages", nxt is not None):
                return
            page = nxt

    def download(self, url: str, dest: Path) -> bool:
        """Fetch a file to dest (atomic). Returns True if downloaded, False if already there."""
        if dest.exists() and dest.stat().st_size > 0:
            return False
        dest.parent.mkdir(parents=True, exist_ok=True)
        tmp = dest.with_name(dest.name + ".part")
        for attempt in range(5):
            self._wait(self._last_file, self.file_interval)
            self._last_file = time.monotonic()
            try:
                req = urllib.request.Request(url, headers={"User-Agent": UA})
                with urllib.request.urlopen(req, timeout=120) as r, open(tmp, "wb") as f:
                    while chunk := r.read(1 << 16):
                        f.write(chunk)
                tmp.replace(dest)
                return True
            except urllib.error.HTTPError as e:
                if e.code in (403, 404, 410):
                    log(f"  missing file ({e.code}): {url}")
                    tmp.unlink(missing_ok=True)
                    return False
                time.sleep(min(60, 2 ** attempt))
            except (urllib.error.URLError, TimeoutError, ConnectionError):
                time.sleep(min(60, 2 ** attempt))
        tmp.unlink(missing_ok=True)
        log(f"  failed to download: {url}")
        return False


class ApiError(Exception):
    def __init__(self, code: int, url: str, body: str):
        super().__init__(f"HTTP {code} for {url}: {body[:300]}")
        self.code = code


def _retry_after(e: urllib.error.HTTPError, body: str, default: int) -> int:
    h = e.headers.get("Retry-After") if e.headers else None
    if h and h.isdigit():
        return int(h) + 1
    try:
        return int(json.loads(body)["error"]["retry_after"]) + 1
    except Exception:
        return default


def log(msg: str) -> None:
    print(msg, flush=True)


def safe_name(s: str, fallback: str) -> str:
    s = re.sub(r"[^\w.\- ]+", "_", s or "").strip(" ._")
    return (s or fallback)[:120]


def ext_from(url: str, content_type: str | None, fallback: str) -> str:
    path_ext = os.path.splitext(urllib.parse.urlparse(url).path)[1].lower()
    if 1 < len(path_ext) <= 6:
        return path_ext
    if content_type and "/" in content_type:
        sub = content_type.split("/")[1].split(";")[0]
        return "." + {"jpeg": "jpg", "svg+xml": "svg"}.get(sub, sub)
    return fallback


def text_of(md) -> str:
    if isinstance(md, dict):
        return md.get("markdown") or md.get("plain") or ""
    return md or ""


# --- backup ---------------------------------------------------------------------

def save_json(path: Path, obj) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    tmp = path.with_name(path.name + ".part")
    tmp.write_text(json.dumps(obj, indent=2, ensure_ascii=False), encoding="utf-8")
    tmp.replace(path)


def backup_block(cl: Client, out: Path, b: dict, stats: dict) -> dict:
    """Store one block once. Returns a small summary used by the channel index."""
    bid = b["id"]
    bdir = out / "blocks" / str(bid)
    rec = bdir / "block.json"
    btype = b.get("type", "?")
    unchanged = False
    if rec.exists():
        try:
            unchanged = json.loads(rec.read_text(encoding="utf-8")).get("updated_at") == b.get("updated_at")
        except Exception:
            pass
    save_json(rec, b)
    stats["blocks_new" if not unchanged else "blocks_same"] += 1

    files: list[str] = []
    img = b.get("image") or {}
    if img.get("src"):
        name = safe_name(Path(img.get("filename") or "").stem, "image") + ext_from(img["src"], img.get("content_type"), ".jpg")
        if b.get("type") != "Image":
            name = "preview-" + name
        if cl.download(img["src"], bdir / name):
            stats["files"] += 1
        files.append(name)
    att = b.get("attachment") or {}
    if att.get("url"):
        name = safe_name(att.get("filename") or "", "attachment" + (("." + att["file_extension"]) if att.get("file_extension") else ""))
        if cl.download(att["url"], bdir / name):
            stats["files"] += 1
        files.append(name)
    if btype == "Text":
        (bdir / "text.md").write_text(text_of(b.get("content")), encoding="utf-8")
        files.append("text.md")

    src = (b.get("source") or {}).get("url") or ((b.get("embed") or {}).get("source_url"))
    return {"id": bid, "type": btype, "title": b.get("title") or "", "files": files, "source": src,
            "description": text_of(b.get("description"))}


def backup_channel(cl: Client, out: Path, slug: str, stats: dict, seen: set, follow_nested: int,
                   limit: int = 0, force: bool = False) -> dict | None:
    if slug in seen:
        return None
    seen.add(slug)
    try:
        ch = cl.get(f"/channels/{urllib.parse.quote(slug)}")
    except ApiError as e:
        log(f"! skipping channel {slug}: {e}")
        stats["errors"] += 1
        return None
    cdir = out / "channels" / ch["slug"]
    prev = cdir / "channel.json"
    if not force and prev.exists() and (cdir / "contents.json").exists() and not limit:
        try:
            if json.loads(prev.read_text(encoding="utf-8")).get("updated_at") == ch.get("updated_at"):
                stats["channels_same"] += 1
                return ch
        except Exception:
            pass
    save_json(cdir / "channel.json", ch)
    log(f"# {ch.get('title')} ({ch['slug']}, {ch.get('visibility')}, {(ch.get('counts') or {}).get('contents', '?')} items)")

    order, summaries, nested = [], [], []
    per = min(100, limit) if limit else 100
    for item in cl.pages(f"/channels/{ch['id']}/contents", per=per, sort="position_asc"):
        conn = item.get("connection") or {}
        pos = conn.get("position")
        if item.get("type") == "Channel":
            order.append({"position": pos, "type": "Channel", "id": item["id"], "slug": item.get("slug"),
                          "title": item.get("title")})
            summaries.append({"type": "Channel", "title": item.get("title"), "slug": item.get("slug")})
            nested.append(item.get("slug"))
            continue
        order.append({"position": pos, "type": item.get("type"), "id": item["id"], "connection": conn})
        summaries.append(backup_block(cl, out, item, stats))
        if len(order) % 50 == 0:
            log(f"  … {len(order)} items")
        if limit and len(order) >= limit:
            break
    save_json(cdir / "contents.json", order)
    write_channel_index(cdir, ch, summaries)
    stats["channels"] += 1

    if follow_nested > 0:
        for s in nested:
            if s:
                backup_channel(cl, out, s, stats, seen, follow_nested - 1, limit, force)
    return ch


def write_channel_index(cdir: Path, ch: dict, items: list[dict]) -> None:
    lines = [
        f"# {ch.get('title')}",
        "",
        f"Are.na: https://www.are.na/{(ch.get('owner') or {}).get('slug', '')}/{ch['slug']}  ",
        f"Visibility: {ch.get('visibility')} · {len(items)} items · backed up {now()}",
        "",
    ]
    desc = text_of(ch.get("description"))
    if desc:
        lines += [desc, ""]
    for it in items:
        if it["type"] == "Channel":
            lines.append(f"- Channel: [{it['title']}](../{it['slug']}/index.md)")
            continue
        head = f"### {it['title'] or it['type'] + ' ' + str(it['id'])}  `#{it['id']}`"
        lines += [head, ""]
        for f in it["files"]:
            rel = f"../../blocks/{it['id']}/{f}"
            if f == "text.md":
                body = (cdir.parent.parent / "blocks" / str(it["id"]) / f).read_text(encoding="utf-8")
                lines += ["> " + l for l in body.splitlines()[:20]] or ["> (empty)"]
            elif re.search(r"\.(png|jpe?g|gif|webp|svg|avif|bmp)$", f, re.I):
                lines.append(f"![{it['title'] or it['id']}](<{rel}>)")
            else:
                lines.append(f"[{f}](<{rel}>)")
        if it.get("source"):
            lines.append(f"Source: {it['source']}")
        if it.get("description"):
            lines.append(f"*{it['description'][:400]}*")
        lines.append("")
    (cdir / "index.md").write_text("\n".join(lines), encoding="utf-8")


def write_root_index(out: Path) -> None:
    rows = []
    for cj in sorted((out / "channels").glob("*/channel.json")):
        ch = json.loads(cj.read_text(encoding="utf-8"))
        n = len(json.loads((cj.parent / "contents.json").read_text(encoding="utf-8"))) if (cj.parent / "contents.json").exists() else 0
        rows.append(f"| [{ch.get('title')}](<channels/{ch['slug']}/index.md>) | {ch.get('visibility')} | {n} | {(ch.get('updated_at') or '')[:10]} |")
    text = ["# Are.na backup", "", f"Updated {now()}. Raw data; curated notes live in `References/`.", "",
            "| Channel | Visibility | Items | Updated on Are.na |", "|---|---|---|---|", *rows, ""]
    (out / "index.md").write_text("\n".join(text), encoding="utf-8")


def now() -> str:
    return datetime.now(timezone.utc).strftime("%Y-%m-%d %H:%M UTC")


def read_token(arg: str | None) -> str | None:
    if arg:
        return Path(arg).read_text(encoding="utf-8").strip()
    if os.environ.get("ARENA_TOKEN"):
        return os.environ["ARENA_TOKEN"].strip()
    f = HERE / ".token"
    if f.exists():
        return f.read_text(encoding="utf-8").strip() or None
    return None


def list_user_channels(cl: Client, user: str) -> list[dict]:
    return [c for c in cl.pages(f"/users/{urllib.parse.quote(str(user))}/contents", type="Channel")
            if c.get("type") == "Channel"]


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--out", default=str(VAULT / "_arena"), help="output folder (default: <vault>/_arena)")
    ap.add_argument("--token-file", help="file holding a personal access token")
    ap.add_argument("--user", help="back up this user's channels instead of the token owner's")
    ap.add_argument("--channel", action="append", default=[], help="back up only this channel slug (repeatable)")
    ap.add_argument("--include-others", action="store_true",
                    help="with --user/--me, also include channels the user did not create (collaborations)")
    ap.add_argument("--follow-nested", type=int, default=0, metavar="N",
                    help="also back up channels nested inside, N levels deep (default 0)")
    ap.add_argument("--list", action="store_true", help="list channels and item counts, download nothing")
    ap.add_argument("--force", action="store_true", help="re-read every channel even if unchanged since the last run")
    ap.add_argument("--limit", type=int, default=0, help="at most N items per channel (for testing)")
    ap.add_argument("--rate", type=float, default=60.0,
                    help="API requests per minute (default 60). Limits per account: free 120, premium 300, supporter 600")
    args = ap.parse_args()

    token = read_token(args.token_file)
    cl = Client(token, api_interval=60.0 / max(1.0, args.rate), file_interval=0.15)
    out = Path(args.out)

    if args.channel:
        slugs = list(args.channel)
    else:
        if args.user:
            user = args.user
        elif token:
            me = cl.get("/me")
            user = me.get("slug") or me["id"]
            log(f"Signed in as {me.get('name') or user}")
        else:
            log("No token and no --user/--channel. Set ARENA_TOKEN (or tools/arena/.token), or pass --user / --channel.")
            return 2
        chans = list_user_channels(cl, user)
        if not args.include_others:
            mine = [c for c in chans if str((c.get("owner") or {}).get("slug", user)) == str(user)
                    or (c.get("owner") or {}).get("id") == user]
            chans = mine or chans
        slugs = [c["slug"] for c in chans]
        if args.list:
            total = 0
            for c in chans:
                n = (c.get("counts") or {}).get("contents", 0)
                total += n or 0
                log(f"{n:>6}  {c.get('visibility', ''):<8} {c['slug']}  ·  {c.get('title')}")
            log(f"{len(chans)} channels, {total} items (blocks shared between channels are stored once)")
            return 0

    if args.list:
        for s in slugs:
            ch = cl.get(f"/channels/{urllib.parse.quote(s)}")
            log(f"{(ch.get('counts') or {}).get('contents', '?'):>6}  {ch.get('visibility', ''):<8} {ch['slug']}  ·  {ch.get('title')}")
        return 0

    out.mkdir(parents=True, exist_ok=True)
    stats = {"channels": 0, "channels_same": 0, "blocks_new": 0, "blocks_same": 0, "files": 0, "errors": 0}
    started = now()
    seen: set = set()
    for s in slugs:
        backup_channel(cl, out, s, stats, seen, args.follow_nested, args.limit, args.force)
    write_root_index(out)

    logf = out / "backup-log.json"
    history = json.loads(logf.read_text(encoding="utf-8")) if logf.exists() else []
    history.append({"started": started, "finished": now(), "channels": slugs, "api_calls": cl.api_calls, **stats})
    save_json(logf, history)
    log(f"Done: {stats['channels']} channels read, {stats['channels_same']} unchanged and skipped, {stats['blocks_new']} new/changed blocks, "
        f"{stats['blocks_same']} unchanged, {stats['files']} files downloaded, {stats['errors']} errors, "
        f"{cl.api_calls} API calls. Index: {out / 'index.md'}")
    return 1 if stats["errors"] else 0


if __name__ == "__main__":
    try:
        sys.exit(main())
    except KeyboardInterrupt:
        log("\nInterrupted. Re-run to resume; finished files are kept.")
        sys.exit(130)
    except ApiError as e:
        log(f"API error: {e}")
        if e.code == 401:
            log("The token was rejected. Make one at https://www.are.na/settings/personal-access-tokens")
        sys.exit(1)
