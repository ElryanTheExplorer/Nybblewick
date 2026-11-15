---
status: proposal
tags:
  - world
  - question
refs:
  - Q-20
  - Q-50
---

# World Structure Options

How the world is laid out. This is the **Q-20** gate in [[Decision Gates]]. The designer wants "open-world, Factorio / Baldur's Gate / Elden Ring", is open to a sandbox, and could switch for something that suits the mechanic better. Four options, argued fairly.

## The options
1. **Seamless open world** (Elden Ring, Breath of the Wild as mechanic references). One continuous map, no loading seams, see a landmark and walk to it.
2. **Hub and regions** (Hades, Mass Effect, BG3's acts). A home hub plus separate authored maps reached by travel.
3. **Sandbox / procedural** (Valheim, Terraria, Factorio). A generated world per save, shaped mostly by the player.
4. **Hybrid**: the Hollow as a persistent sandbox valley, plus six hand-built [[Ring Regions]] around it, gated by utility verbs ([[Traversal and Verb Gates]]). Each region is interconnected inside, like a Metroidvania area.

## Comparison (5 = best)
| Criterion | Open world | Hub + regions | Sandbox / procedural | Hybrid |
|---|---|---|---|---|
| Chord-casting fit | 2: long walks leave the chord hand idle | 4: dense rooms, many cast targets | 3: dense only where systems are dense | 5: dense regions, systemic Hollow |
| Exploration | 5 | 2 | 4 (novelty, not authored secrets) | 4: hand-placed secrets, shortcuts |
| Sandbox room (terraforming, transport) | 4 | 1 | 5 | 4: full in the Hollow, scoped in regions |
| Art cost, isometric pixel 3D | 1: every square metre needs a look; LOD and streaming | 4 | 3: fewer authored set pieces, but many tile variants and rules | 3: one modular kit per region (~40-60 pieces) |
| Co-op | 4 | 4 | 5 | 4: host's Hollow and regions |
| Story authoring | 2: any order, hard to pace | 5 | 1 | 4: regions are chapters; verb gates set a soft order |
| **Total** | 18 | 20 | 21 | **24** |

Notes on the scores:
- **Chord fit** is the key line. A cast takes 2-10 s and should change something you can see ([[Design Pillars]] 1 and 2). Open distance is time with nothing to say. Dense, tile-based spaces echo the [[Scopeless Board]] ([[Art Direction]]).
- **Art cost**: the 3D-pixel recipe (low-res buffer, texel-snapped camera) works best with small, modular, tile-aligned kits. Seamless worlds need terrain transitions between biomes, distant views and streaming, which the low-res look hides poorly.
- **Sandbox**: procedural generation is strong for Factorio-style play but weak for the [[Story and RPG MOC]] (school storylines, order seats, set encounters).

## What each option would need to work
- Open world: fast, fun traversal from hour one (Lodestep, ferries, tethers), which conflicts with verbs being earned.
- Hub and regions: something to do between regions, or the hub becomes a menu.
- Sandbox: authored story layered on generated land (hand-built order seats dropped into a seed).
- Hybrid: a reason to keep returning to the Hollow ([[Home Valley]], [[Sanctum Loop]]) and regions that change when healed ([[Restoration Loop]]).

## How open world could still happen later
- **Build the Ring as one physical annulus** from day one: regions sit in a ring around the Hollow, and each borderland is the literal shared edge between two regions. Matching tile grids and edges mean the regions can be stitched later.
- Ship regions as separate maps; if traversal is fun (Lodestep, ley lines, ferries per [[Transport Network]]), stream them together into one map in a later version.
- The [[Expedition Loop]] works the same either way: leave the Hollow, cross a region, return.
- **Q-50:** should the Ring be built as one stitchable annulus (more upfront layout work), or six independent maps joined only through the Hollow (cheaper, but never open world)?

**Recommendation:** the **Hybrid**. It gives the sandbox the designer wants (terraforming, transport, automation in the Hollow), keeps regions dense enough for chords, keeps story authorable, and costs one modular kit per region. Lay the regions out as a stitchable annulus so open world stays possible. For the [[Prototype Roadmap]] step 3, build one Hollow plot plus the near edge of one region (the Tanglewood).

## Related
- [[Decision Gates]], [[Reference Deconstruction]], [[Ring Regions]], [[Home Valley]], [[Traversal and Verb Gates]], [[Terraforming]], [[Transport Network]], [[World MOC]]

## Open threads
- Q-50 (above).
- How big is a region? Proposal: about 160×160 tiles, 15-25 minutes to cross on foot the first time, 5 minutes once shortcuts are open.
- Does each region load as one map, or as 3-4 chunks with soft seams?
