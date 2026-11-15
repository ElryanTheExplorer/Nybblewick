---
status: proposal
tags:
  - presentation
  - camera
  - input
refs:
  - D-15
  - D-16
  - D-20
  - Q-71
---

# Input Budget per Mode

Every camera mode must say what the chord hand does ([[Not Doing]]). Two hands, five logical inputs (T I M R P, [[Input Profiles]]) plus whatever the other hand holds.

## The core conflict
- D-16: the **right** hand casts by default. D-15: after a cast readies, the **mouse** aims.
- On keyboard + mouse most players mouse with the right hand. The right hand can't chord on `7 8 9 0 b` and hold the mouse.
- Options:
  1. **Hand hop**: chord with the right hand, then move it to the mouse to aim. Slow; fails pillar 1.
  2. **Left chords on keyboard + mouse**: `space + 4 3 2 1` (prototype layout), mouse in the right hand. D-16 still holds for pads, tracking and numpad-only play.
  3. **No mouse aim**: aim snaps to the facing tile or the nearest valid target, as in the Style Room prototype.
- **Recommendation:** read D-16 per device. On keyboard + mouse the default chord hand is **left**, mouse right; on every other device the right hand casts. Option 3 is the fallback aim for any mode with no free hand. Flagged for the designer (Q-71).

## Per mode (keyboard + mouse, recommended layout)
| Mode | Chord hand (left) | Other hand (mouse) | Movement | Disabled |
|---|---|---|---|---|
| Iso exploration | Casts | Click to move; aim and LMB after a cast readies; RMB zoom | Mouse click (no WASD) | Nothing |
| Over-the-shoulder | Casts, but **casting roots you** | Mouse look and aim | WASD shares the left hand: you stop to chord | Moving while a chord is in progress |
| Astral view | Projected spells only (mark, lure, whisper) | Move the projection by click; aim marks | Click | Physical spells, loot, doors |
| Cinematic scene | QTEs, cast beats, dialogue choices as one-finger chords (index = 1st option… pinky = 4th) | Optional: click choices instead | None | Free camera, movement |
| First-person duel | Casts against the duel board | Glance (up = opponent, down = cloak); aim if the spell needs it | None (a duel is a rite, you stand) | Movement, inventory sorting |
| 2.5D segment | Chording moves to the **right** hand (`7 8 9 0 b`, D-16 restored); casts **only on footholds** (standing still) | Unused, so it's free to chord | Left hand: `A`/`D` move, `W` jump | Mouse aim (aim follows the side plane); mid-air casting as a requirement |

## Other devices
- **Numpad (right) + keyboard (left):** best fit for 2.5D and over-the-shoulder: left hand on `WASD`, right on the numpad. Mouse aim is replaced by option 3.
- **Keyboard only (right, `7 8 9 0 b`):** left hand moves with `WASD`; aim uses option 3; `Tab` cycles targets.
- **Drumpad:** both hands sit on pads. Movement comes from the spare pads (layout waits on Q-08) or from click-to-move with a mouse placed to the side. 2.5D on drumpad uses three spare pads: left, right, jump.
- **[[Two-Handed Bytes]]:** occupies both hands, so it's allowed only in modes with no movement: cinematic scenes, duels, rituals.

## Rules that keep it fair (D-20)
- Nothing in any mode needs a chord while moving. Movement and chording take turns.
- A mode switch never interrupts a chord ([[Context Camera Modes]]).
- Every mode supports auto-aim (option 3) as an accessibility setting.

**Q-71:** On keyboard + mouse, does the left hand chord by default (D-16 read per device), or does the right hand chord and aiming go keyboard-only?

## Related
- [[Cast Flow]], [[Handedness]], [[Device Mappings]], [[Cast Trigger Modes]], [[Context Camera Modes]], [[2.5D Segments]], [[Chord QTEs]]

## Open threads
- Is "casting roots you" a feature (stance, ritual weight) or a frustration in over-the-shoulder?
- Do one-finger dialogue choices teach the bit values (index = 8) or confuse them?
- Could a foot pedal be the thumb for drumpad players who need a hand free?
