---
status: proposal
tags:
  - spell
  - board
  - school
refs:
  - Q-01
  - Q-02
  - Q-31
---

# Component Taxonomy

Every component carries six properties. Together they decide where it can go, what it powers, and what story it tells. The full list of components lives in [[Component Catalog]].

## The six properties
| Property | Values | What it does |
|---|---|---|
| **Tags** | `astral, alch, bloom, rot, smith, way, any` (one or two; a few rares carry two schools) | Fill matching sockets. A two-tag component offers both, so it can fill two sockets. `any` only fills `{any}` sockets. |
| **Shape** | polyomino: `1×1`, `I2`, `L3`, `I3`, `O4` | Takes pockets. A big component borders more spells and can serve two at once ([[Sockets and Components]]). |
| **State** | charge, heat, freshness, rot (see below) | The school's clock. Changes over casts or time. |
| **Quality** | Plain, Fine, Storied | See below (Q-31). |
| **Provenance** | where, when, how and from whom it was found | Social and story weight; sometimes a small mechanical twist ([[Provenance]], [[Gift and Provenance Economy]]). |
| **Rarity** | Common, Borderland (dual), Event (off-ring dual), Catalyst | Where it can come from ([[Component Catalog]], [[Catalysts]]). |

## States and how each school plays on the board
The Canon table's behaviors, read as board play:

| School | State | On the board | Layout lesson |
|---|---|---|---|
| [[Astral]] | none (pattern); a **full-moon bonus**, not a charge | 2+ astral contributors in one row or column of a spell's neighbors = ×1.5 power | Line your Starglass up. Placement *is* power. |
| [[Alchemy]] | **charge** (e.g. Salt pinch 3, Retort 4) | Each cast that draws on it spends 1; it vanishes at 0 | Put flasks where only your rare spells reach them. |
| [[Wayfarer]] | none (motion) | Wayfarer spells can swap or pull components across the board mid-cast | Leave a Lodestone near the pieces you'll want to move. |
| [[Bloom]] | **freshness** (Mugwort 9, Moss mat 6) | Ticks down over time; at 0 the tag becomes `rot` | Living things are a clock: use them early, or plan their rot. |
| [[Smith]] | **heat** | +1 per cast; at 3 it overheats and offers no tags for a while | Spread metal so two Smith spells don't cook one nail. |
| [[Necro]] | **rot** | Necro spells consume rotten components and drain 2 freshness from living neighbors | Keep Necro spells away from your fresh Bloom, or next to the Bloom you *want* to spoil. |

Anti-chore guard ([[Anti-Chore Rules]]): freshness only ticks in play time, and stops in sanctum storage. Nothing rots while you're offline.

## Quality tiers (Q-31)
- **Plain:** the default.
- **Fine:** one extra state point (a 4-charge Salt pinch, a 12-freshness Mugwort) *or* heat cap 4 instead of 3.
- **Storied:** Fine, plus a provenance that NPCs recognise ("grave-wax from the Warden's own candle"). Opens dialogue, can be a story key.

Quality **never changes power**; it changes state and story ([[Canon Sheet]] ruling).

**Q-31:** Is that enough, or should place matter too?
- **A. As above:** quality = state and story only.
- **B. Place resonance (option only):** a component used in its home region gives a small non-power bonus (a longer-lasting effect).

**Recommendation:** A. Power stays filled/total, readable at a glance. Resonance stays an option to test later.

## Under both Q-01 outcomes
| | Casts **consume** | Casts only **require** |
|---|---|---|
| Charge | Spent per cast, gone at 0 | Spent per cast, **refills at a waystone or the sanctum** |
| Heat | Unchanged | Unchanged |
| Freshness | Spent per cast *and* by time | Time only |
| Rot | Necro consumes rotten pieces | Necro "borrows" rot; the piece turns to Peat (a common) after 3 raises |
| Foraging pressure | High: foraging is the loop | Lower: foraging is for new tags, quality and catalysts |

**Recommendation:** keep the prototype's per-school mix (the "require, but states wear" middle). It keeps each school's clock distinct and works with either final answer, since only Alchemy charge and Necro rot would need a refill rule.

## Related
- [[Components]], [[Component Catalog]], [[Catalysts]], [[Spell Anatomy]], [[Component Consumption]], [[Mana Pips vs Pool]], [[Rot]], [[Component Dyes]]

## Open threads
- Q-31 above.
- How big is the Astral full-moon bonus, and does it stack with the constellation ×1.5?
- Do Wayfarer components need a downside, since they have no clock? Proposal: Lodestones pull each other, so two on a page drift together after a cast.
- Is "Storied" a quality tier or just provenance? They may be one property.
