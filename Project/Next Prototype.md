---
status: proposal
tags:
  - project
---

# Next Prototype

What to build next in `game/` so the [[Loop Stack]] gets tested, not just written. It follows [[Prototype Roadmap]] step 3 (vertical slice), using what already works (ChordInput, Light-Up Drill, Style Room).

## Slice: "One small expedition"
A ten-minute loop through all four layers of the Loop Stack, in miniature:

1. **Sanctum (start):** a tiny room in the Hollow with the cloak board. Pack 3-4 components into sockets ([[Polyomino Spells]], [[Sockets and Components]]). One station (a Bloom garden) has grown a Mugwort since last time ([[Sanctum Stations]]).
2. **Travel:** one Ring-region room (reuse the Style Room) with a blight patch, a dark corridor and a broken plank bridge ([[Encounter Types]]).
3. **Encounter:** read it with a short [[Astral Projection]] peek (camera swap only), then solve with utility verbs: Kindle the corridor, Sprout over the blight, Lodestep across the gap.
4. **Story beat:** a 30-second scene with one wary spirit: two choices and one [[Chord QTEs|chord QTE]] (failure branches the outcome, never ends the slice) ([[Story Scene Structure]]).
5. **Return:** the corridor stays lit and the bridge stays mended on the next visit ([[Restoration Loop]]); +Standing with one order ([[Standing]]).

## What it answers
- Does arranging components before leaving feel like preparation, or like homework? ([[Design Pillars]] #3)
- Do persistent world changes feel rewarding enough without loot? (D-28, Q-25)
- Can a chord QTE read well and feel fair for slow casters? (D-20)
- Does a camera swap (iso → astral) cost the input anything? ([[Input Budget per Mode]])

## Build order (each step playable)
1. ✅ *(built 2026-11-14 as the Cloak Board scene)* Board-as-loadout UI: drag components onto the 6x9 board; spells read sockets. Port the prototype rules from `_sources/` (socket fill, power, charge/heat/freshness).
2. World persistence: a tiny save of changed tiles (light, growth, bridges).
3. Astral camera swap with a vignette.
4. Scene runner: text, two choices, one chord QTE driven by the drill's target logic.
5. One sanctum station with an offline-safe timer ([[Anti-Chore Rules]]).

## Open threads
- Should the slice use real art (Blockbench models) or stay procedural until the loop is proven?
- Does the slice need co-op at all, or should co-op get its own prototype ([[Ritual Raid Loop]])?
