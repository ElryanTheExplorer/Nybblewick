---
status: proposal
tags:
  - input
  - board
---

# Finger Cost

`cost = popcount(row) + popcount(column)`: the number of open fingers needed.

- The cheapest cells (cost 3) are exactly eight: A1, A2, A4, A8, C1, C2, C4, C8 (row A = 1010 and C = 1100 have two open fingers; columns 1, 2, 4, 8 have one).
- Layout puzzle = ergonomics puzzle: you want favorite spells on cheap cells.
- The prototype has a cost overlay.
- Body cost differs from bit cost: ring-only chords are hard ([[Finger Anatomy]]).

## Proposal: measured cost
The [[Light-Up Drill]] can record each player's real time and error rate per nybble, making a personal cost map instead of a formula.

## Related
- [[Gray Code Board]], [[Scopeless Board]]

## See also (pass 2)
- [[Loadout Presets]]
