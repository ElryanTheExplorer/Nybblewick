---
status: proposal
tags:
  - spell
  - board
  - input
refs:
  - D-02
  - D-14
  - Q-07
  - Q-33
---

# Grimoire Pages

The grimoire holds several boards, one per **page**. You carry them all and turn between them by hand. Pages are what you *carry at once*; [[Loadout Presets]] are what you *swap between* at waystones.

## How pages multiply the address space
| Pages | Cells | Address |
|---|---|---|
| 1 | 54 | row + column: `C7` = one byte, `0xC7` |
| 3 | 162 | page + row + column: `2C7` = three hex digits, 12 bits |
| 9 | 486 | the page digit runs 1-9, like a column |

A three-digit address teaches that a number can have more than two places ([[Binary to Hex Teaching]]): the page is a new high digit.

## The page-turn gesture (Q-33)
| Option | Gesture | Cost | Risk |
|---|---|---|---|
| **A. Thumb double-tap** | Two quick thumb presses with no finger chord | ~0.4 s; no finger cost | Clashes with thumb-commit timing ([[Thumb Commit]], Q-07); asks for speed (D-20) |
| **B. Numeral in the row slot** | Commit a chord `0001`-`1001` where a row is expected. Rows need the index finger and must be `1010`-`1111`, so these chords are currently dead. Committing `0011` jumps to page 3 | One commit (one chord + thumb); finger cost of the numeral | A row chord with the index finger missing turns the page by accident |
| **C. Reserved cell** | One cell on every page (say `F9`) is "next page" | A full two-chord address, finger cost 6 (the priciest corner) | Burns a cell on every page |

**Recommendation:** B, plus a safety: the page flips with a short paper-turn animation and **the previous page stays one commit away** (commit the closed fist `0000` in the row slot = "back"). It reuses dead input space instead of adding a new gesture, it is a direct jump (no cycling), and the page number is a nybble you already know. The accident risk becomes a gentle lesson ([[XOR Feedback]] shows the missing index finger).

Costs by context:
- Exploration, sanctum, story: free; turning a page is part of the rhythm.
- [[Formal Duels]]: a page turn is **visible** to the opponent (the book flips in [[In-the-Coat Duel View]]); a tell, not a speed test.

## Do pages share components? (Fork)
- **A. Separate pages:** each page is a full board with its own components. Simple; capacity scales with pages.
- **B. Overlay pages:** components live in the **cloak** (one layer); spells live on **pages** that lay over it. Turning a page swaps which spells sit on the same components. One Moss mat can feed Sprout on page 1 and Mend on page 2.

**Recommendation:** B. It keeps the cloak as one physical lining ([[Cloak Inventory]]), turns pages into a layout puzzle instead of a pure capacity bump, and makes a single Storied component more valuable. Pages are earned on the Cloak axis ([[Cloak Pocket Progression]]): page 2 with the Order mantle, page 3 with the Grimoire coat.

## Related
- [[Loadout Presets]], [[Loadout Codes]], [[Cloak Pocket Progression]], [[Two-Chord Addressing]], [[Scopeless Board]], [[Finger Cost]], [[Input Budget per Mode]]

## Open threads
- Q-33 above.
- Under overlay pages and Q-01 "consume", one component feeding three pages runs dry fast. Is that the right tension?
- Should pages have themes (a "night page" that only works after dusk)?
- With [[Two-Handed Bytes]], could the off-hand hold the page digit so all three digits are chorded at once?
