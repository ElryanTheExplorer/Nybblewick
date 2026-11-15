---
status: proposal
tags:
  - spell
  - school
refs:
  - D-04
  - D-05
---

# Astral Spellbook

[[Astral]]: **Pattern**. Light, maps, illusion, divination. Ring neighbors: [[Alchemy]] and [[Wayfarer]]. Components from the Glasshigh ([[Component Catalog]]).

How to read: parts are defined in [[Spell Anatomy]]. **Code** is the spell's ID byte in [[Loadout Codes]] (high nybble = school in ring order, `1` = Astral; `A`-`F` = borderland hybrids). **Starter cell** is only a suggestion for the first pre-arranged page, picked for low [[Finger Cost]]; any spell can sit anywhere (D-04).

## Spells
| Code | Spell | Verb | Aim | Footprint | Sockets | Starter cell |
|---|---|---|---|---|---|---|
| `11` | **Starfall** (prototype) | light | place | `I2` | astral, any | `A4` (cost 3) |
| `12` | Wisp lantern | light | self | `I2` | astral | — |
| `13` | Skychart | map | self | `L4` | astral, astral, any | — |
| `14` | Glamour | illusion, stagecraft | place | `T4` | astral, astral, any, any | — |
| `15` | Omen | divination | point | `I3` | astral, any, any | — |
| `16` | Project | scout (astral projection) | self | `L3` | astral, any | — |
| `17` | Unweave | dispel an illusion or ward | point | `I2` | astral, any | — |
| `18` | Star-step | a short bridge of light | place | `I3` | astral, astral, any | — |
| `A1` | Salt-and-star ward (hybrid, + [[Alchemy]]) | preserve, ward | place | `O4` | astral, alch, any, any | — |
| `F1` | Star road (hybrid, + [[Wayfarer]]) | map, path | place (a line) | `I4` | astral, way, any | — |

| Spell | Recipe | Alt recipe | Catalyst variant | World interaction (what persists) | Story hook |
|---|---|---|---|---|---|
| Starfall | Starglass + Twine | Moonsilver alone (astral ×2; the second tag fills `any`) | Eclipse pearl: motes of shadow, a cool dark patch that hides you and lets night creatures pass | Three motes settle into lamps, braziers or empty lanterns and **stay lit**. Nybblewick's street lamps are relit this way. | The wick-town's lamps went dark the year the Starwatch stopped visiting ([[Astral Storyline]]). |
| Wisp lantern | Lampmoth wing | Starglass | Owl quill: the light shows hidden ink, tracks and seals | A light that follows you for a scene. Revealed writing is **copied into the grimoire** for good. | An apprentice's first night walk across the moors. |
| Skychart | Starglass + Moonsilver + Twine (2 astral in one row = constellation ×1.5) | Skyglass lens + Twine | Comet hair: chart the place **as it was** before the dusk | Reveals the surrounding region on your map. Revealed areas **stay revealed**, and co-op friends see them ([[Astral Projection]], [[Astral Scouting Loop]]). | The Starwatch is re-charting the Ring; your charts are the first in a generation. |
| Glamour | Moonsilver + Owl quill + Twine ×2 | Compass glass + Starglass + Twine | Lampmoth swarm (event): the illusion is solid enough to walk on until dawn (a light bridge). **Mummer's mask:** disguises a **person** (you or a willing friend) instead of a place ([[Subterfuge]]) | Two documented uses. **In the world:** a place looks different (a ruin dressed for a festival, a cliff hidden as a slope); **lasts until dispelled**; NPCs react (villagers return to a hall that looks loved). **In [[Formal Duels]]:** a **board decoy**, the Illusion verb: a fake ward on an open line, or a warded line dressed to look open. It never hides which cell you chord; your hand stays readable after the row commit. | The Wick Fair needs a stage; or the dusk-folk need hiding ([[Premise Options]]). |
| Omen | Starglass + Twine ×2 | Skyglass lens + Twine | Named barrow bead (off-ring): the omen is spoken by an ancestor | Shows what a hazard, spirit or blight front will do next. Leaves a **star mark** your familiar can follow for the rest of the visit. | A seer's warning nobody believed ([[Encounter Types]]). |
| Project | Starglass + Twine | Skyglass lens alone | Comet hair: project into the place's **past** layer | Your body kneels, cloak shut, while your sight leaves it to scout ([[Astral Projection]], [[Astral Scouting Loop]]). Nothing physical changes, but everything you see is **pinned on the map** for you and co-op friends. | The Starwatch's oldest rite: seeing the Ring from above for the first time. |
| Unweave | Owl quill + Twine | Starglass + Twine | Comet hair: also shows **who** wove it and when | Breaks an illusion, glamour or ward. Hidden doors and paths it was covering **stay revealed**. In [[Formal Duels]] it is the Dispel verb. | Someone has glamoured the Old Orrery shut; the Starwatch suspects one of its own. |
| Star-step | Lampmoth wing ×2 + Twine | Moonsilver + Twine | Lampmoth swarm: the steps **stay until dawn** for anyone to use | Stepping platforms of light up a ledge or over a short gap. **Night only**; they fade when you leave ([[Traversal and Verb Gates]]). | The Orrery Stair can only be climbed at night. |
| Salt-and-star ward | Starsalt + Salt pinch + Twine ×2 | Starsalt + Starglass + Moonsilver (overfills: constellation) | Tide-and-star salt (ritual-only): the ward drifts with the moon around the Hollow | A circle that blight and frost can't cross. **Persists until the next new moon**, recast to renew. | Starwatch and Retort disagree on whether wards are care or control ([[Cross-School Tensions]]). |
| Star road | Compass glass + Twine | Starglass + Lodestone + Twine | Homing feather: the road also guides you home from anywhere on it | Lights a line of waymarks between two points at night. **Permanent**; NPC travellers start using it ([[Transport Network]]). | The Star Roads pilgrims' route, lost since the lamps went out. |

## Board notes
- Astral power comes from **lining up** astral contributors. Skychart's `L4` has a long side: put two Starglass along it in one column.
- Star-step and Lampmoth wing both work only at night; the full-moon bonus (Canon) makes night the Astral school's season.
- Light spells are cheap and frequent: Starfall earns a cost-3 cell.

## Related
- [[Astral]], [[Spell Anatomy]], [[Component Catalog]], [[Catalysts]], [[Astral Projection]], [[Alchemy Spellbook]], [[Wayfarer Spellbook]], [[Hybrid Spells]], [[Devotion]]

## Open threads
- Outside duels and opt-in [[Subterfuge]], does Glamour fool other players at all, or only NPCs? (Lean: NPCs only, to avoid free griefing.)
- Should Omen be the Astral answer to Q-10 (familiar vision as interactive)?
- A mono-Astral [[Devotion]] payoff: with 4+ astral components on the page, light spells leave constellations in the sky that other players can read.
