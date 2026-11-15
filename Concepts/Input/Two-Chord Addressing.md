---
status: decided
tags:
  - input
  - board
refs:
  - D-02
---

# Two-Chord Addressing

A cell is picked with two chords: **row**, then **column**.

- Row chords are `1010`-`1111` (A-F). Every row chord has the index finger open, a home anchor for the hand.
- Column chords are `0001`-`1001` (1-9). A closed fist is not a column.
- Two nybbles = one byte, so every address is a byte (e.g. `C7` = `1100 0111` = 0xC7).

## Related
- [[Scopeless Board]], [[Thumb Commit]], [[Wild Magic Overshoot]], [[Two-Handed Bytes]]

## Open threads
- Could addresses be read in-world as hex bytes (`0xC7`) for the puzzle layer ([[Rune Puzzles]])?

## See also (pass 2)
- [[Grimoire Pages]]
- [[Loadout Codes]]
