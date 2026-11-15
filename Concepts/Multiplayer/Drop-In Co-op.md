---
status: proposal
tags:
  - multiplayer
  - loop
refs:
  - D-27
  - Q-24
  - Q-60
---

# Drop-In Co-op

One to three guests join a host's world for a session. The host's world is the stage; each guest keeps their own wizard. A second player makes the game richer but is never required ([[Design Pillars]], pillar 5).

## What is shared, what is personal
| Thing | Shared (host's world) | Personal (travels with each player) |
|---|---|---|
| World state: restored land, roads, lit lamps, gardens | Yes. Changes stay in the host's world | Guests get a **Keepsake** (below) |
| Encounters, story flags, region progress | Host's | - |
| Town Standing (Nybblewick, local settlements) | Host's | - |
| Order Standing ([[Standing]]) | - | Each player's own; guests earn it for deeds they did |
| Components foraged | **Event rares** only (a meteor fall, a lightning-struck oak): one drop for the session, the named exception, and the classic prize for [[Subterfuge]] | Each player's own drops; ordinary nodes are per-player (no stealing a node) |
| Grimoire, cloak, loadout, fluency, familiar | - | Always personal |

- **Keepsake:** when a guest helps restore something in the host's world, they take home a component with that place's [[Provenance]] ("Moss from Aldo's mended bridge, Tanglewood, spring"). It is the proof-of-help and a good gift ([[Gift and Provenance Economy]]).
- Guest progress saves locally, so a host dropping out never wipes it ([[Anti-Chore Rules]]).

## Story scenes with guests (host-led)
- Rule: **the host decides; guests' casts add options.** Scenes play in the host's story. Guests watch the host's [[Story Scene Structure]] but can **interject**: when a scene opens a verb slot (speak with the dead, read a star chart, mend a lamp), any player whose grimoire has that verb may cast it, which adds a branch option.
- The host makes the final choice. Guests can **propose** by holding a vote chord (each guest's choice shows as a small glyph over their head).
- Guests never lose their own branches: their own storyline only advances in their own world.

## Co-op-only verbs
- [[Choir Casting]]: a great spell is split into parts; each player chords one part within a shared window. The window is **at least 4 s** per part; tighter windows exist only as an optional flourish.
- **Shared Byte** ([[Two-Handed Bytes]] across players): player A holds the row chord, player B the column. Neither can cast the spell alone. Used for heavy wards, gates, and the seats of a [[Ritual Raid Loop]].
- **Hand-off:** pass a component cloak to cloak mid-encounter (Wayfarer players can do this at range).

## Scaling
- No health or damage scaling. Encounters scale by **seats**: a ritual has 1 to 4 seats. Solo, familiars or a slower tempo fill empty seats; with four players, every seat is a person.
- More players also means more **verbs present**, so encounters can offer optional extra branches only a mixed party can take (an Astral plus Necro pair can read a ghost's star-sign). Mixed parties also bring their orders' quarrels into the scene ([[Cross-School Tensions]]).
- Chords are discrete events, so latency mostly doesn't matter. Only choir windows need sync, and those are wide.

**Recommendation:** ship host-led co-op with personal drops and Keepsakes before any shared-world idea. It fits Q-24's gate and needs no shared economy.

## Related
- [[PvP Philosophy]], [[Subterfuge]], [[Cross-School Tensions]], [[Ritual Raid Loop]], [[Community Layer]], [[Expedition Loop]], [[Multiplayer MOC]]

## Open threads
- **Q-60:** Should a guest's deeds in a host's world also raise the guest's *town* Standing at home, or only order Standing plus a Keepsake?
- Can a guest bring their familiar, and does its vision share fog with the party?
- What happens to a guest's half-finished Shared Byte when the partner disconnects: hold, or fizzle without cost?
