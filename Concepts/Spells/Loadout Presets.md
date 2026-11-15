---
status: proposal
tags:
  - spell
  - board
refs:
  - D-04
  - D-13
  - Q-26
  - Q-34
---

# Loadout Presets

Saved board layouts, one per context. Arranging the cloak is the "preparation is power" pillar ([[Design Pillars]]); presets keep it from becoming a chore. This is half of the "wizard setup" answer to Q-26 (the other half is [[Sanctum Stations]]).

## Contexts
| Preset | Built for | Typical page | Notes |
|---|---|---|---|
| **Expedition** | Crossing a region | Traversal (Lodestep, Tether, Root bridge), light, one cure, one dissolve | The default. Spreads cheap cells across common verbs. |
| **Ritual** | Co-op [[Ritual Raid Loop]] and [[Choir Casting]] | Few big spells (`O4`, `T4`) with shared components on the borders | Built to plug into friends' casts; less flexible alone. |
| **Duel** | [[Formal Duels]] | Small spells on cost-3 cells carrying the duel verbs (Ward, Unweave as Dispel, Glamour as Illusion, Tether) | Packed in private. Per the duel rule in [[Formal Duels]]: you **declare a spell list** (not cells or components); your hand becomes readable to the opponent after the row commit; **sleeving** your hand costs a round. |
| **Story** | [[Story Scene Loop]] | Graveside, Omen, Glamour, Echo, Wayfinder | Verbs for talking, not doing ([[Spellbook as Vocabulary]]). |
| **Crafting** | The sanctum | Steep, Forge, Preserving brine, Ripen | Lives at home; never needs to travel. |

## Where you can change the board
| Place | What you can do |
|---|---|
| **Sanctum** | Everything: edit, save and name presets; pull components from storage. |
| **Waystone** | **Swap** between saved presets, using components you carry. Rotate and re-seat pieces. No new spells. |
| **In the field** (out of encounters) | Open the cloak, move and rotate pieces you carry ([[Cloak Inventory]]). |
| **In an encounter, scene or duel** | Locked. Only Wayfarer motion (Pocket swap, the "pull" behavior) moves pieces ([[Wayfarer Spellbook]]). |

## Limits (Proposal)
- **Preset slots:** 3 at the start (Expedition, Story, Crafting). More slots come only from the **Wardrobe**, a sanctum furniture piece (not a station; it generates nothing), upgraded up to 9 slots. Nine because slot numbers can be chorded as a column chord (1-9) at a waystone.
- A preset stores **spell placements and component placements**. If a component is missing (spent, rotted, left home), its pocket shows a **ghost** outline with the tags it needs. Ghosts are a shopping list for the next expedition.
- A preset cannot exceed your current pocket count ([[Cloak Pocket Progression]]).
- Swapping is free and instant at waystones ([[Anti-Chore Rules]]); the cost is only that you must reach one.

## Fork: field swapping
**Q-34:** Can you swap whole presets anywhere outside encounters, or only at the sanctum and waystones?
- Anywhere: least friction, but packing a cloak for a trip stops mattering.
- Waystones only: the route matters; waystones become places you plan around (an Elden Ring site-of-grace reference, [[Reference Deconstruction]]).

**Recommendation:** waystones and sanctum for whole presets, field for single-piece moves. Preparation keeps its weight, and fixing one mistake never needs a walk home.

## Apprentice page (the pre-arranged first full page)
Handed over with the Travelling cloak: the smock's 10 cells plus 3 tetromino patches = **22 cells** ([[Cloak Pocket Progression]]). It holds only spells of your **origin** school and its **two ring neighbors**, since splashing opens after Act I ([[Origins and Splashing]]); the neighbor spells are courtesy lessons from orders where you start at Known. Your mentor arranges it, so its exact shape changes with the origin; schools never own rows (D-04).

Example: a **Bloom** origin (neighbors Alchemy and Necro). Uppercase = origin cell; `.` = sewn, empty; `·` = not sewn.
```
      1      2      3      4      5      6      7      8      9
 A  [BRI]    .     Twine    ·      ·      ·      ·    [SPR]  Acorn
 B  [bri]  Mugw   [men]     ·      ·      ·      ·    [spr]  Moss
 C  [QSF]  Salt   [men]   [MEN]  Mugw     .      ·    [RAI]  Moss
 D  [qsf]  Twine    ·       ·      ·      ·      ·    [rai]    .
```
- Smock cells: `A1-A3`, `B1-B3`, `A8-A9`, `B8-B9`. Patches: `O4` at `C1-D2`, `I4` at `C3-C6`, `O4` at `C8-D9`.
- Bloom: Briar hedge (`A1`) and Mend (`C4`, an `L3` through `B3`) share the Mugwort at `B2`; Sprout (`A8`) takes the Acorn cap.
- Alchemy neighbor: Quicksilver flask (`C1`) ← Salt pinch + Twine. The Salt pinch also borders Mend, so it can drain twice as fast: the first charge lesson.
- Necro neighbor: Raise thornwalker (`C8`) borders the same Moss mat (`B9`-`C9`) that feeds Sprout. It sits at 0% until the mat rots, then wakes: the [[Rot]] cycle as the first lesson, as in the prototype.
- 19 of 22 cells used; `A2`, `C6` and `D9` are left free for the first spell the player learns ([[Research Loop]]).

## Related
- [[Grimoire Pages]], [[Loadout Codes]], [[Cloak Pocket Progression]], [[Cloak Inventory]], [[Origins and Splashing]], [[Polyomino Spells]], [[Decision Gates]], [[Sanctum Stations]], [[Formal Duels]]

## Open threads
- Q-34 above.
- Should a declared duel spell list also name the page it sits on, so a page turn is less of a surprise?
- Could NPC mentors hand you presets as lessons ("the Waymarch's river kit")?
