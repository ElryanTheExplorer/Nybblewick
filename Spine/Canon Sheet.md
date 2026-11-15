---
status: proposal
tags:
  - spine
---

# Canon Sheet

Shared placeholder names and tables so notes written in parallel agree with each other. **Everything here is provisional** (status `proposal`): rename freely, but change it here first, then in the notes.

## Places
- **Nybblewick**: the hub town at the heart of the home valley. A *wick*-town (Old English *wic*, settlement): its lamps are lit by casts. See [[Name - Nybblewick]].
- **The Hollow** (placeholder): the home valley around Nybblewick. Persistent sandbox; your sanctum is here.
- **The Ring**: six regions around the Hollow, arranged in [[Rivalry Ring]] order. Each region leans toward one school's components. **Borderlands** between ring neighbors yield dual components ([[Hybrid Spells]]).

Ring order (each neighbor pair shares a borderland):
**Astral → Alchemy → Bloom → Necro → Smith → Wayfarer → back to Astral**

Why this order: Bloom and Necro touch (they share [[Rot]], D-07); Smith and Wayfarer touch (their borderland is the [[Storm]] seam, Q-04); Wayfarer and Astral touch (navigating by stars); Astral and Alchemy touch (astrological alchemy).

| Region (placeholder) | School lean | Biome | Example components (tags) |
|---|---|---|---|
| The Glasshigh | [[Astral]] | high moors, observatory ruins, clear night skies | Starglass (astral), Moonsilver (astral ×2) |
| The Saltings | [[Alchemy]] | salt marsh, hot springs, sulfur vents | Salt pinch (alch, charges), Retort (alch ×2, charges) |
| The Tanglewood | [[Bloom]] | old forest, overgrowth | Mugwort (bloom, freshness), Moss mat (bloom ×2, freshness) |
| The Barrowfen | [[Necro]] | fens, barrows, peat | Rot (from spoiled Bloom components), Grave-wax (rot) |
| The Ironreach | [[Smith]] | iron hills, storm ridges | Iron nail (smith), Hearth coal (smith, heat) |
| The Crossings | [[Wayfarer]] | river plains, old roads, ferries | Waybone (way ×2), Lodestone (way) |

| Borderland | Pair | Example dual component |
|---|---|---|
| Starsalt Flats | Astral + Alchemy | Starsalt (astral + alch) |
| Fungal Springs | Alchemy + Bloom | Tincture moss (alch + bloom) |
| The Mulch | Bloom + Necro | Ghostcap (bloom + rot) |
| Grave Forges | Necro + Smith | Grave iron (rot + smith) |
| Stormline | Smith + Wayfarer | Struck lodestone (smith + way) |
| Star Roads | Wayfarer + Astral | Compass glass (way + astral) |

Rare duals that are *not* ring neighbors (e.g. Meteoric iron = smith + astral, Struck oak = bloom + smith, from the prototype) come from events such as meteor falls and lightning strikes, not from borderlands.

## Component tags and per-school behavior
Tags (from the prototype): `astral, alch, way, bloom, smith, rot, any`. Components also carry **quality**, **shape** (polyomino), **provenance** (where and how they were found) and sometimes a **state**.

| School | Component behavior (prototype rules) |
|---|---|
| Astral | Pattern: 2+ astral contributors in one row or column = constellation bonus |
| Alchemy | Charges: spent per cast, the component vanishes at 0 |
| Wayfarer | Motion: can swap or pull components on the board |
| Bloom | Freshness: decays over time, becomes Rot at 0 |
| Smith | Heat: gains heat per cast, overheats (provides nothing) at 3 for a while |
| Necro | Raises Rot: consumes rotten components, drains freshness from living neighbors |

## Orders (one per school, placeholder names)
| School | Order | Seat |
|---|---|---|
| Astral | The Starwatch | an observatory in the Glasshigh |
| Alchemy | The Retort | a guild-house on the Saltings |
| Bloom | The Hedge Circle | a grove in the Tanglewood |
| Necro | The Barrow Wardens | a barrow-hall in the Barrowfen |
| Smith | The Anvil Hall | a forge-town in the Ironreach |
| Wayfarer | The Waymarch | a ferry-station in the Crossings |

Storm (Q-04) has no order. It appears as a **hook** in the Smith and Wayfarer storylines and the Stormline borderland.

## Premise working titles (tone undecided: all three are sketched)
- **P1 The Hidden Machine**: earnest folk magic, slowly revealed to be computation (nybbles, circuits, seals).
- **P2 The Long Dusk**: a faded world rebuilt with utility magic; melancholic but hopeful.
- **P3 The Wick Fair**: cozy and whimsical; community, seasons, gentle stakes.

## Shared terms
- **Standing**: your relationship with an order or a town. Gates story and services. *No currency.*
- **Notoriety**: a visible consequence of subterfuge or broken oaths (multiplayer).
- **Oath**: an opt-in vow with a boon; breaking it costs Standing and adds Notoriety.
- **Resources**: Components (with quality and provenance), Knowledge (spells, pages, runes, pacts), Standing, and **world state** (restored land, built roads, grown gardens). **No gold.**
- **Progression axes**: Fluency (player skill), Grimoire (spells known, via Voice storylines, D-08), Cloak (board capacity), Familiar / Pact (D-08), Runes (seals that open places, D-08), Sanctum (stations), Standing.

## Rulings from the pass-2 consistency review (proposals)
Where notes disagreed, this is the version every note follows.

**Words**
- **Wick words:** *Nybblewick* is the town. *The Wick* is the ancient lamp at its heart: it is lit (dim) in the prologue and burns at full strength only at the end. A player's Notoriety light is their **lantern** (Clear, Smoking, Guttering, Snuffed). The QTE timer is a **fuse**. *Wickwax* is the Fair's rare.
- **Page:** means a board page only ([[Grimoire Pages]]). Other grimoire things are **leaves** (the flowchart leaf, the duel leaf, the scratch leaf). Knowledge spent on upgrades is **notes**.
- **Bound spell:** a spell chorded once into a station socket that keeps running on Spark (formerly "standing spell", renamed to avoid clashing with Standing).
- **Raid seats:** Anchor, **Caller**, Weaver, Reader ("Voice" is reserved for D-08).
- **Quality:** Plain, Fine, Storied. Quality never changes power; it changes state and story. A place-resonance bonus is only an option under Q-31.
- **Astral:** gets a **full-moon bonus**, not a "charge" (charge is Alchemy's state).

**Time**
- **Two calendars:** *in-game seasons* are personal and run on play time (7 play-days each). *Contest seasons* are shared and real-world (one per quarter) and exist only for the [[Community Layer]] and the [[Seasonal Contest Loop]]. Missing a contest season costs nothing you already have; this is the only exception to the no-real-world-clocks rule.
- **The Wick Fair** is one real-world Fair week at the end of each contest season. Wickwax drops there.

**Co-op and scenes**
- **Co-op scenes:** the host decides; guests' casts add options.
- **QTE outcomes:** clean, late or wrong, each with its own authored branch. Retrying a scene ("Rewrite") is only an accessibility option, under Q-42.
- **Duels:** [[Formal Duels]] owns the visibility rule. Each duelist declares a spell list, the opponent's hands become readable after the row commit, and sleeving a hand costs a round.

**Pacts, places, doors**
- **Familiars:** a Pact grants a *sense* (night sight, scent, tremor...). Species is a look only.
- **Places:** the Starwatch's seat is the **Starwatch Observatory**; the ruin is **the Old Orrery**, reached by the Orrery Stair.
- **Waydoors** come in two kinds: fixed doors to Nybblewick, opened by restoration, and player-placed doors made with the Twin keys catalyst.

**Sanctum**
- **Station tiers:** tier 2 needs Trusted Standing with the matching order; tier 3 needs Kin plus region stage 3.
- **Furniture vs stations:** the Loom, Wardrobe, lectern, dye vat and practice candle are furniture. They don't count toward the 6-station cap and don't generate anything.

**Failure**
- **Fainting:** hazards build **Strain** while you stay inside them. Full Strain = you faint and wake at the last waystone with everything you carried. Nothing else causes fainting; there is no health bar.

**Spells added to close gaps** (owned by the spellbooks)
- Astral: *Project* (astral projection), *Unweave* (dispel an illusion or ward), *Star-step* (a short bridge of light)
- Wayfarer: *Lay road* (roads and channels)
- Alchemy: *Drain* (draw off water and brine)
- Bloom: *Upheave* (raise ground, shift a stream)
- Necro: *Remembered path* (follow the dead's old ways)
- *Blink* is an old prototype name for Lodestep. *Sprout a bridge* means Root bridge.

## Ownership rules (which note decides what)
- Anything with **numbers** (rates, caps, costs) lives in World/Sanctum notes; anything that is **only looks** lives in Customization notes.
- **Standing** (orders, towns) → Story/RPG notes. **Notoriety and Oaths** → Multiplayer notes.
- **Branch content and flowcharts** → Story notes. **Scene input and camera grammar** (QTEs, shots) → Presentation notes.
- **Cloak capacity and layout** → Spells/loadout notes. **Cloak appearance** → Customization notes.
- **Components and recipes** → Spells notes (this sheet holds the region/tag table). World notes only reference components.
- **Terraforming and transport systems** → World notes; the **spells** that do them → Spells notes; the **story** around them → Story notes.
- **Seasons calendar** → World notes. **Seasonal contests** → Multiplayer notes.

## Constraints every note respects
- D-04: schools are never tied to board rows or regions of the board.
- D-08: Voice, Pact and Rune are the progression base, not new schools.
- D-21 / D-27: combat is not the core; conflict is consensual, ritual and costly.
- Q-01 is open: rewards and recipes must work whether casts consume components or only require them.
- Necro is not a villain; Rot is an ecological force both Bloom and Necro tend.
