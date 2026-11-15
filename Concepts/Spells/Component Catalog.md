---
status: proposal
tags:
  - spell
  - board
  - world
refs:
  - Q-01
---

# Component Catalog

Every component, by region and borderland. Extends the [[Canon Sheet]] table (Canon names kept; new ones added). Properties are explained in [[Component Taxonomy]]; behavior-changing rares are in [[Catalysts]]. World notes reference these; this note owns them.

**Code** = the component's ID byte in [[Loadout Codes]]. High nybble = school in ring order (`1` Astral, `2` Alchemy, `3` Bloom, `4` Necro, `5` Smith, `6` Wayfarer), `A`-`F` = the six borderlands, `7` = event rares, `8`-`9` = catalysts, `0` = colorless.

**State** shorthand: `ch N` charges, `fr N` freshness, `heat` (overheats at 3), `—` none.

## Colorless
| Code | Name | Tags | Shape | State | Found | Notable for |
|---|---|---|---|---|---|---|
| `01` | Twine | any | 1×1 | — | Foraged everywhere: plant fiber, old rope, ferry lines | Fills `{any}` sockets. The filler every recipe leans on. |

## The Glasshigh ([[Astral]])
| Code | Name | Tags | Shape | State | Found | Notable for |
|---|---|---|---|---|---|---|
| `11` | Starglass | astral | 1×1 | — | Lens shards in observatory ruins; glint only under a lit Wisp lantern | Canon. The basic constellation piece. |
| `12` | Moonsilver | astral ×2 | `L3` | — | Moon pools on the moors, full moon only | Canon. Alone fills a 2-socket Astral spell. |
| `13` | Owl quill | astral | `I2` | — | Shed at owl roosts in the ruins | Long: lines up with a second astral piece for a constellation. |
| `14` | Lampmoth wing | astral | 1×1 | offers its tag dusk to dawn only | Moth swarms around lit lamps (so relighting lamps grows supply) | A night-only piece: Astral's soft clock. |
| `15` | Skyglass lens | astral ×2 | `I2` | — | Uncommon; intact telescope lenses, often a Starwatch gift | A clean 2-tag piece for map spells. |

## The Saltings ([[Alchemy]])
| Code | Name | Tags | Shape | State | Found | Notable for |
|---|---|---|---|---|---|---|
| `21` | Salt pinch | alch | 1×1 | ch 3 | Scraped from salt pans | Canon. Cheap, runs dry. |
| `22` | Retort | alch ×2 | `I2` | ch 4 | Washed up at old guild works; or blown at the sanctum | Canon. Two sockets, but drains twice as fast if shared. |
| `23` | Sulfur bloom | alch | 1×1 | ch 2 | Crusts on sulfur vents (hot to pick: a gentle hold-timing forage) | Pairs with Smith heat in Brimstone recipes. |
| `24` | Brine pearl | alch | 1×1 | ch 5 | Inside brine-shrimp beds after a storm | Longest-lasting Alchemy piece; the preserving staple. |
| `25` | Spring vapor flask | alch | `I2` | ch 3 | Bottled at hot springs (an empty flask + a cast) | Made, not found: a small crafting step in the field. |

## The Tanglewood ([[Bloom]])
| Code | Name | Tags | Shape | State | Found | Notable for |
|---|---|---|---|---|---|---|
| `31` | Mugwort | bloom | 1×1 | fr 9 | Clearings and path edges | Canon. The common Bloom piece. |
| `32` | Moss mat | bloom ×2 | `I2` | fr 6 | North sides of old trunks | Canon. Rots fast: a natural Necro feeder. |
| `33` | Acorn cap | bloom | 1×1 | fr 12 | Under oaks in autumn | Slow to spoil; seeds Sprout. |
| `34` | Bramble coil | bloom | `L3` | fr 8 | Overgrown ruins (cut with Wither or by hand) | Awkward shape, good border coverage. |
| `35` | Honeycomb | bloom ×2 | `O4` | fr 20 | Wild hives; given by beekeepers who trust you | Big and slow: anchors a Bloom page. |

## The Barrowfen ([[Necro]])
| Code | Name | Tags | Shape | State | Found | Notable for |
|---|---|---|---|---|---|---|
| `41` | Rot | rot | shape of the spoiled piece | — | Any Bloom piece at freshness 0 | Canon. Never foraged: grown by waiting. |
| `42` | Grave-wax | rot | 1×1 | ch 3 (burns down) | Barrow candles, given by Wardens | Canon. Necro's only charged piece. |
| `43` | Peat brick | rot ×2 | `I2` | — | Cut from fen banks | Also what Rot becomes after 3 raises under Q-01 "require". |
| `44` | Barrow bead | rot | 1×1 | — | Grave goods, returned to families or kept with permission | Always Storied: carries a name ([[Provenance]]). |
| `45` | Bog-oak | rot ×2 | `I3` | — | Ancient trunks surfacing in drained fens | Long rot piece for Echo. |
| `46` | Will-o-wick | rot | 1×1 | offers its tag at night only | Marsh lights, caught in a lantern | Necro's night piece, mirroring Lampmoth. |

## The Ironreach ([[Smith]])
| Code | Name | Tags | Shape | State | Found | Notable for |
|---|---|---|---|---|---|---|
| `51` | Iron nail | smith | 1×1 | heat | Ruined buildings, old fences | Canon. |
| `52` | Hearth coal | smith | 1×1 | heat (starts at 1) | Cold forges and seams | Canon. Starts warm: one fewer cast before overheating. |
| `53` | Cinder | smith | 1×1 | heat | Slag heaps | Prototype starting piece. |
| `54` | Copper coil | smith ×2 | `L3` | heat | Old wire coils in Ironreach ruins and storm-felled lines | Carries charge; a Charge staple. |
| `55` | Anvil chip | smith | 1×1 | heat, overheats at 5 | Broken anvils in the forge-town | The cool-headed metal. |

## The Crossings ([[Wayfarer]])
| Code | Name | Tags | Shape | State | Found | Notable for |
|---|---|---|---|---|---|---|
| `61` | Lodestone | way | 1×1 | — | Riverbeds near old roads; pulled out with Lodepull | Canon. Never wears out. |
| `62` | Waybone | way ×2 | `I2` | — | Old waymarker bones at crossroads shrines | Canon. |
| `63` | Ferry token | way | 1×1 | bound to one waystone | Given by ferry folk for a crossing paid in help | Ferry and Waydoor target its waystone. |
| `64` | Milestone chip | way | `I2` | — | Broken milestones on the old roads | Remembers a distance: Ferry range +1 tile per chip (flavor). |
| `65` | Reed whistle | way | 1×1 | — | Cut at ferry landings | The Pocket swap piece. |

## Borderlands (duals from ring neighbors)
| Code | Name | Tags | Shape | State | Borderland | Notable for |
|---|---|---|---|---|---|---|
| `A1` | Starsalt | astral + alch | 1×1 | ch 3 | Starsalt Flats | Canon. Wards; Bottled starlight. |
| `A2` | Tide-glass | astral + alch | `I2` | ch 2 | Starsalt Flats, at spring tide | Rarer second dual. |
| `B1` | Tincture moss | alch + bloom | 1×1 | fr 8 | Fungal Springs | Canon. Cures and grows. |
| `C1` | Ghostcap | bloom + rot | 1×1 | fr 4 | The Mulch | Canon. Living *and* rotten: fills both halves of the cycle. |
| `D1` | Grave iron | rot + smith | 1×1 | heat | Grave Forges | Canon. |
| `D2` | Ember bone | rot + smith | `I2` | heat | Grave Forges, in old cremation forges | Warm rot. |
| `E1` | Struck lodestone | smith + way | 1×1 | heat | Stormline, after storms | Canon. Stormstep and Lightning rod alone. |
| `F1` | Compass glass | way + astral | 1×1 | — | Star Roads | Canon. Wayfinder, Star road. |
| `F2` | Pilgrim chalk | way + astral | 1×1 | ch 3 | Star Roads shrines | Marks routes; Glamour alt. |

## Event-only rares (off-ring duals and wildcards)
| Code | Name | Tags | Shape | State | Event | Notable for |
|---|---|---|---|---|---|---|
| `71` | Meteoric iron | smith + astral | 1×1 | heat | Meteor fall in the Glasshigh or Ironreach | Prototype. Star-forged items. |
| `72` | Struck oak | bloom + smith | `I2` | fr 7, heat | Lightning on an oak in the Tanglewood | Prototype. The only piece with two clocks. |
| `73` | Brimstone | alch + smith | 1×1 | ch 2, heat | Vent eruption on the Saltings | Makes Brimstone rain a one-piece recipe. |
| `74` | Wickwax | wildcard (fills any one typed socket) | 1×1 | ch 1 | The Wick Fair: one real-world Fair week at the end of each contest season ([[Day Night and Seasons]], [[Seasonal Contest Loop]]) | The only true wildcard. |

Catalysts (codes `81`-`91`) are listed in [[Catalysts]].

## How regions feed the loop
- Most commons are found on [[Expedition Loop]] routes. The six [[Sanctum Stations]] grow only basics: Garden (Mugwort, Moss mat), Still (Salt pinch, Retort), Observatory (Starglass, Moonsilver), Forge (Iron nail, Hearth coal), Waystation (Lodestone, parcels of basics), Ossuary (Grave-wax). From tier 2 they also grow a few commons, which can still be foraged: Garden (Twine), Still (Spring vapor flask), Forge (Copper coil); rates are in [[Sanctum Stations]]. Everything else here is foraged, found at events or given. In the field, Spring vapor flask is filled by hand at the hot springs.
- Several need a spell to harvest (Lodepull for Lodestone, Wither for Bramble coil, Wisp lantern for Starglass): spells open foraging, foraging feeds spells.
- Rates and node respawns live in World notes ([[Ring Regions]], [[Canon Sheet]] ownership rule).

## Related
- [[Component Taxonomy]], [[Catalysts]], [[Day Night and Seasons]], [[Sanctum Stations]], [[Components]], [[Provenance]], [[Ring Regions]], [[Gift and Provenance Economy]], [[Component Dyes]], all six spellbooks

## Open threads
- Is one wildcard (Wickwax) enough, or should each borderland have a seasonal wildcard?
- Should Rot keep the shape of its source piece (as here), so a rotted Honeycomb is a big `O4` rot?
- Do regions shift their yields as they are restored ([[Restoration Loop]])? E.g. a healed Barrowfen yields fewer rot pieces and more Barrow beads.
