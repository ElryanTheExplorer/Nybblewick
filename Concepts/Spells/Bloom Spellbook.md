---
status: proposal
tags:
  - spell
  - school
refs:
  - D-04
  - D-05
  - D-07
---

# Bloom Spellbook

[[Bloom]]: **Growth**. Grow, mend, terraform. Ring neighbors: [[Alchemy]] and [[Necro]]. Components from the Tanglewood ([[Component Catalog]]). Bloom components carry **freshness**: they tick down in play time and become [[Rot]] at 0.

How to read: see [[Spell Anatomy]]. **Code** = ID byte in [[Loadout Codes]] (`3x` = Bloom). **Starter cell** is a suggestion only (D-04).

## Spells
| Code | Spell | Verb | Aim | Footprint | Sockets | Starter cell |
|---|---|---|---|---|---|---|
| `31` | **Briar hedge** (prototype "Briar snare") | grow a barrier | place | `I2` | bloom | — |
| `32` | Sprout (Style Room `A8`) | grow | place | `I2` | bloom | `A8` (cost 3) |
| `33` | Mend | mend | point | `L3` | bloom, bloom, any | — |
| `34` | Root bridge | terraform | place | `I4` | bloom, bloom, any, any | — |
| `35` | Greening | terraform, restore | place (area) | `T4` | bloom, bloom, any, any | — |
| `37` | Upheave | raise ground, shift a stream | place (area) | `T4` | bloom, bloom, any, any | — |
| `36` | Ripen | grow (time) | point | `I2` | bloom, any | — |
| `C1` | Mulch turn (hybrid, + [[Necro]]) | return rot to soil | place | `L3` | bloom, rot, any | — |
| `B2` | Steaming bed (hybrid, + [[Alchemy]]) | grow out of season | place | `O4` | bloom, alch, any, any | — |

| Spell | Recipe | Alt recipe | Catalyst variant | World interaction (what persists) | Story hook |
|---|---|---|---|---|---|
| Briar hedge | Mugwort | Bramble coil | Heartwood chip: the hedge **flowers**, draws bees, never needs recasting | A thorn hedge: fences livestock, holds a slope, closes a path. **Persists** and grows a little each season. | A shepherd's flock keeps wandering into the Barrowfen. |
| Sprout | Acorn cap | Mugwort | Old Wood seed: a full-grown tree at once, with a walkable canopy | Plants one tree, vine or crop that **grows over days**. The building block of Hollow gardens ([[Home Valley]]). | The first tree you plant in the Hollow is still there at the end of the game. |
| Mend | Moss mat + Twine | Mugwort + Bramble coil + Twine | Heartwood chip: mended wood is **stronger** than new | Mends living things and wood: a hurt deer, a split mast, a rotted footbridge. Mends **persist**. | A Hedge Circle healer teaches mending as a vow, not a trick ([[Bloom Storyline]]). |
| Root bridge | Moss mat + Twine + Acorn cap | Bramble coil + Moss mat | Heartwood chip: a **living** bridge that thickens each season | A root span across a gap of up to 4 tiles. **Persists.** Can be withered by Necro. Worked example in [[Spell Anatomy]]. | Real living root bridges of Meghalaya as a mechanic reference (verify). |
| Greening | Moss mat + Honeycomb (bloom, offered as `any`) + Twine | Ghostcap + Mugwort + Twine ×2 | Old Wood seed: the patch becomes **old forest**, a new foraging node | Turns a patch of blighted or barren ground into meadow. **Restoration** progress, permanent ([[Restoration Loop]], [[Terraforming]]). | Restore a burned hillside; the Waymarch wants a road through it instead. |
| Upheave | Bramble coil + Mugwort + Twine ×2 | Honeycomb (bloom ×2) + Twine ×2 | Old Wood seed: roots bind the new ground so it **never slumps** | Roots heave the ground up: a bank against floods, a ramp to a ledge, a stream moved into a new bed. **Permanent** ([[Terraforming]]). | A Tanglewood village is flooding each spring; the Waymarch wants the stream for its ferry. |
| Ripen | Mugwort + Twine | Tincture moss | Philosopher's salt (off-school): fruit ripens and then **never spoils** | Brings a crop, fruit or seed to ripeness now. On the board, sets a bordering Bloom component's freshness to max **once**. | A harvest festival needs fruit a month early ([[Premise Options]], The Wick Fair). |
| Mulch turn | Ghostcap + Twine | Rot + Mugwort + Twine | Heartwood chip: the soil stays **rich** for a year | Turns a rot patch into fertile soil: the [[Rot]] cycle closed by hand. **Persists**; next Sprout there grows twice as fast. | The old pact between the Hedge Circle and the Barrow Wardens ([[Cross-School Tensions]]). |
| Steaming bed | Tincture moss + Mugwort + Twine ×2 | Spring vapor flask + Moss mat + Twine | Quickening yeast: grows **fungi** that light the dark | A warm bed where anything grows out of season. **Persists** as a garden plot (a Sanctum-like station in the field, [[Sanctum Stations]]). | Fungal Springs refugees need food in winter. |

## Board notes
- Freshness is a clock: Bloom spells are strongest early in an expedition. Plan a Necro spell beside your oldest Bloom piece, so its rot has a use.
- Preserving brine ([[Alchemy Spellbook]]) next to a Moss mat buys time.

## Related
- [[Bloom]], [[Spell Anatomy]], [[Component Catalog]], [[Catalysts]], [[Alchemy Spellbook]], [[Necro Spellbook]], [[Rot]], [[Hybrid Spells]]

## Open threads
- The prototype's Briar snare was a trap. Should Bloom keep one gentle "hold" verb for encounters ([[Encounter Types]])? Briar hedge can still hold a charging boar.
- Does a planted tree belong to the player, the land, or the town ([[Gift and Provenance Economy]])?
- Mono-Bloom [[Devotion]]: with 4+ fresh Bloom pieces on the page, grow spells also mend everything nearby.
