---
status: leaning
tags:
  - input
refs:
  - D-25
  - Q-07
  - Q-17
---

# Cast Trigger Modes

What tells the game a chord is done? Designer leaning (D-25): **thumb toggle by default**, with auto-detect as a user option.

## Options
1. **Thumb toggle** (default). Explicit and forgiving. One extra press per nybble.
2. **Auto-detect / dwell.** A chord held still for N ms commits. Faster, but fingers pass through other shapes while moving (going from `0110` to `1001` can flash `0000` or `1111`), so it needs a settle window and possibly hysteresis.
3. **Release commit** (Proposal). The chord commits when fingers lift, the way stenography keyboards work: press everything, register on release. Fits keyboards and pads well, hand tracking less well.
4. **Hybrid** (Proposal). Auto-detect in the [[Light-Up Drill]] where speed is the point; thumb in the world where mistakes cost.

## Design notes
- A wrong commit can be a feature: [[Wild Magic Overshoot]] turns misses into flavor.
- Accessibility: auto-detect helps players who can't use the thumb separately; thumb helps players with tremor.

## Related
- [[Thumb Commit]], [[Hand Tracking Detection]], [[Input Profiles]]

## Open threads
- Q-17: dwell time? 150 ms? Per-player calibration?
- Does auto-detect make the ritual feel less deliberate?
