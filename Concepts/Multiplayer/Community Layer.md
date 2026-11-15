---
status: proposal
tags:
  - multiplayer
  - learning
refs:
  - Q-24
  - Q-64
---

# Community Layer

Asynchronous features that make the world feel inhabited by other wizards without a persistent shared server. This is the recommended ceiling for **Q-24**: solo plus drop-in co-op ([[Drop-In Co-op]]), plus this layer.

## 1. Glyph messages
Leave a short message on the ground, written as a chord. Mechanic reference: Elden Ring's template messages (verify); ours are hex.
- A message is an **address** in a dedicated Message Grimoire: the row chord picks a template, the column chord picks a word.
- Rows (templates): `A` "Try ___", `B` "Beware ___", `C` "___ ahead", `D` "Remember ___", `E` "Gift for ___", `F` "Look to the ___".
- Columns (words, 1-9) are drawn from what you know: verbs from your grimoire, places you've seen, components you've found. More fluency and exploration, more words.
- Readers see the glyph first (`B4`) and can hover for the text. Reading glyphs quietly drills hex ([[Binary to Hex Teaching]]).
- **Relight** a helpful message to keep it burning longer; ignored messages gutter out after a contest season.

## 2. Afterglow
Faint traces of the last chord another wizard cast at a puzzle or seal (like a bloodstain, but kind). Touch one to see their hands shape the solution: a hint system made of other players.

## 3. Gifts with provenance
Leave a component at a waystone for a stranger or send one to a friend. The gift keeps its [[Provenance]] and adds "left by …". See [[Gift and Provenance Economy]].

## 4. Shared contest-season goals
These run on **contest seasons**: shared, real-world, one per quarter, ending in the one-week Wick Fair. They are separate from each player's personal *in-game seasons*, which run on play time ([[Day Night and Seasons]]). Missing a contest season costs nothing you already have ([[Anti-Chore Rules]]).

Server-wide counters the whole community fills by playing in their own worlds: "Light ten thousand lamps on the Long Road", "Mend every bridge in the Crossings". Reaching a goal changes something for everyone next contest season (a festival, a new ferry route, a shrine).

## 5. Town Standing and contests
- Each contest season, you pledge to one **town** (default: your order's seat). Your deeds in your own world feed that town's tally.
- Contests between towns run as the [[Seasonal Contest Loop]]; the old [[Community Ritual Conflict]] note holds the fiction.
- Your personal relationship with the town remains [[Standing]] (Story/RPG).

## What it is not
- No global chat, no shared market, no persistent shared world. No currency to trade ([[Incentive Model]]).
- No way to harm another player's world asynchronously; contest sabotage only touches contest tallies and stockpiles.

**Recommendation:** ship glyph messages and Afterglow first; they cost little server work and reinforce the core skill.

## Related
- [[Reference Deconstruction]], [[Notoriety and Oaths]], [[Subterfuge]], [[Ritual Raid Loop]], [[Day Night and Seasons]], [[Multiplayer MOC]]

## Open threads
- **Q-64:** Which async feature ships first: glyph messages, Afterglow, gifts, or contest-season goals?
- Are deceptive messages ("Try jumping") allowed as harmless [[Subterfuge]], or filtered out by low relight?
- Should glyph words unlock per player (only words you know) or for everyone?
