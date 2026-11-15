# Nybblewick game (Godot)

**Godot 4.7.2 stable**, GDScript. Use Godot 4 syntax only (no `yield`, `onready var`, `export var`, `KinematicBody`, etc. from Godot 3).
Binary: `godot` on PATH (`~/Apps/Godot/`).
Design lives in the Obsidian vault one level up (`../Home.md`); check `Project/Decision Log.md` before changing rules.

## Commands (run from repo root)
- Tests: `godot --headless --path game -s res://tests/run_tests.gd` (exit 0 = pass)
- Reimport after adding files: `godot --headless --path game --import`
- Smoke-run a scene: `godot --headless --path game --quit-after 90 res://scenes/<scene>.tscn`
- Screenshot frames: `godot --path game --write-movie <dir>/f.png --fixed-fps 30 --quit-after 40 res://scenes/style_room/style_room.tscn -- --demo` (the drill also takes `-- --demo`)

## Layout
- `scripts/core/nybble.gd`: pure nybble/address helpers. No engine state. Keep it testable.
- `scripts/core/board_rules.gd`: pure cloak-board rules (pieces as Dictionaries; fits, rotate, socket fill, power, constellation, spend, tick). Ported from `_sources/chorded-grimoire-cloak-proto.html`.
- `scripts/input/chord_input.gd`: autoload `ChordInput`. Device keys → finger bits → nybble → address. Trigger modes: thumb / dwell / release. **Gameplay code listens to its signals and never reads chord keys directly.** New devices (MIDI, hand tracking) call `ChordInput.commit()` or feed finger state.
- `scripts/ui/`: `palette.gd` (colors, label helper), `hand_display.gd`, `board_view.gd`.
- `scenes/main_menu`, `scenes/drill/light_up_drill` (Light-Up Drill), `scenes/cloak/cloak_board` (board as loadout; `-- --demo --fresh` for screenshots), `scenes/style_room/style_room` (pixel isometric look test).
- `shaders/pixel_palette.gdshader`: dither + 16-color palette post-process.

## Conventions
- Scenes are built in code (`.tscn` is a root node + script) to keep diffs readable. Move to editor-built scenes when art assets arrive.
- Shared scripts are loaded with `preload` constants, not `class_name`, so headless tests work without an editor cache.
- Connect autoload signals to methods, not lambdas, so connections clean up when a scene is freed.
- Pixel look: 3D renders to a 480x270 SubViewport, shown 3x with nearest filtering; the camera snaps to whole low-res pixels. Keep UI at the 1440x810 base resolution.
- Add a test in `tests/run_tests.gd` for any rule change in `nybble.gd` or `chord_input.gd`.
