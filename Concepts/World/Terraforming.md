---
status: proposal
tags:
  - world
  - system
refs:
  - Q-55
---

# Terraforming

**Purpose:** let casts reshape land so the change stays ([[Design Pillars]] 2, "the land answers").
**Inputs:** casts with components; the tile's current state.
**Outputs:** persistent tile changes: soil, water, paths, light, growth, rot.
**Player verbs / chords:** grow, mend, dissolve, preserve, forge, light, ferry, raise. The spells themselves live in the school spellbooks ([[Bloom Spellbook]], [[Alchemy Spellbook]] and others).

## How it works
Each tile stores six small state values, each 0-3 (two bits each, so a tile's whole state fits in 12 bits):

| Layer | 0 → 3 | Raised by | Lowered by |
|---|---|---|---|
| Soil | barren → rich | Bloom (Mend, Greening), Necro (compost rot) | Alchemy (salt), grey blight |
| Water | dry → flooded | Alchemy (springs), Wayfarer (Lay road channels), Bloom (Upheave shifts a stream) | Alchemy (Drain), Smith (Kindle heat), Bloom (Upheave raises ground) |
| Path | wild → paved road | Wayfarer (Lay road), Smith (Forge stone) | Bloom (overgrow) |
| Light | dark → lamplit | Astral (Wisp lantern), Smith (Hearthstone) | Bloom (canopy), storms |
| Growth | bare → old wood | Bloom (Sprout, Greening) | Necro (Wither), Smith (Kindle), Alchemy (dissolve) |
| Rot | clean → blighted | untended Rot, spoiled Bloom | Necro (raise and consume), Bloom (tend, Mulch turn) |

- Layers interact: rich soil + water 1-2 lets growth spread one tile per day; rot 3 next to growth 2+ spreads the grey blight; light 2+ marks a safe path on the Glasshigh's drifted moor.
- Every change can be undone by another school. Nothing is one-way.
- Changes in a region count toward its [[Restoration Loop]] where they heal a wound.

## Persistence
- **Hollow:** permanent; the player's sandbox ([[Home Valley]]).
- **Regions:** permanent in restored areas. Unrestored areas slip one step per day toward their mood until the local wound is healed (grey blight creeps back over Tanglewood tiles near an untended Mulch).
- **Co-op:** changes made in the host's world persist in the host's world. **Q-55:** does the guest get anything in their own world (a mirrored road, a Standing gift, a [[Provenance]] keepsake)? Lean: a keepsake and Standing, never land.

## Limits and anti-chore rules
- **Protected tiles:** landmarks, story sites, town buildings and waystones never change.
- **Route guard:** a change that would cut the only route to a required place fizzles ("the land refuses"). Checked with a simple path test on cast.
- **Area capacity:** each region chunk accepts a set number of player-made features (default 40 roads, ponds, groves or lamps), so the map stays legible and saves stay small. The Hollow's limit is plot size only.
- **No upkeep:** finished terraforming never needs re-casting. Drift only affects unhealed land, never what you built.
- **Scale cap:** one cast changes at most a 3×3 area; large works are rituals or bound spells.

**Recommendation:** use the six two-bit layers. They are cheap to store and render (one tile kit variant per layer value), easy to read, and each school owns a clear pair of verbs.

## Scope cost
M. Six layers × 4 values needs tile variants per biome, but the rules are small. Start with three layers (growth, light, water) in the slice.

## Related
- [[Transport Network]], [[Automation]], [[Ring Regions]], [[Day Night and Seasons]], [[Rot]], [[Utility-First Pivot]], [[World MOC]]

## Open threads
- Q-55 (above).
- Should state values show as hex on a debug overlay or the Astral Skychart spell ([[Binary to Hex Teaching]])?
- Do seasons temporarily shift layers (winter freezes water 2 into walkable ice)?
