---
status: proposal
tags:
  - input
---

# Wild Magic Overshoot

A column chord above 9 (`1010`-`1111`) doesn't fail. It clears the top bit and lands one finger away: 10→2, 11→3, 12→4, 13→5, 14→6, 15→7.

- Turns a dead input into "wild magic".
- Grew out of an earlier idea: Hamming-adjacent fizzles, where a one-finger miss warps the spell.
- Implemented in the prototype.

## Related
- [[Parity Inscriptions]] (one bit off as a puzzle), [[XOR Feedback]]

## Open threads
- Should wild magic be a *fun* outcome (random variant) or a punishing one?
- In the [[Light-Up Drill]], should overshoot count as wrong?
