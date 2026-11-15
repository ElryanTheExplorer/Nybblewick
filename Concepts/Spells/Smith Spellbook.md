---
status: proposal
tags:
  - spell
  - school
refs:
  - D-04
  - D-06
  - Q-04
---

# Smith Spellbook

[[Smith]]: **Charge**. Forge, repair, power; fire and current together. Ring neighbors: [[Necro]] and [[Wayfarer]]. Components from the Ironreach ([[Component Catalog]]). Smith components carry **heat**: +1 per cast, overheated at 3 (no tags for a while).

How to read: see [[Spell Anatomy]]. **Code** = ID byte in [[Loadout Codes]] (`5x` = Smith). **Starter cell** is a suggestion only (D-04).

## Spells
| Code | Spell | Verb | Aim | Footprint | Sockets | Starter cell |
|---|---|---|---|---|---|---|
| `51` | **Kindle** (prototype "Cinder bolt"; Style Room `A1`) | light a fire | point | `I2` | smith | `A1` (cost 3) |
| `52` | Weld | repair | point | `L3` | smith, smith, any | — |
| `53` | Forge | forge | self (at an anvil or hot stone) | `O4` | smith, smith, smith, any | — |
| `54` | Charge | power | point | `T4` | smith, smith, any, any | — |
| `55` | Hearthstone | warm | place | `I2` | smith, any | — |
| `56` | Temper | harden, quench | point | `I3` | smith, any, any | — |
| `D1` | Grave bell (hybrid, + [[Necro]]) | lay to rest, call | place | `L3` | smith, rot, any | — |
| `E2` | Lightning rod (hybrid, + [[Wayfarer]]) | power (from weather) | place | `I3` | smith, way, any | — |

See also **Stormstep** (`E1`) in [[Wayfarer Spellbook]].

| Spell | Recipe | Alt recipe | Catalyst variant | World interaction (what persists) | Story hook |
|---|---|---|---|---|---|
| Kindle | Iron nail | Cinder, or Hearth coal | Fulgurite: a **spark** instead of flame; starts machines rather than fires | Lights a forge, brazier, kiln or signal fire, burns away cobweb and rot-fungus. **The fire stays lit** until put out. | The Anvil Hall's forges went cold; relight them one by one ([[Smith Storyline]]). |
| Weld | Iron nail + Hearth coal + Twine | Grave iron + Iron nail + Twine | Quench oil: the repair **upgrades** (a mended gate also locks) | Repairs metal: a gate, a cart axle, a lock, a bell. **Permanent.** | A drowned mill's gears, raised from the river. |
| Forge | Iron nail + Hearth coal + Copper coil (smith ×2, `L3`) | Meteoric iron + Anvil chip + Iron nail + Twine | Meteoric iron (event): the item is **star-forged**, glows faintly at night | Makes an item from bordering components: a key, a hinge, a plowshare, a bell. The item **exists** and can be gifted with your [[Provenance]]. | Commissions from the forge-town ([[Commission Loop]]). |
| Charge | Copper coil + Twine ×2 | Hearth coal + Iron nail + Twine ×2 | Fulgurite: the charge **chains** to the next machine | Stores power in a mill, lift, lamp-line or sanctum station. Runs it for a while (rates live in [[Automation]]). | Power the Nybblewick lamp-line when Astral light isn't enough. |
| Hearthstone | Hearth coal + Twine | Cinder + Twine | Eclipse pearl (off-school): a **cold** stone that keeps stores frozen | A warm stone that keeps a camp, house or seedbed warm overnight; frost-blight can't settle. **Lasts one night**, permanent if set into a hearth. | A hill farm through the first winter frost ([[Day Night and Seasons]]). |
| Temper | Anvil chip + Twine ×2 | Iron nail + Brine pearl + Twine | Quench oil: tempered tools **never rust** | Hardens a tool, beam or chain so it holds. **Permanent.** On the board, resets one bordering metal component's heat to 0. | An apprentice's first commission: temper a ferry chain for the Waymarch. |
| Grave bell | Grave iron + Twine | Iron nail + Grave-wax + Twine | Named barrow bead: the bell calls **one** spirit to speak | An iron bell set over a barrow. Restless dead **go quiet** for good, or (rung again) come to talk. | Grave Forges: smiths who forge for the dead ([[Necro Storyline]]). |
| Lightning rod | Struck lodestone + Twine | Iron nail + Lodestone + Twine | Fulgurite: the rod **stores** a storm for a calm day | Draws the next storm's lightning into a rod that powers a settlement's machines. **Permanent** fixture. | The Stormline: is Storm a school or this seam? (Q-04, [[Storm]]) |

## Board notes
- Heat punishes stacking: two Smith spells sharing one nail overheat it in two casts. Spread metal, or use Temper to cool it.
- Smith pieces are good bridges *between* a Necro and a Wayfarer spell (Grave iron, Struck lodestone).

## Related
- [[Smith]], [[Spell Anatomy]], [[Component Catalog]], [[Catalysts]], [[Necro Spellbook]], [[Wayfarer Spellbook]], [[Automation]], [[Hybrid Spells]]

## Open threads
- Kindle is the old Cinder bolt with the bolt removed. Should it keep a "throw" aim for duels only ([[Formal Duels]])?
- Does Forge need a physical anvil (a [[Sanctum Stations]] tie-in), or can any hot stone do?
- How does Charge read in the [[Input Budget per Mode]] when powering many machines in a row?
