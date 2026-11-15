---
status: leaning
tags:
  - project
  - art
---

# Art Direction

Designer leaning: **old dungeon-crawler pixel look, probably 3D, isometric.** Several engines/mediums will be tried.

## Designer notes 2026-11-15
- Saw the Style Room: "it does look cool", but the dungeon crawler is **not the main thing**. Keep the vibe, don't make it the genre.
- Camera: isometric-ish, but the camera can probably **rotate around the character**, somewhere between isometric and third person. Will experiment and can change later (Q-78).
- Visual direction will come from the designer's Are.na boards, backed up to `_arena/` (see [[References]]).

## The "3D pixel" recipe (Proposal)
- Orthographic camera at isometric angle (45° yaw, ~30-35° pitch).
- Render the 3D scene to a **low-res buffer** (e.g. 320x180 or 480x270), upscale with **nearest-neighbor** at integer scale.
- **Snap the camera to the texel grid** so pixels don't shimmer when it moves.
- Low-poly models, tiny textures with nearest filtering, a limited palette (posterize or palette-lookup shader).
- Optional: outlines from depth/normal edge detection, dithered lighting.

## Fits the design
- Dungeons on a tile grid echo the [[Scopeless Board]]: cells, addresses, adjacency.
- Isometric is already the base view ([[View Modes]]), and [[Familiar Vision]] works naturally with fog over tiles.

## Open threads
- Palette size? Fixed palette per biome or per school?
- Hand/spell UI: pixel-art overlay, or a hand-drawn grimoire layer over the pixel world?

Refs: [[References]]

## See also (pass 2)
- [[Component Dyes]]
