---
status: proposal
tags:
  - world
  - system
refs:
  - Q-57
---

# Automation

**Purpose:** Factorio-lite "enchanted automation" in the Hollow. Take repetition off your hands so your casts go to things that matter ([[Reference Deconstruction]]: take throughput and visible progress, leave sprawl and combat pressure).
**Inputs:** bound spells, Smith Spark, station output, tethers.
**Outputs:** stations that feed each other; components delivered to your store.
**Player verbs / chords:** inscribe (bind a spell into a socket), tether, power.

## How it works
- **Bound spells.** Chord a spell into a station's socket once and it keeps running: a water spell on garden beds, a heat spell under the still, a light spell on the observatory lens. Each costs Spark per in-game day.
- **Stations feed stations** along tethers ([[Transport Network]]):
  - Garden overflow you mark for compost becomes Rot → Ossuary (makes Grave-wax). Unmarked overflow just waits, unspoiled.
  - Forge Spark → Still (heat) and any bound spell.
  - Observatory starlight → Garden at night (+1 growth step).
  - Waystation parcels → any station that needs that school's input.
- **Power from Smith.** The Forge makes Spark ([[Sanctum Stations]] has the numbers). Spark is stored in a bank (cap 40, 60 at Forge tier 3). If Spark runs short, bound spells pause in the order you set. Nothing breaks.
- **Throughput puzzles.** Small and readable: a 12-Spark forge feeding a still (4), two garden bound spells (2 each) and an observatory lens (3) leaves 1 spare. Upgrade, add a ley line, or choose what pauses.

## Scale caps
| Item | Max at full Sanctum |
|---|---|
| Stations | 6 (one per school) |
| Bound spells | 8 |
| Tethers | 6 |
| Spark bank | 60 |

Caps keep the Hollow a garden, not a factory floor, and keep the whole network on one screen.

## What stays manual, and why
- **Casting in the world**: encounters, restoration, story. This is the game ([[Design Pillars]] 1).
- **First casts**: a spell must be cast by hand before it can stand. **Q-57:** how many times? Lean: 5 successful hand casts, which also ties automation to fluency.
- **Rituals**: never automated.
- **Placement and design**: where stations and tethers go is a player decision.
- **Harvest is not manual**: tethers carry output to one store chest, so collecting is one walk-by, not a round of chores ([[Anti-Chore Rules]]).

## Limits and anti-chore rules
- Automation runs on play time with the stations ([[Sanctum Stations]]). Nothing decays or jams while you're offline.
- Paused spells resume when Spark returns; nothing is lost.

**Recommendation:** ship bound spells, tethers and Spark only. No conveyor belts, no splitters, no recipes beyond what [[Component Catalog]] defines. If players want more, add a second plot later rather than a deeper system.

## Scope cost
S-M. Most of the cost is UI that shows Spark flow clearly.

## Related
- [[Sanctum Stations]], [[Sanctum Loop]], [[Smith]], [[Transport Network]], [[Home Valley]], [[World MOC]]

## Open threads
- Q-57 (above).
- Could a bound spell be shown as its chord address glowing on the station, so visitors read it ([[Community Layer]])?
- Should [[Logic Gate Runes]] act as switches (run the still only when the bank is above half)?
