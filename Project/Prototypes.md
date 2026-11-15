---
status: reference
tags:
  - project
---

# Prototypes

## Godot prototype (current, `game/`)
Godot 4.7.2. Open `game/project.godot` in Godot, press F5.

- **Light-Up Drill**: a cell lights up, chord its address. [[XOR Feedback]] on a miss, per-nybble stats (saved between runs) that serve weak nybbles more often, and a [[Prompt Ladder]] on F4. Tests [[Cast Trigger Modes]] (F1).
- **Style Room**: the [[Art Direction]] recipe. A 480x270 isometric room with torchlight, a dithered 16-color palette (P toggles), and a grid-walking wizard. Four spells: A1 Kindle, A2 Lodestep, A8 Sprout, C4 Starward (a placeholder; the closest spellbook spell is Salt-and-star ward), cast at the facing tile. Names match the [[Smith Spellbook]], [[Wayfarer Spellbook]] and [[Bloom Spellbook]].
- **Cloak Board** (2026-11-14): the board as a loadout ([[Next Prototype]] step 1). The starting layout is the HTML prototype's, renamed to match the spellbooks. You drag spells and components, sockets fill live, and chording an address casts with the per-school spend rules (charge, heat, freshness → Rot, Necro raise). F forages, P pauses the Bloom clock, and the layout saves between runs. Rules are in `scripts/core/board_rules.gd`, with 24 tests.
- Shared: `ChordInput` (keyboard right/left, numpad; thumb/dwell/release; polarity flip), 60 headless logic tests.
- Not yet: MIDI/drumpad, mouse aiming, components/sockets, the board-as-loadout.

## Cloak prototype (current)
File: `_sources/chorded-grimoire-cloak-proto.html` (single file, open in a browser).

- Chord flow: shape fingers, thumb locks row (`1010`-`1111`), shape column, thumb again. If the address is a spell origin with at least one socket filled, the spell readies and the stage takes aim. Left click looses it, Esc stows.
- Controls: on-screen hand toggles; keyboard, numpad and drumpad profiles; polarity flip; Web MIDI. `T` rotates, `G` toggles familiar vision, RMB zooms, Space aliases the thumb.
- Board: drag spells and components; cloak opens on load; finger-cost overlay; "Forage a clearing"; Bloom clock controls.
- Practice field: 13x13 isometric tiles with fog, four dummies, a familiar.

### Data model
- `spell`: `{id, name, schools[], aim, look, range, need[], cells, r, c, blurb}`
- `comp`: `{id, name, tags[], cells, r, c, charge?, heat?, fresh?, fmax?}` (`r == null` = in tray)
- Socket fill: typed first, then `any`. Power = filled/total. Astral constellation x1.5. Power 0 fizzles.
- Spend rules: Alchemy charges, Smith heat (overheat at 3), Bloom freshness decays to Rot, Necro consumes Rot.

### Verified / not verified
- Verified: JS syntax, Node logic test, headless render.
- Not verified: cloak animation, real keyboard chord feel, MIDI hardware, touch dragging, left-hand visuals.

## Inventory concepts (early)
`chorded-grimoire-inventory-concepts.html`: not in this folder. Six plates, see [[Inventory Plates]]. Partly superseded by D-04, D-14.

## Next prototype candidates
- **Nybble trainer**: only the [[Light-Up Drill]] with [[Cast Trigger Modes]] switchable. Smallest test of the core feel. Matches Scope Tier 0-1.

Related: [[Scope Tiers]].

## See also (pass 2)
- [[Loadout Codes]]
