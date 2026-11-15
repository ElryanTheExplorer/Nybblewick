## Live view of the casting hand: thumb + four fingers, bit values, hex/binary,
## and the half-built address. Listens to the ChordInput autoload.
extends Control

const Nybble := preload("res://scripts/core/nybble.gd")
const Pal := preload("res://scripts/ui/palette.gd")

var bits := 0
var thumb := false
var _font: Font


func _ready() -> void:
	custom_minimum_size = Vector2(300, 170)
	size = custom_minimum_size
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	_font = Pal.mono_font()
	bits = ChordInput.bits
	ChordInput.fingers_changed.connect(_on_fingers)
	ChordInput.thumb_changed.connect(_on_thumb)
	ChordInput.stage_changed.connect(_on_stage)
	ChordInput.settings_changed.connect(queue_redraw)


func _on_fingers(b: int) -> void:
	bits = b
	queue_redraw()


func _on_stage(_s: int, _r: int) -> void:
	queue_redraw()


func _on_thumb(down: bool) -> void:
	thumb = down
	queue_redraw()


func _draw() -> void:
	draw_rect(Rect2(Vector2.ZERO, size), Color(Pal.PANEL, 0.85))
	draw_rect(Rect2(Vector2.ZERO, size), Pal.GRID, false, 2.0)

	# Thumb: a short wide pad on the left.
	var thumb_rect := Rect2(14, 92, 34, 46)
	_finger(thumb_rect, thumb, Pal.EMBER)
	draw_string(_font, Vector2(14, 156), "T", HORIZONTAL_ALIGNMENT_CENTER, 34, 14, Pal.DIM)

	# Fingers: index..pinky, left to right = most significant bit first.
	var heights := [96, 108, 100, 80]
	for i in 4:
		var bit: int = Nybble.FINGER_BITS[i]
		var h: float = heights[i]
		var r := Rect2(60 + i * 40, 140 - h, 30, h)
		_finger(r, (bits & bit) != 0, Pal.FLAME)
		draw_string(_font, Vector2(r.position.x, 158), str(bit), HORIZONTAL_ALIGNMENT_CENTER, 30, 14, Pal.DIM)

	# Readout.
	var x := 228.0
	draw_string(_font, Vector2(x, 64), Nybble.to_hex(bits), HORIZONTAL_ALIGNMENT_LEFT, -1, 52, Pal.PARCHMENT)
	draw_string(_font, Vector2(x, 90), Nybble.to_bin(bits), HORIZONTAL_ALIGNMENT_LEFT, -1, 16, Pal.EMBER)
	var stage := "row ?"
	if ChordInput.stage == ChordInput.Stage.COLUMN:
		stage = Nybble.to_hex(ChordInput.row) + " ?"
	draw_string(_font, Vector2(x, 124), stage, HORIZONTAL_ALIGNMENT_LEFT, -1, 22, Pal.ASTRAL)
	draw_string(_font, Vector2(x, 150), ["thumb", "dwell", "release"][ChordInput.trigger], HORIZONTAL_ALIGNMENT_LEFT, -1, 12, Pal.DIM)


func _finger(r: Rect2, open: bool, lit: Color) -> void:
	if open:
		draw_rect(r, lit)
	else:
		draw_rect(r, Pal.BG)
		draw_rect(r, Pal.DIM, false, 2.0)
