---
status: proposal
tags:
  - world
  - system
refs:
  - Q-56
---

# Transport Network

**Purpose:** logistics as magic. Move the player and components between the Hollow, [[Sanctum Stations]] and the [[Ring Regions]].
**Inputs:** Wayfarer casts (mostly), Lodestone and Waybone, Smith Spark for powered links.
**Outputs:** faster travel, open routes, components that arrive without being carried.
**Player verbs / chords:** Ferry, Tether, Waydoor, Lay road ([[Wayfarer]]); Weld and Charge (Smith); Skychart (Astral). Spells in [[Wayfarer Spellbook]].

## Links
| Link | Moves | How it's made | Throughput / speed | Limits |
|---|---|---|---|---|
| **Road** | player, carts | Lay road raises the path layer to 2-3 ([[Terraforming]]) | walking ×1.5 on paved road | counts toward area capacity |
| **Ferry** (boat) | player, batches of components | mend a ferry (an encounter), then it runs by itself | 12 components per crossing, one crossing per in-game hour | only at authored river crossings |
| **Ferry** (spell) | basic components only | cast Ferry ([[Wayfarer Spellbook]]) to send goods to your sanctum or a named waystone | arrives next in-game day | never duals, rares, catalysts or Fine/Storied pieces |
| **Tether** | player (zipline) or components (a line of motes) | cast between two Lodestone anchors | player crosses in 3 s; 2 components per in-game minute | 24 tiles long; 6 in the Hollow at most |
| **Waydoor, fixed** | player | opens at an order's seat once its region reaches stage 4 ([[Restoration Loop]]) | instant, to its paired door in Nybblewick | six, one per order |
| **Waydoor, placed** | player | cast Waydoor with the **Twin keys** catalyst ([[Catalysts]]) on two doorways | instant between the pair; NPCs use it too | one permanent pair per Twin keys; doorways only (not open ground) |
| **Ley line** | Spark and component parcels, region to Hollow | Astral maps it, Wayfarer anchors it at both ends | 1 parcel of 3-8 components per in-game day | one per region at stage 2+ ([[Restoration Loop]]) |
| **Waystone** | player | found, then woken by a cast | fast travel between woken waystones | rest site; loadout swap ([[Loadout Presets]]) |

## How it fits together
- **Inside the Hollow:** tethers carry output between stations and to your store; this is the logistics half of [[Automation]].
- **Hollow to regions:** six old roads (sealed at first, [[Traversal and Verb Gates]]), later ley lines and Waydoors.
- **Across the Ring:** the Crossings' restoration links ferries and roads into one network; Star Roads and Stormline borderlands offer fast routes between neighbors.
- Components in transit are visible: motes on tethers, crates on ferries. Players can see the network working ([[Design Pillars]] 2).

## Limits and anti-chore rules
- Links never break on their own. Storms may pause a tether for an hour; they never destroy it.
- Nothing on a link is lost. A blocked tether queues its items.
- Ley-line parcels are an alternative to carrying, not a replacement for foraging: they deliver only basic components from regions at stage 2+, never duals or rares.

## Proposal: the Waystation's role
The Waystation ([[Sanctum Stations]]) is the network's hub: it receives ley-line parcels and lets you pick which linked region sends today.

**Q-56:** can components move between regions and the Hollow without the player (ley lines, caravans), or must the player carry everything? Lean: yes, but only basic components from regions at stage 2+, so foraging stays the source of quality and [[Provenance]].

**Recommendation:** build roads, tethers and waystones for the slice. Ferries and ley lines need a region at stage 2 to matter; fixed Waydoors are late-game and placed ones depend on finding Twin keys.

## Scope cost
M. Tethers and motes are cheap. Ferries need authored crossings. Ley lines are a UI over the region map.

## Related
- [[Wayfarer]], [[Traversal and Verb Gates]], [[Automation]], [[Expedition Loop]], [[Home Valley]], [[World MOC]]

## Open threads
- Q-56 (above).
- Can co-op partners link their Hollows by a Waydoor while in a session ([[Drop-In Co-op]])?
- Should tether throughput be a Wayfarer motion puzzle on the board (swap cells to speed a line)?
