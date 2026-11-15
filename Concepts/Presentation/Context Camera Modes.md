---
status: proposal
tags:
  - presentation
  - camera
refs:
  - D-12
  - Q-23
  - Q-70
---

# Context Camera Modes

The camera changes with what you're doing. All six modes are **camera rigs over the same 3D scene**, rendered into the 480x270 dithered buffer ([[Art Direction]]). A new mode costs a rig, input rules and some art, not a new renderer.

## The modes
| Mode | Camera | Triggers | Leaves when |
|---|---|---|---|
| **Isometric exploration** | Orthographic, 45° yaw, ~30° pitch, texel-snapped | Default outdoors and in the Hollow (D-12) | Any other trigger |
| **Over-the-shoulder** | Perspective, behind and right of the wizard, low FOV | Tight interiors, towns, walking conversations | Leaving the volume |
| **Astral view** | Iso rig detached from the body, wider zoom, spirit-layer shader | Casting [[Astral Projection]] (or [[Familiar Vision]] via a Pact) | Recall, tether limit, timer |
| **Cinematic scene** | Authored shots from markers placed in the level | A story scene starts ([[Cinematic Scenes]]) | Scene ends |
| **First-person duel** | Eye height, hands and open cloak in frame | Both players accept a [[Formal Duels]] challenge | Duel resolves |
| **2.5D segment** | Orthographic side view locked to a spline | Entering a marked volume: cliff, cutaway, seal interior ([[2.5D Segments]]) | Exiting the spline |

## Transitions
- **Dither dissolve** (default): the old frame breaks into the 16-color dither pattern and re-forms as the new one. Cheap, fits the look, and hides the jump between orthographic and perspective.
- **Hard cut**: inside cinematic scenes, and for snap-backs from astral view (the jolt *is* the fiction).
- **Rig blend**: iso ↔ over-the-shoulder only, ~0.6 s, since both follow the body.
- Rule: a transition never happens mid-chord. If a chord is half-entered, the switch waits for commit or cancel.

## Who controls the switch
- **Context** picks the mode; the player never has to manage cameras to progress.
- **Optional toggle** in exploration: iso ↔ over-the-shoulder on one key, for players who prefer it. Astral view is a spell, not a toggle.

## Launch budget (Q-23)
| Tier | Modes | Why |
|---|---|---|
| Launch | Iso exploration, cinematic scene, astral view | Astral view reuses the iso rig plus a shader; cinematic shots reuse level sets |
| Next | First-person duel | Needs 16 hand poses on screen ([[Pose Animation Budget]]) |
| Later | Over-the-shoulder free roam | Needs WASD-style movement ([[Input Budget per Mode]]) |
| Last | 2.5D segments | Platforming is its own discipline |

**Recommendation:** at launch, the over-the-shoulder framing exists **only as a shot type inside cinematic scenes**, not as a free-roam mode. That gets the Detroit-style mix of third person and cinematic shots ([[Reference Deconstruction]]) without a second movement scheme.

**Q-70:** Is over-the-shoulder a free-roam exploration mode, or only a shot type in scenes?

## Related
- [[View Modes]], [[Input Budget per Mode]], [[Astral Projection]], [[In-the-Coat Duel View]], [[Cinematic Scenes]], [[2.5D Segments]], [[Decision Gates]], [[Presentation MOC]]

## Open threads
- Does each region get one signature mode moment (a 2.5D cliff in the Ironreach, an astral sky in the Glasshigh)?
- Can VR (D-12) be the first-person duel rig with head tracking, and nothing more?
- Should the palette shift per mode (astral = cold ramp, cinematic = warmer, duel = high contrast)?
