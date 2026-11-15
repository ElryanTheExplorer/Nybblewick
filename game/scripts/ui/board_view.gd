## The 6x9 spell board (rows A-F, columns 1-9), drawn with _draw().
## Used by the drill. Set `target`, `row_hint` and call flash().
extends Control

const Nybble := preload("res://scripts/core/nybble.gd")
const Pal := preload("res://scripts/ui/palette.gd")

const HEADER := Vector2(110, 56)

## Cell to light up, as Vector2i(row_value 0xA-0xF, col 1-9). x < 0 = none.
var target := Vector2i(-1, -1)
## Row already locked in by the player (0 = none).
var row_hint := 0
## Header style: 0 binary + label, 1 label only.
var header_mode := 0
## Show the target highlight (off for "blind" practice later).
var show_target := true
## Optional per-cell text, keyed by address name ("A1": "Kindle").
var cell_notes := {}

var _flash_cell := Vector2i(-1, -1)
var _flash_color := Color.WHITE
var _flash_t := 0.0
var _font: Font
var _time := 0.0


func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	_font = Pal.mono_font()


func flash(row: int, col: int, color: Color) -> void:
	_flash_cell = Vector2i(row, col)
	_flash_color = color
	_flash_t = 0.6


func _process(delta: float) -> void:
	_time += delta
	_flash_t = maxf(0.0, _flash_t - delta)
	queue_redraw()


func cell_size() -> Vector2:
	return Vector2((size.x - HEADER.x) / 9.0, (size.y - HEADER.y) / 6.0)


func cell_rect(row: int, col: int) -> Rect2:
	var cs := cell_size()
	var ri := row - Nybble.ROW_MIN
	return Rect2(HEADER + Vector2((col - 1) * cs.x, ri * cs.y), cs).grow(-3)


func _draw() -> void:
	var cs := cell_size()
	# Column headers.
	for col in range(1, 10):
		var x := HEADER.x + (col - 1) * cs.x
		draw_string(_font, Vector2(x, 26), str(col), HORIZONTAL_ALIGNMENT_CENTER, cs.x, 22, Pal.PARCHMENT)
		if header_mode == 0:
			draw_string(_font, Vector2(x, 46), Nybble.to_bin(col), HORIZONTAL_ALIGNMENT_CENTER, cs.x, 13, Pal.DIM)
	# Rows.
	for row in Nybble.ROWS:
		var ri: int = row - Nybble.ROW_MIN
		var y := HEADER.y + ri * cs.y
		var row_col := Pal.ASTRAL if row == row_hint else Pal.PARCHMENT
		draw_string(_font, Vector2(8, y + cs.y * 0.5 + 4), Nybble.to_hex(row), HORIZONTAL_ALIGNMENT_LEFT, -1, 22, row_col)
		if header_mode == 0:
			draw_string(_font, Vector2(34, y + cs.y * 0.5 + 2), Nybble.to_bin(row), HORIZONTAL_ALIGNMENT_LEFT, -1, 13, Pal.DIM)
		for col in range(1, 10):
			_draw_cell(row, col)


func _draw_cell(row: int, col: int) -> void:
	var r := cell_rect(row, col)
	var fill := Pal.PANEL
	if row == row_hint:
		fill = fill.lerp(Pal.ASTRAL, 0.12)
	draw_rect(r, fill)
	var is_target := show_target and target == Vector2i(row, col)
	if is_target:
		var pulse := 0.55 + 0.45 * sin(_time * 6.0)
		draw_rect(r, Pal.EMBER.lerp(Pal.FLAME, pulse))
	if _flash_t > 0.0 and _flash_cell == Vector2i(row, col):
		draw_rect(r, Color(_flash_color, _flash_t / 0.6))
	draw_rect(r, Pal.GRID, false, 2.0)
	var addr := Nybble.address_name(row, col)
	var text_col := Pal.BG if is_target else Pal.DIM
	draw_string(_font, r.position + Vector2(6, 18), addr, HORIZONTAL_ALIGNMENT_LEFT, -1, 13, text_col)
	if cell_notes.has(addr):
		draw_string(_font, r.position + Vector2(6, r.size.y - 8), cell_notes[addr], HORIZONTAL_ALIGNMENT_LEFT, r.size.x - 8, 11, Pal.EMBER if not is_target else Pal.BG)
