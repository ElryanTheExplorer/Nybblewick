# Are.na backup

Copies your Are.na account to `_arena/` at the vault root. Uses the standard library only (Python 3.9+).

## 1. Token (needed for private and closed channels)
1. Create a personal access token at https://www.are.na/settings/personal-access-tokens (read scope is enough).
2. Save it in `tools/arena/.token`, which is git-ignored, or export `ARENA_TOKEN=...`.

Without a token you can still back up public channels: `--user <slug>` or `--channel <slug>`.

## 2. Run (from the vault root)
```sh
python3 tools/arena/arena_backup.py --list      # preview: channels and item counts, no downloads
python3 tools/arena/arena_backup.py             # back up every channel you own
python3 tools/arena/arena_backup.py --channel <slug>   # just one (repeatable)
```
Options:
- `--include-others`: also back up channels you collaborate on.
- `--follow-nested N`: also back up channels nested inside yours, N levels deep.
- `--rate 60`: API requests per minute. 60 is the default.
- `--force`: re-read channels even if they haven't changed.
- `--limit N`: test on a few items per channel.

## Rate limits (from the API docs, checked 2026-11-15)
- Reads per minute, counted per account across the whole API: free 120, **premium 300 (this account)**, supporter 600. Unauthenticated: 30 per IP.
- The script defaults to 60 a minute, with at least 1 s between calls. The docs ask for 200–500 ms.
- It reads the `X-RateLimit-*` headers and pauses until the window resets when under 10% remain. On a 429 it waits for `X-RateLimit-Reset`.
- On a re-sync, a channel whose `updated_at` hasn't changed costs 1 call (it isn't paged again). Note that 304 responses also count, so ETags wouldn't save anything.
- Images and attachments come from Are.na's CDN, not the API, so they don't use the API budget.
- User-Agent: `nybblewick-arena-backup/1.1`. Set `ARENA_CONTACT=<url or email>` to add the contact the docs ask for.

Speed: about 1 API call per channel plus 1 per 100 blocks, plus image downloads. Ctrl-C is safe and runs resume.

## Output
```
_arena/index.md                       all channels
_arena/channels/<slug>/index.md       gallery: images, text, links, descriptions in channel order
_arena/channels/<slug>/channel.json   raw channel record
_arena/channels/<slug>/contents.json  order + connection info
_arena/blocks/<id>/block.json         raw block (stored once even if in many channels)
_arena/blocks/<id>/<original file>    image / attachment / text.md / link preview
_arena/backup-log.json                run history
```

## Note on Are.na's terms
The API terms forbid bulk scraping or harvesting. This script is meant for backing up **your own** account: it paces itself to half the free-tier limit and backs off when rate-limited. Ask help@are.na before using it on anything bigger.
