## Autoload "ChordInput": turns raw device input into finger bits, nybbles and addresses.
## Game code listens to the signals only; it never reads the chord keys directly.
##
## Flow: shape fingers -> commit (row) -> shape fingers -> commit (column) -> address.
## What counts as a commit depends on `trigger` (see vault note "Cast Trigger Modes").
extends Node

const Nybble := preload("res://scripts/core/nybble.gd")

signal fingers_changed(bits: int)
signal thumb_changed(down: bool)
signal nybble_committed(value: int)
signal stage_changed(stage: int, row: int)
signal address_committed(row: int, col: int, wild: bool)
signal address_rejected(reason: String, value: int)
signal settings_changed

enum Trigger { THUMB, DWELL, RELEASE }
enum Stage { ROW, COLUMN }

const TRIGGER_NAMES := ["Thumb toggle", "Auto-detect (dwell)", "Commit on release"]

## Finger key order in every profile: index, middle, ring, pinky.
const PROFILES := [
	{"name": "Keyboard, right hand", "thumb": [KEY_B, KEY_SPACE], "fingers": [KEY_7, KEY_8, KEY_9, KEY_0], "hint": "7 8 9 0 + B/Space"},
	{"name": "Keyboard, left hand", "thumb": [KEY_SPACE], "fingers": [KEY_4, KEY_3, KEY_2, KEY_1], "hint": "4 3 2 1 + Space"},
	{"name": "Numpad, right hand", "thumb": [KEY_KP_0], "fingers": [KEY_KP_7, KEY_KP_8, KEY_KP_9, KEY_KP_ADD], "hint": "Num 7 8 9 + and Num 0"},
]

var profile_index := 0
var trigger: Trigger = Trigger.THUMB
## false: a held key means an open finger (1). true: held means closed (0).
var invert_polarity := false
var dwell_ms := 180.0
## Dwell mode: after a commit, all fingers must lift before the next one counts.
## Stops half-released shapes from committing by accident.
var dwell_requires_release := true

var bits := 0
var pressed_mask := 0
var thumb_down := false
var stage: Stage = Stage.ROW
var row := 0

var _dwell_t := 0.0
var _dwell_armed := true
var _release_peak := 0


func profile() -> Dictionary:
	return PROFILES[profile_index]


func describe_settings() -> String:
	return "%s  ·  %s  ·  polarity: held = %s" % [
		profile()["name"], TRIGGER_NAMES[trigger], "closed" if invert_polarity else "open"]


func _input(event: InputEvent) -> void:
	var key := event as InputEventKey
	if key == null or key.echo:
		return
	var code := key.physical_keycode
	if key.pressed and _handle_settings_key(code):
		_consume()
		return
	var p := profile()
	if code in p["thumb"]:
		_set_thumb(key.pressed)
		_consume()
		return
	var idx: int = (p["fingers"] as Array).find(code)
	if idx >= 0:
		var bit: int = Nybble.FINGER_BITS[idx]
		if key.pressed:
			pressed_mask |= bit
		else:
			pressed_mask &= ~bit
		_after_fingers_moved()
		_consume()


func _process(delta: float) -> void:
	if trigger != Trigger.DWELL or pressed_mask == 0 or not _dwell_armed:
		return
	_dwell_t += delta
	if _dwell_t * 1000.0 >= dwell_ms:
		_dwell_armed = false
		commit(bits)


## Feed one nybble into the row/column state machine.
## Public so tests, debug tools and future devices (MIDI, hand tracking) can call it.
func commit(v: int) -> void:
	v &= 0xF
	_release_peak = 0
	nybble_committed.emit(v)
	if stage == Stage.ROW:
		if Nybble.is_row(v):
			row = v
			stage = Stage.COLUMN
			stage_changed.emit(stage, row)
		else:
			address_rejected.emit("Rows are A-F (1010-1111). You cast %s = %s." % [Nybble.to_bin(v), Nybble.to_hex(v)], v)
		return
	var r := Nybble.resolve_column(v)
	var col: int = r["col"]
	if col == 0:
		address_rejected.emit("A closed fist isn't a column.", v)
		return
	var committed_row := row
	reset()
	address_committed.emit(committed_row, col, r["wild"])


func reset() -> void:
	stage = Stage.ROW
	row = 0
	stage_changed.emit(stage, row)


func _set_thumb(down: bool) -> void:
	if down == thumb_down:
		return
	thumb_down = down
	thumb_changed.emit(down)
	if down:
		# The thumb always commits, in every mode, as a manual override.
		_dwell_armed = false
		commit(bits)


func _after_fingers_moved() -> void:
	var released_all := false
	if trigger == Trigger.RELEASE:
		if pressed_mask != 0:
			_release_peak |= pressed_mask
		elif _release_peak != 0:
			released_all = true

	var new_bits := (pressed_mask ^ 0xF) if invert_polarity else pressed_mask
	if new_bits != bits:
		bits = new_bits
		fingers_changed.emit(bits)
	_dwell_t = 0.0
	if not dwell_requires_release or pressed_mask == 0:
		_dwell_armed = true

	if released_all:
		var peak := (_release_peak ^ 0xF) if invert_polarity else _release_peak
		commit(peak)


func _handle_settings_key(code: Key) -> bool:
	match code:
		KEY_F1:
			trigger = ((trigger + 1) % TRIGGER_NAMES.size()) as Trigger
		KEY_F2:
			invert_polarity = not invert_polarity
		KEY_F3:
			profile_index = (profile_index + 1) % PROFILES.size()
		KEY_BACKSPACE:
			reset()
			return true
		_:
			return false
	_clear_held()
	settings_changed.emit()
	return true


func _clear_held() -> void:
	pressed_mask = 0
	_release_peak = 0
	_dwell_armed = true
	_after_fingers_moved()
	reset()


func _consume() -> void:
	var vp := get_viewport()
	if vp:
		vp.set_input_as_handled()
