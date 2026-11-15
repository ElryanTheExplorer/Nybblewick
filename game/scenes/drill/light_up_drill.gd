## Light-Up Drill (vault: Concepts/Learning/Light-Up Drill).
## A cell lights up; the player chords its address. Records time and misses per
## nybble, serves weak nybbles more often, and shows XOR feedback on a miss.
extends Control

const Nybble := preload("res://scripts/core/nybble.gd")
const Pal := preload("res://scripts/ui/palette.gd")
const BoardView := preload("res://scripts/ui/board_view.gd")
const HandDisplay := preload("res://scripts/ui/hand_display.gd")

const STATS_PATH := "user://drill_stats.json"
## Prompt Ladder (vault note): hints fade as you get fluent.
const LEVELS := ["Fingers", "Binary", "Hex", "Decimal", "Light only"]

var board: BoardView
var prompt: Label
var prompt_sub: Label
var feedback: Label
var stats_label: Label
var footer: Label

var level := 0
var target_row := 0xC
var target_col := 7
var streak := 0
var best_streak := 0
var _t_start := 0
var _last_raw := 0
var _rng := RandomNumberGenerator.new()
## nybble (int) -> {"n": tries, "miss": misses, "ms": total ms}
var stats := {}


func _ready() -> void:
	_rng.randomize()
	_load_stats()

	var bg := ColorRect.new()
	bg.color = Pal.BG
	bg.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	add_child(bg)

	var title := Pal.label("LIGHT-UP DRILL", 28, Pal.FLAME, true)
	title.position = Vector2(40, 22)
	add_child(title)

	board = BoardView.new()
	board.position = Vector2(30, 80)
	board.size = Vector2(880, 500)
	add_child(board)

	prompt = Pal.label("", 84, Pal.PARCHMENT, true)
	prompt.position = Vector2(960, 80)
	add_child(prompt)
	prompt_sub = Pal.label("", 20, Pal.EMBER, true)
	prompt_sub.position = Vector2(964, 190)
	add_child(prompt_sub)
	feedback = Pal.label("", 18, Pal.PARCHMENT, true)
	feedback.position = Vector2(964, 250)
	feedback.size = Vector2(450, 140)
	feedback.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	add_child(feedback)
	stats_label = Pal.label("", 14, Pal.DIM, true)
	stats_label.position = Vector2(964, 340)
	add_child(stats_label)

	var hand := HandDisplay.new()
	hand.position = Vector2(40, 600)
	add_child(hand)

	footer = Pal.label("", 15, Pal.DIM)
	footer.position = Vector2(370, 730)
	add_child(footer)

	ChordInput.address_committed.connect(_on_address)
	ChordInput.address_rejected.connect(_on_rejected)
	ChordInput.nybble_committed.connect(_on_nybble)
	ChordInput.stage_changed.connect(_on_stage)
	ChordInput.settings_changed.connect(_refresh_footer)
	ChordInput.reset()

	_refresh_footer()
	_refresh_stats()
	_next_target()
	# Optional: `-- --demo` casts one hit and one miss so screenshots show feedback.
	if "--demo" in OS.get_cmdline_user_args():
		ChordInput.commit(target_row)
		ChordInput.commit(target_col)
		ChordInput.commit(target_row)
		ChordInput.commit(target_col ^ 0x2 if (target_col ^ 0x2) != 0 else 9)


func _exit_tree() -> void:
	_save_stats()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	elif event is InputEventKey and event.pressed and not event.echo and event.physical_keycode == KEY_F4:
		level = (level + 1) % LEVELS.size()
		_update_prompt()
		_refresh_footer()


# --- targets -----------------------------------------------------------------

func _weakness(v: int) -> float:
	if not stats.has(v):
		return 2.0
	var s: Dictionary = stats[v]
	var n: float = maxf(1.0, s["n"])
	var miss_rate: float = s["miss"] / n
	var avg_ms: float = s["ms"] / n
	return 0.5 + miss_rate * 3.0 + avg_ms / 1500.0


func _next_target() -> void:
	var cells := []
	var weights := PackedFloat32Array()
	for row in Nybble.ROWS:
		for col in range(1, 10):
			if row == target_row and col == target_col:
				continue
			cells.append(Vector2i(row, col))
			weights.append(_weakness(row) + _weakness(col))
	var pick: Vector2i = cells[_rng.rand_weighted(weights)]
	target_row = pick.x
	target_col = pick.y
	board.target = pick
	_t_start = Time.get_ticks_msec()
	_update_prompt()


func _update_prompt() -> void:
	board.header_mode = 0 if level <= 1 else 1
	var hexs := Nybble.address_name(target_row, target_col)
	match level:
		0:
			prompt.text = hexs
			prompt_sub.text = "%s  %s\n%s  |  %s" % [
				Nybble.to_bin(target_row), Nybble.to_bin(target_col),
				Nybble.finger_list(target_row), Nybble.finger_list(target_col)]
		1:
			prompt.text = "%s %s" % [Nybble.to_bin(target_row), Nybble.to_bin(target_col)]
			prompt_sub.text = "binary"
		2:
			prompt.text = hexs
			prompt_sub.text = "hex"
		3:
			prompt.text = "%d · %d" % [target_row, target_col]
			prompt_sub.text = "decimal"
		_:
			prompt.text = ""
			prompt_sub.text = "read the board"
	prompt.add_theme_font_size_override("font_size", 52 if level == 1 else 84)


# --- results -----------------------------------------------------------------

func _on_nybble(v: int) -> void:
	_last_raw = v


func _on_stage(stage: int, row: int) -> void:
	board.row_hint = row if stage == ChordInput.Stage.COLUMN else 0


func _on_address(row: int, col: int, wild: bool) -> void:
	var raw_col := _last_raw
	var ms := Time.get_ticks_msec() - _t_start
	var row_ok := row == target_row
	var col_ok := raw_col == target_col
	_record(target_row, not row_ok, ms)
	_record(target_col, not col_ok, ms)

	if row_ok and col_ok:
		streak += 1
		best_streak = maxi(best_streak, streak)
		board.flash(row, col, Pal.MOSS)
		feedback.add_theme_color_override("font_color", Pal.MOSS)
		feedback.text = "✓ %s  ·  %d ms  ·  streak %d" % [Nybble.address_name(row, col), ms, streak]
		_refresh_stats()
		_next_target()
		return

	streak = 0
	board.flash(row, col, Pal.WILD if wild else Pal.MISS)
	feedback.add_theme_color_override("font_color", Pal.MISS)
	var lines := PackedStringArray()
	lines.append("✗ you cast %s%s" % [Nybble.address_name(row, col), "  (wild magic!)" if wild else ""])
	if not row_ok:
		lines.append("row: wanted %s got %s → fix %s" % [
			Nybble.to_bin(target_row), Nybble.to_bin(row),
			Nybble.finger_list(Nybble.wrong_fingers(target_row, row))])
	if not col_ok:
		lines.append("col: wanted %s got %s → fix %s" % [
			Nybble.to_bin(target_col), Nybble.to_bin(raw_col),
			Nybble.finger_list(Nybble.wrong_fingers(target_col, raw_col))])
	feedback.text = "\n".join(lines)
	_refresh_stats()
	_t_start = Time.get_ticks_msec()


func _on_rejected(reason: String, _v: int) -> void:
	feedback.add_theme_color_override("font_color", Pal.EMBER)
	feedback.text = reason


func _record(v: int, missed: bool, ms: int) -> void:
	if not stats.has(v):
		stats[v] = {"n": 0, "miss": 0, "ms": 0.0}
	stats[v]["n"] += 1
	if missed:
		stats[v]["miss"] += 1
	stats[v]["ms"] += ms


func _refresh_stats() -> void:
	var lines := PackedStringArray(["nyb  bin    tries  acc   avg ms"])
	for v in [1, 2, 3, 4, 5, 6, 7, 8, 9, 0xA, 0xB, 0xC, 0xD, 0xE, 0xF]:
		if not stats.has(v):
			lines.append(" %s   %s     -" % [Nybble.to_hex(v), Nybble.to_bin(v)])
			continue
		var s: Dictionary = stats[v]
		var n: int = s["n"]
		var acc := 100.0 * (n - int(s["miss"])) / maxf(1.0, n)
		lines.append(" %s   %s  %5d  %3d%%  %6d" % [Nybble.to_hex(v), Nybble.to_bin(v), n, int(acc), int(s["ms"] / maxf(1.0, n))])
	lines.append("\nstreak %d  ·  best %d" % [streak, best_streak])
	stats_label.text = "\n".join(lines)


func _refresh_footer() -> void:
	footer.text = "%s\nkeys: %s  ·  F1 trigger  ·  F2 polarity  ·  F3 device  ·  F4 prompt: %s  ·  Backspace cancel  ·  Esc menu" % [
		ChordInput.describe_settings(), ChordInput.profile()["hint"], LEVELS[level]]


# --- persistence ---------------------------------------------------------------

func _save_stats() -> void:
	var out := {}
	for k in stats:
		out[str(k)] = stats[k]
	var f := FileAccess.open(STATS_PATH, FileAccess.WRITE)
	if f:
		f.store_string(JSON.stringify(out, "  "))


func _load_stats() -> void:
	if not FileAccess.file_exists(STATS_PATH):
		return
	var data = JSON.parse_string(FileAccess.get_file_as_string(STATS_PATH))
	if data is Dictionary:
		for k in data:
			stats[int(k)] = data[k]
