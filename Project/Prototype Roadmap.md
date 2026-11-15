---
status: proposal
tags:
  - project
---

# Prototype Roadmap

Prototype the two big risks **separately**, then join them:
1. **Does chording feel good?** (input)
2. **Does the world look right?** (art)

Status 2026-11-13: steps 1 and 2 have a first pass in Godot (`game/`, see [[Prototypes]]). Step 3 is specified in [[Next Prototype]].

| Step | Build | Answers | Medium |
|---|---|---|---|
| 1 | Nybble trainer: [[Light-Up Drill]] + switchable [[Cast Trigger Modes]], logs time/errors per nybble | Is the input fun? Which trigger mode? | Browser JS (reuse the cloak proto's input code) |
| 2 | Style test: one isometric room, one character, one torch, one spell effect, same scene in each engine tried | Which medium nails the look? | Godot 4 / Three.js / others |
| 3 | Vertical slice: walk a small grid dungeon, chord 3-4 utility spells (light, open, grow) at objects | Does it work together? | Winner of step 2 |
| 4 | Pick a loop from [[Gameplay Loop Candidates]] and build one cycle of it | Is there a game? | same |

Keep the chord layer engine-agnostic: input profiles → nybble → address. Port it as a small module per engine ([[Input Profiles]]).

Related: [[Scope Tiers]], [[Art Direction]], [[Prototypes]]

## See also (pass 2)
- [[World Structure Options]]
