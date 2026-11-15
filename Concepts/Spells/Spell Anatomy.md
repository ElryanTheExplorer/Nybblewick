---
status: proposal
tags:
  - spell
  - board
refs:
  - D-04
  - Q-01
  - Q-02
  - Q-30
---

# Spell Anatomy

Every spell is built from the same eight parts. The [[Spell]] template fields map onto them one to one, and every spellbook ([[Astral Spellbook]], [[Alchemy Spellbook]], [[Wayfarer Spellbook]], [[Bloom Spellbook]], [[Smith Spellbook]], [[Necro Spellbook]]) uses them as columns.

## The parts
| Part | What it is | Rules (prototype unless marked) |
|---|---|---|
| **Verb / school** | What the spell does to the world, and which school(s) it belongs to | One utility verb per spell ([[Utility-First Pivot]]). One school, or two ring neighbors for a hybrid ([[Hybrid Spells]]). The school says nothing about *where* the spell sits (D-04). |
| **Footprint** | The polyomino the spell occupies on the board | Named like tetrominoes: `I2`, `I3`, `L3`, `I4`, `L4`, `O4`, `T4`, `S4`. Bigger = more border = more sockets ([[Polyomino Spells]]). Rotation is the only fitting step. |
| **Origin cell** | The cell you chord to fire it | The first cell of the footprint. Its [[Finger Cost]] is the spell's cost to speak. |
| **Sockets** | A list of requirements, e.g. `{bloom}{bloom}{any}` | Any component 4-adjacent to *any* footprint cell may fill one. Typed sockets fill first with matching tags, then `{any}` takes what's left ([[Sockets and Components]]). Proposal: sockets ≈ footprint size, 1 to 4. |
| **Recipe** | The components a spellbook suggests | A recipe is advice, not law: any components with the right tags work. |
| **Alt recipes** | Other ways to fill the same sockets | Usually one dual or multi-tag component that covers two sockets and frees a pocket. |
| **Catalyst** | An optional rare component that changes *behavior*, not power | Must border the **origin cell** to apply. See [[Catalysts]]. |
| **Aim** | How you target it after the cast readies | `point`, `arc`, `place`, `blink`, `self` ([[Aim Archetypes]], [[Cast Flow]]). |
| **World interaction** | What changes, and whether it stays | Every spell leaves a mark ([[Design Pillars]] pillar 2, [[Not Doing]]: no numbers-only spells). |
| **Power** | filled sockets / total sockets | 0 fizzles. Astral constellation ×1.5 (2+ astral contributors in one row or column). |

## Power: what does 75% mean?
**Q-30:** When a spell is partly powered, what shrinks?
- **A. Size:** a 75% bridge spans 3 of 4 tiles.
- **B. Persistence:** a 75% bridge spans the gap but washes out with the next rain.
- **C. Both.**

**Recommendation:** A (size or strength scales with power). Persistence belongs to the spell and its catalyst, so "the land answers" stays reliable, and a half-powered cast is still visibly useful. Constellation power above 100% grows size past the base (a 4-tile bridge becomes 5 or 6).

## Worked example: Root bridge

**School(s):** [[Bloom]]  
**Utility verb:** terraform (grow a living bridge over a gap)  
**Aim:** place (a gap edge; the bridge grows toward the far side)  
**Footprint:** `I4`, origin at the left end  
**Sockets:** `{bloom}{bloom}{any}{any}`  
**Recipe:** Moss mat (bloom ×2) + Twine (any) + Acorn cap (bloom, offered as `any`)  
**Alt recipes:** Bramble coil (bloom, `L3`) + Moss mat; or Tincture moss (alch + bloom) in an `any` socket, which also makes the bridge salt-proof on the Saltings  
**Catalyst variants:** Heartwood chip on the origin → the bridge becomes a **living** bridge that thickens each season instead of needing re-casting  
**World interaction:** a root span appears across a gap of up to 4 tiles. Persists. Can be withered by [[Necro]] (a deliberate story lever, D-07).  
**Story hook:** the Hedge Circle's old root bridges are dying; a Barrow Warden argues they should be allowed to rot ([[Bloom Storyline]], [[Cross-School Tensions]]).

Board sketch (origin `C4`, finger cost 3):
```
        3     4     5     6     7     8
  B     .   [Mo]  [Mo]    .     .     .     Mo = Moss mat, rotated flat (bloom, bloom)
  C     .   [RB*] [RB]  [RB]  [RB]  [Tw]    Tw = Twine (any)
  D     .     .     .     .     .     .     RB* = origin
```
Moss mat fills both `{bloom}`, Twine fills one `{any}`, one `{any}` is empty → **power 3/4 = 75%**, a 3-tile bridge. Drop an Acorn cap at `D5` and it reaches 4/4.

Under **Q-01** (consumption): if casts consume, Twine and one freshness tick of Moss mat are spent; if they only require, Moss mat still ages on its Bloom clock. Either way the recipe reads the same.

## Related
- [[Component Taxonomy]], [[Catalysts]], [[Component Catalog]], [[Sockets and Components]], [[Polyomino Spells]], [[Mana Pips vs Pool]], [[Spellbook as Vocabulary]], [[Research Loop]]

## Open threads
- Q-30 above.
- Positioned sockets (a `{smith}` socket on a specific edge) would deepen the packing puzzle. Worth a prototype only after the list version feels thin.
- Should a spell show its sockets on the board as notches, so a glance shows what's missing?
- Under Q-02's pool option, sockets become a cost line ("2 bloom, 2 any") and footprints only matter for adjacency. Does Root bridge still read well?
