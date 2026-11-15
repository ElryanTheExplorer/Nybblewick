---
status: proposal
tags:
  - spine
  - question
refs:
  - Q-20
  - Q-21
  - Q-22
  - Q-23
  - Q-24
  - Q-25
  - Q-26
---

# Decision Gates

The big forks, each one an open question in [[Open Questions]]. Each gate has a recommendation; **nothing here is decided** until the designer says so.

| Gate | Question | Recommendation | Why |
|---|---|---|---|
| World structure | Q-20 | Hub and regions: a persistent sandbox valley (the Hollow) plus six hand-built Ring regions, **gated by utility verbs** (spells as keys). Open world later, if traversal spells make travel fun. | Chord casting needs dense things to interact with, not distance. Isometric pixel art is costly per square metre. See [[World Structure Options]]. |
| Premise and tone | Q-21 | Keep all three sketches until the school storylines exist, then choose by which premise gives the best school conflicts. Lean: The Hidden Machine (ties hex and seals into the plot). | See [[Premise Options]]. |
| Role of combat | Q-22 | Threats are encounters (hazards, spirits, blight, bargains); bosses are rituals; player conflict is duels and subterfuge only. | D-21, D-27, [[Encounter Types]]. |
| Camera-mode budget | Q-23 | Launch with isometric exploration and cinematic scenes. Add the first-person duel view next, 2.5D segments last. | Every mode multiplies art and input work. See [[Context Camera Modes]], [[Input Budget per Mode]]. |
| Multiplayer ceiling | Q-24 | Solo plus 1-4 drop-in co-op, and an async community layer. No persistent shared world. | User choice for this pass; netcode and griefing cost. See [[Drop-In Co-op]], [[Community Layer]]. |
| Economy depth | Q-25 | No currency. Components, Knowledge, Standing and world state are the only resources; trade is gifting and barter. | D-28, [[Incentive Model]]. |
| "Wizard setup" | Q-26 | Treat as **both** the sanctum (stations and decor) and the loadout (cloak and grimoire). | Ambiguous in the brainstorm; see [[Sanctum Stations]], [[Loadout Presets]]. |

## What the pass-2 notes recommend
- **Q-20 World:** hybrid, built as one stitchable ring-shaped map (annulus) so open world stays possible later (Q-50) ([[World Structure Options]]).
- **Q-21 Premise:** P1 The Hidden Machine as the core, borrowing P2's restoration arc and P3's Wick Fair as the seasonal festival ([[Premise Options]]).
- **Q-22 Combat:** six encounter types make up all of PvE; bosses are graded rituals with seats and never wipe the party; fainting is the only failure ([[Encounter Types]], [[Ritual Raid Loop]]).
- **Q-23 Cameras:** launch with isometric, cinematic and astral (astral = the isometric camera plus a shader); first-person duel next; over-the-shoulder free roam after that; 2.5D last, starting with seal interiors ([[Context Camera Modes]]).
- **Q-24 Multiplayer:** solo plus 1-4 drop-in co-op plus the async [[Community Layer]]; no persistent world.
- **Q-25 Economy:** no currency. Standing does what money would, gifts and fixed fair swaps handle exchange, offerings act as sinks ([[Gift and Provenance Economy]], [[Standing]]).
- **Q-26 Setup:** both: [[Sanctum Stations]] and [[Sanctum Decor]] for the sanctum, [[Loadout Presets]] and [[Cloak Appearance]] for the loadout.
- **Q-01:** a per-school mix ("require, but states wear"), worked through under both outcomes in [[Component Taxonomy]] and [[Incentive Model]].
- **Q-02:** typed socket pips, kept as a list of requirements ([[Spell Anatomy]]).
- **Q-03:** launch origins Astral, Alchemy, Wayfarer, Bloom (D-05); Smith and Necro splash-only at first ([[Origins and Splashing]]).
- **Q-04:** Storm stays a Smith + Wayfarer seam, with a shared Stormline chapter ([[Smith Storyline]], [[Wayfarer Storyline]]).
- **Q-05:** Necro sits between Bloom and Smith in the Canon ring.
- **Q-10:** keep both: the familiar scouts physically, astral projection gathers information ([[Astral Projection]]).
- **Q-19:** both: in-fiction lessons plus a practice candle in the sanctum; the same code runs every QTE ([[Chord QTEs]]).

Older gates still open: Q-01 consumption, Q-02 pips vs pool, Q-03 starting school count, Q-04 Storm, Q-07 thumb role, Q-16 core loop (proposed answer in [[Loop Stack]]).

## Related
- [[Design Pillars]], [[Not Doing]], [[Reference Deconstruction]]
