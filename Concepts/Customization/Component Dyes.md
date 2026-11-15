---
status: proposal
tags:
  - customization
  - art
  - board
refs:
  - Q-01
  - Q-76
---

# Component Dyes

Color comes from components. You dye drip, cloak and spell effects with what you forage, so your colors say where you've been.

## What can be dyed
- **Drip:** robe, hat, ribbons ([[Wizard Drip]]).
- **Cloak:** shell and lining separately ([[Cloak Appearance]]).
- **Spell effects:** the tint of a school's indicator and particles ([[Themed Indicators]]). The **shape** stays; only the color ramp shifts.
- **Familiar:** fur, feathers, accessories ([[Familiar Customization]]).

## Region colors (from the [[Canon Sheet]] biomes)
| Region | Dye ramp | Source example |
|---|---|---|
| The Glasshigh | Night blue → silver | Starglass, Moonsilver |
| The Saltings | Bone white → sulfur yellow | Salt pinch, Retort |
| The Tanglewood | Moss green → umber | Mugwort, Moss mat |
| The Barrowfen | Peat brown → bruise violet | Grave-wax, Rot |
| The Ironreach | Rust → ember orange | Hearth coal, Iron nail |
| The Crossings | River teal → ochre | Waybone, Lodestone |
- **Borderland** components give blended ramps (Starsalt: blue-white; Ghostcap: pale green-violet).
- **Provenance** shifts the shade: Mugwort picked at dawn is paler than at dusk; a meteor-fall Meteoric iron gives a one-off "starfall" ramp.

## Spell tint from provenance (free, automatic)
- A spell cast with sockets filled by Barrowfen components carries a faint peat-violet edge. It doubles as a readout of what's in your sockets. Can be turned off.

## Alchemy dye recipes (examples only; the final recipes live in the [[Alchemy Spellbook]])
| Dye | Recipe | Notes |
|---|---|---|
| Marsh green | Salt pinch + Mugwort | Starter dye |
| Moon wash | Moonsilver + Salt pinch | Lightens any ramp one step |
| Ember lacquer | Hearth coal + Retort | Only sets on metal (rings, staff caps) |
| Mourning ink | Grave-wax + Starsalt | Deep violet-black for markings |
- Dyeing happens at the **dye vat**, a piece of sanctum furniture: it isn't a station, doesn't count toward the station cap and generates nothing ([[Sanctum Stations]]). Dyeing is crafting, not a cast, so it works whichever way Q-01 lands.

## The 16-color constraint
The prototype renders a 16-color dithered palette ([[Prototypes]]). Options:
1. **Ramp swap:** each character uses 3-4 palette ramps; a dye swaps one ramp for another. Global palette grows to ~24-32 colors.
2. **Fixed 16:** dyes pick among existing ramps only; dither patterns ("weaves") add variety.
3. **Per-region palette:** each region has its own 16; dyes from elsewhere are remapped to the nearest color.
- **Recommendation:** option 1. It keeps the dithered look and makes region dyes truly distinct.

## Readability
- Reserved colors (cell glow, XOR feedback, Notoriety marks) can't be dyed.
- Color never carries information alone; shapes and outlines do the work (color-blind safe).

**Q-76:** How do dyes fit the 16-color palette: ramp swaps on a larger global palette, a fixed 16, or per-region palettes?

## Related
- [[Wizard Drip]], [[Cloak Appearance]], [[Sanctum Stations]], [[Alchemy Spellbook]], [[Familiar Customization]], [[Provenance]], [[Component Catalog]], [[Art Direction]], [[Customization MOC]]

## Open threads
- Do dyes fade with use, or stay forever (Anti-Chore says forever)?
- Can a friend's gifted component dye carry their name in the color's label?
- Seasonal dyes only available in one season?
