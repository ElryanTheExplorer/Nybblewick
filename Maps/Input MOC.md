---
tags:
  - moc
  - input
---

# Input MOC

How a hand becomes a spell address.

## Core
- [[Chorded Nybble]]: 4 fingers = 4 bits
- [[Finger Bit Values]]: index 8, middle 4, ring 2, pinky 1
- [[Polarity]]: 0 closed, 1 open
- [[Two-Chord Addressing]]: row, then column
- [[Thumb Commit]]: the thumb locks each nybble
- [[Cast Trigger Modes]]: thumb toggle vs auto-detect vs release
- [[Cast Flow]]: address, then aim, then loose

## Edge behavior
- [[Wild Magic Overshoot]]: out-of-range columns warp instead of failing
- [[Finger Cost]]: how expensive a cell is to chord
- [[Gray Code Board]]: neighbors one finger apart

## Abstraction and devices
- [[Input Profiles]]: devices map to T I M R P
- [[Device Mappings]]: keyboard, numpad, drumpad
- [[Handedness]]
- [[Two-Handed Bytes]]
- [[Chord Timing Layers]] (mostly superseded)

## Body
- [[Finger Anatomy]]
- [[Hand Tracking Detection]]

See also [[Hardware MOC]], [[Learning MOC]].
