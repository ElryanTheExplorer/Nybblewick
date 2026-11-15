---
status: proposal
tags:
  - spell
  - school
refs:
  - D-04
  - D-05
  - Q-04
---

# Wayfarer Spellbook

[[Wayfarer]]: **Motion**. Ferry, tether, doors; logistics as magic. Ring neighbors: [[Smith]] and [[Astral]]. Components from the Crossings ([[Component Catalog]]). Wayfarer components have no clock, but Wayfarer is the one school that **moves pieces on the board**.

How to read: see [[Spell Anatomy]]. **Code** = ID byte in [[Loadout Codes]] (`6x` = Wayfarer). **Starter cell** is a suggestion only (D-04).

## Spells
| Code | Spell | Verb | Aim | Footprint | Sockets | Starter cell |
|---|---|---|---|---|---|---|
| `61` | **Lodestep** (prototype) | blink | blink | `I2` | way | `A2` (cost 3) |
| `62` | Tether | tether | point | `I3` | way, way, any | — |
| `63` | Ferry | ferry (basic components only) | place | `L4` | way, way, any, any | — |
| `67` | Lay road | build roads and channels | place (a line) | `I4` | way, way, any, any | — |
| `64` | Waydoor | door | place (a doorway) | `O4` | way, way, way, any | — |
| `65` | Pocket swap | rearrange (board) | self | `I2` | way, any | — |
| `66` | Lodepull | pull | point | `I2` | way | — |
| `E1` | **Stormstep** (prototype; hybrid, + [[Smith]]) | travel along metal | blink | `L3` | smith, way | — |
| `F2` | Wayfinder (hybrid, + [[Astral]]) | find | self | `I2` | way, astral | — |

| Spell | Recipe | Alt recipe | Catalyst variant | World interaction (what persists) | Story hook |
|---|---|---|---|---|---|
| Lodestep | Lodestone | Waybone | Homing feather: leaves a return mark; recast to step back | A short blink across a gap or up a ledge. Leaves a **waymark peg** at the landing that co-op friends can blink to for the visit. | First lesson of the Waymarch: "the stone knows the way" ([[Wayfarer Storyline]]). |
| Tether | Waybone + Twine | Struck lodestone + Lodestone | Gossamer line (event): the tether is a **zipline** anyone can ride | A line between two anchors: hold a swaying bridge, moor a ferry, haul a cart uphill. **Persists** until cut. | The Crossings ferry broke its cable in a flood. |
| Ferry | Waybone + Ferry token + Twine | Milestone chip + Waybone + Twine ×2 | Homing feather: ferried goods **return** the next day | Sends a batch of **basic components** you carry to your sanctum or a named waystone. Basic only: never duals, rares, catalysts or Storied pieces, matching ley-line parcels in [[Transport Network]] (batch size lives there). | Waymarch postal round: a village sends its spare Mugwort and Salt to the Hollow before frost. |
| Waydoor | Waybone + Lodestone + Twine | Milestone chip + Ferry token + Lodestone | Twin keys: a **paired, permanent** door between two places | Opens a sealed or stuck door. With Twin keys it makes a **player-placed** paired door between two doorways, a **permanent** node NPCs use. (The fixed doors to Nybblewick are a separate kind, opened by restoration, [[Transport Network]].) | Reconnect two settlements that haven't spoken since the roads failed. |
| Lay road | Waybone + Milestone chip + Twine | Pilgrim chalk + Lodestone + Twine ×2 | Old Wood seed (off-school): the road is lined with trees that shade and hold it | Lays a stretch of road, or cuts a channel to carry water. **Permanent**; roads speed walking ([[Transport Network]]), channels change the land ([[Terraforming]]). | The old roads failed when the lamps went out; the Waymarch rebuilds them stone by stone. |
| Pocket swap | Reed whistle + Twine | Lodestone + Twine | Homing feather: swap a cloak pocket with one in your **sanctum** storage | Swaps two components on your board, even during an encounter, when rearranging is otherwise locked ([[Loadout Presets]]). No world change: it pays for itself by enabling other casts. | — (a utility of the board itself; flagged against [[Not Doing]] "no numbers-only spells", see open threads) |
| Lodepull | Lodestone | Struck lodestone | Twin keys: pull an object **through** a door to its pair | Pulls a lever, a rope end, a dropped item or a stuck cart toward you. The pulled thing **stays** where it lands. | A child's kite stuck on a ferry mast. |
| Stormstep | Iron nail + Lodestone | Struck lodestone alone (smith + way) | Fulgurite: the step **charges** every rail you pass | Rides current along a wire, rail or fence. Rails you ride stay **powered** for a while ([[Automation]]). | Storm as the Smith-Wayfarer seam (Q-04, [[Storm]]); the Stormline linemen. |
| Wayfinder | Compass glass | Lodestone + Starglass | Named barrow bead (off-ring): find a **grave** | A needle points to a named person, place or component type. Found places are **pinned** on your map. | A lost child on the Star Roads; or a missing Warden. |

## Board notes
- Wayfarer is the school that forgives a bad layout: Pocket swap and the Canon "pull" behavior let you fix the board mid-expedition.
- Wayfarer components never wear out, so they are good pieces to share between two spells.

## Related
- [[Wayfarer]], [[Spell Anatomy]], [[Component Catalog]], [[Catalysts]], [[Smith Spellbook]], [[Astral Spellbook]], [[Traversal and Verb Gates]], [[Hybrid Spells]]

## Open threads
- Pocket swap changes no world state. Is a board-only spell acceptable, or should it also move a real object (swap two crates)?
- Does Lodestep across a gap count as a verb gate ([[Traversal and Verb Gates]]), or is it too common to gate anything?
- Can Waydoors connect to a co-op friend's sanctum ([[Drop-In Co-op]])?
