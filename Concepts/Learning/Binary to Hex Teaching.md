---
status: decided
tags:
  - learning
refs:
  - D-24
  - Q-18
---

# Binary to Hex Teaching

The game should teach binary → hex as a side effect of casting (D-24).

## Why it works here
- The hand is a place-value chart: 8 4 2 1 ([[Finger Bit Values]]).
- The board splits the digits neatly: **rows teach the letters A-F**, **columns teach the numerals 1-9**. Together they cover 1-F.
- Every address is a byte, so players end up reading `0xC7` without trying.

## Teaching ideas (Proposals)
- [[Light-Up Drill]]: the simplest loop.
- [[Prompt Ladder]]: fade the hints from binary to hex to nothing.
- [[XOR Feedback]]: show which fingers were wrong.
- Counting on fingers to 15 as an in-world nursery rhyme or apprentice exercise.
- Late game: [[Rune Puzzles]] use hex dumps, parity and Gray code.

## Open threads
- Q-18: explicit lessons ("this is binary") or purely learned through play, with a reveal later?
- Should decimal ever appear, or only binary and hex?

## See also (pass 2)
- [[Community Layer]]
- [[Grimoire Pages]]
- [[Loadout Codes]]
