## Cloak Board (vault: Project/Next Prototype step 1, Spell Anatomy, Loadout Presets).
## The board as a loadout: drag spells and components, see sockets fill, then
## chord an address to cast. Rules live in scripts/core/board_rules.gd.
extends Control

const Board := preload("res://scripts/core/board_rules.gd")
const Nybble := preload("res://scripts/core/nybble.gd")
const Pal := preload("res://scripts/ui/palette.gd")
const HandDisplay := preload("res://scripts/ui/hand_display.gd")

const SAVE_PATH := "user://cloak_layout.json"
const CELL := 74.0
const BOARD_POS := Vector2(150, 96)
const TRAY_POS := Vector2(860, 96)
const TRAY_CELL := 22.0
const TRAY_SLOT := Vector2(100, 92)
const TRAY_COLS := 5
const TRAY_MAX := 15

const TAG_COLORS := {
	"astral": Color("9bc4e8"), "alch": Color("d9b44a"), "way": Color("6fb3a6"),
	"bloom": Color("7fa35a"), "smith": Color("d0673a"), "rot": Color("8a7a5a"),
	"necro": Color("8a7a5a"), "any": Color("a9a5b5"),
}
## Forage templates (vault: Component Catalog). [name, tags, cells, extra]
const FORAGE := [
	["Twine", ["any"], [[0, 0]], {}],
	["Salt pinch", ["alch"], [[0, 0]], {"charge": 3}],
	["Retort", ["alch", "alch"], [[0, 0], [0, 1]], {"charge": 4}],
	["Cinder", ["smith"], [[0, 0]], {"heat": 0}],
	["Iron nail", ["smith"], [[0, 0]], {"heat": 0}],
	["Starglass", ["astral"], [[0, 0]], {}],
	["Moonsilver", ["astral", "astral"], [[0, 0], [0, 1], [1, 1]], {}],
	["Lodestone", ["way"], [[0, 0]], {}],
	["Waybone", ["way", "way"], [[0, 0], [1, 0]], {}],
	["Mugwort", ["bloom"], [[0, 0]], {"fresh": 9, "fmax": 9}],
	["Moss mat", ["bloom", "bloom"], [[0, 0], [1, 0]], {"fresh": 6, "fmax": 6}],
]

var pieces: Array = []
var held: Dictionary = {}
var held_from := Vector2i(-1, -1)
var grab := Vector2i.ZERO
var selected: Dictionary = {}
var bloom_paused := false
var _acc := 0.0
var _next_id := 100
var _flash := {}
var _flash_t := 0.0
var _font: Font
var _rng := RandomNumberGenerator.new()
var msg: Label
var info: Label
var footer: Label


func _ready() -> void:
	_rng.randomize()
	_font = Pal.mono_font()
	_load_layout()
	selected = _first_spell()

	var title := Pal.label("CLOAK BOARD", 28, Pal.FLAME, true)
	title.position = Vector2(40, 22)
	add_child(title)
	var tray_title := Pal.label("TRAY  (bag)", 18, Pal.DIM, true)
	tray_title.position = TRAY_POS + Vector2(0, -30)
	add_child(tray_title)

	info = Pal.label("", 15, Pal.PARCHMENT, true)
	info.position = Vector2(860, 470)
	add_child(info)
	msg = Pal.label("Chord an address to cast. Drag pieces to rearrange.", 18, Pal.FLAME, true)
	msg.position = Vector2(370, 560)
	msg.size = Vector2(460, 60)
	msg.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	add_child(msg)
	var hand := HandDisplay.new()
	hand.position = Vector2(40, 600)
	add_child(hand)
	footer = Pal.label("", 14, Pal.DIM)
	footer.position = Vector2(370, 690)
	add_child(footer)

	ChordInput.address_committed.connect(_on_address)
	ChordInput.address_rejected.connect(_on_rejected)
	ChordInput.settings_changed.connect(_refresh_footer)
	ChordInput.reset()
	_refresh_footer()
	_refresh_info()
	if "--demo" in OS.get_cmdline_user_args():
		_on_address(0xA, 1, false)
		_on_address(0xA, 5, false)


func _exit_tree() -> void:
	_save_layout()


# --- drawing ---------------------------------------------------------------------

func _draw() -> void:
	draw_rect(Rect2(Vector2.ZERO, size), Pal.BG)
	# Board headers.
	for col in Board.COLS:
		var x := BOARD_POS.x + col * CELL
		draw_string(_font, Vector2(x, BOARD_POS.y - 24), str(col + 1), HORIZONTAL_ALIGNMENT_CENTER, CELL, 20, Pal.PARCHMENT)
		draw_string(_font, Vector2(x, BOARD_POS.y - 6), Nybble.to_bin(col + 1), HORIZONTAL_ALIGNMENT_CENTER, CELL, 11, Pal.DIM)
	for row in Board.ROWS:
		var y := BOARD_POS.y + row * CELL + CELL * 0.5
		draw_string(_font, Vector2(BOARD_POS.x - 110, y + 6), Board.ROW_NAMES[row], HORIZONTAL_ALIGNMENT_LEFT, -1, 22, Pal.PARCHMENT)
		draw_string(_font, Vector2(BOARD_POS.x - 84, y + 4), Nybble.to_bin(0xA + row), HORIZONTAL_ALIGNMENT_LEFT, -1, 12, Pal.DIM)
		for col in Board.COLS:
			var r := _cell_rect(Vector2i(row, col))
			draw_rect(r, Pal.PANEL)
			draw_rect(r, Pal.GRID, false, 1.0)
	# Selected spell's neighbourhood.
	var ev := {}
	if not selected.is_empty() and Board.on_board(selected):
		ev = Board.evaluate(pieces, selected)
	# Pieces on the board.
	for p in pieces:
		if Board.on_board(p):
			var contributing: bool = not ev.is_empty() and ev["contrib"].has(p)
			_draw_piece(p, func(cell): return _cell_rect(cell), CELL, contributing)
	# Tray.
	var tray := _tray_pieces()
	for i in TRAY_MAX:
		var slot := _tray_slot_rect(i)
		draw_rect(slot, Color(Pal.PANEL, 0.6))
		draw_rect(slot, Pal.GRID, false, 1.0)
		if i < tray.size():
			var p: Dictionary = tray[i]
			var origin := slot.position + Vector2(8, 8)
			_draw_piece(p, func(cell): return Rect2(origin + Vector2(cell.y, cell.x) * TRAY_CELL, Vector2(TRAY_CELL, TRAY_CELL)).grow(-1), TRAY_CELL, false)
			draw_string(_font, slot.position + Vector2(6, slot.size.y - 8), p["name"], HORIZONTAL_ALIGNMENT_LEFT, slot.size.x - 8, 11, Pal.PARCHMENT)
	# Held piece ghost.
	if not held.is_empty():
		var hover := _cell_at(get_local_mouse_position())
		if hover.x >= 0:
			var at := hover - grab
			var ok := Board.fits(pieces, held, at.x, at.y)
			for cell in held["cells"]:
				var r := _cell_rect(cell + at)
				draw_rect(r, Color(Pal.MOSS if ok else Pal.MISS, 0.45))
		else:
			var m := get_local_mouse_position()
			for cell in held["cells"]:
				draw_rect(Rect2(m + Vector2(cell.y - grab.y, cell.x - grab.x) * TRAY_CELL * 1.5, Vector2.ONE * TRAY_CELL * 1.4), Color(_color_of(held), 0.7))
	# Cast flash.
	if _flash_t > 0.0 and not _flash.is_empty() and Board.on_board(_flash):
		for cell in Board.abs_cells(_flash):
			draw_rect(_cell_rect(cell), Color(Pal.FLAME, _flash_t), false, 4.0)


func _draw_piece(p: Dictionary, rect_of: Callable, cell_size: float, contributing: bool) -> void:
	var base := _color_of(p)
	var is_spell: bool = p["kind"] == "spell"
	var cells: Array = Board.abs_cells(p) if Board.on_board(p) else p["cells"]
	for i in cells.size():
		var r: Rect2 = rect_of.call(cells[i]).grow(-3)
		var fill := base.darkened(0.45) if is_spell else base
		if p.get("cool", 0.0) > 0.0:
			fill = fill.darkened(0.5)
		draw_rect(r, fill)
		if is_spell:
			draw_rect(r, base, false, 2.0)
		if contributing:
			draw_rect(r, Pal.FLAME, false, 3.0)
	if p == selected and Board.on_board(p):
		for cell in cells:
			draw_rect(rect_of.call(cell).grow(-1), Pal.PARCHMENT, false, 2.0)
	if cell_size < 40.0 or not Board.on_board(p):
		return
	var o: Rect2 = rect_of.call(cells[0]).grow(-3)
	if is_spell:
		var ev := Board.evaluate(pieces, p)
		draw_string(_font, o.position + Vector2(5, 15), Board.address(p), HORIZONTAL_ALIGNMENT_LEFT, -1, 12, Pal.FLAME)
		draw_string(_font, o.position + Vector2(5, 33), p["name"], HORIZONTAL_ALIGNMENT_LEFT, o.size.x * cells.size(), 12, Pal.PARCHMENT)
		var pw := "%d%%" % int(round(ev["power"] * 100))
		draw_string(_font, o.position + Vector2(5, o.size.y - 6), pw, HORIZONTAL_ALIGNMENT_LEFT, -1, 14, Pal.MOSS if ev["power"] >= 1.0 else (Pal.EMBER if ev["power"] > 0.0 else Pal.MISS))
	else:
		draw_string(_font, o.position + Vector2(4, 15), p["name"], HORIZONTAL_ALIGNMENT_LEFT, o.size.x - 4, 11, Pal.BG)
		var state := _state_text(p)
		if state != "":
			draw_string(_font, o.position + Vector2(4, o.size.y - 6), state, HORIZONTAL_ALIGNMENT_LEFT, o.size.x - 4, 11, Pal.BG)


func _state_text(p: Dictionary) -> String:
	if p.get("cool", 0.0) > 0.0:
		return "HOT"
	if p.has("charge"):
		return "ch %d" % p["charge"]
	if p.has("fresh"):
		return "rot" if p["fresh"] <= 0 else "fr %d" % p["fresh"]
	if p.has("heat"):
		return "ht %d" % p["heat"]
	return ""


func _color_of(p: Dictionary) -> Color:
	var key: String
	if p["kind"] == "spell":
		key = p["schools"][0]
	else:
		var tags := Board.tags_of(p)
		key = tags[0] if not tags.is_empty() else p["tags"][0]
	return TAG_COLORS.get(key, Pal.DIM)


# --- geometry ------------------------------------------------------------------------

func _cell_rect(cell: Vector2i) -> Rect2:
	return Rect2(BOARD_POS + Vector2(cell.y, cell.x) * CELL, Vector2(CELL, CELL))


func _cell_at(pos: Vector2) -> Vector2i:
	var rel := (pos - BOARD_POS) / CELL
	var cell := Vector2i(floori(rel.y), floori(rel.x))
	if cell.x < 0 or cell.x >= Board.ROWS or cell.y < 0 or cell.y >= Board.COLS:
		return Vector2i(-1, -1)
	return cell


func _tray_slot_rect(i: int) -> Rect2:
	return Rect2(TRAY_POS + Vector2(i % TRAY_COLS, i / TRAY_COLS) * (TRAY_SLOT + Vector2(6, 6)), TRAY_SLOT)


func _tray_pieces() -> Array:
	var out := []
	for p in pieces:
		if not Board.on_board(p) and p != held:
			out.append(p)
	return out


# --- input -----------------------------------------------------------------------

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			_click(event.position)
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			_rotate()
		accept_event()
		queue_redraw()


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and not event.echo:
		match event.physical_keycode:
			KEY_ESCAPE:
				if held.is_empty():
					get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
				else:
					_cancel_hold()
			KEY_R:
				_rotate()
			KEY_F:
				_forage()
			KEY_P:
				bloom_paused = not bloom_paused
				_say("Bloom clock %s." % ("paused" if bloom_paused else "running"), Pal.DIM)
			KEY_N:
				pieces = Board.starting_pieces()
				held = {}
				selected = _first_spell()
				_say("Layout reset to the starting cloak.", Pal.DIM)
		_refresh_footer()
		_refresh_info()
		queue_redraw()


func _click(pos: Vector2) -> void:
	var cell := _cell_at(pos)
	if not held.is_empty():
		if cell.x >= 0:
			var at := cell - grab
			if Board.fits(pieces, held, at.x, at.y):
				held["r"] = at.x
				held["c"] = at.y
				if held["kind"] == "spell":
					selected = held
				held = {}
			else:
				_say("No room there.", Pal.MISS)
		elif _in_tray(pos):
			if held["kind"] == "spell":
				_say("Spells stay in the cloak: the board is your grimoire page.", Pal.EMBER)
			else:
				held = {}
		_refresh_info()
		return
	if cell.x >= 0:
		var occ := Board.occupancy(pieces)
		if occ.has(cell):
			var p: Dictionary = occ[cell]
			if p["kind"] == "spell":
				selected = p
			grab = cell - Vector2i(p["r"], p["c"])
			held_from = Vector2i(p["r"], p["c"])
			held = p
			p["r"] = -1
			p["c"] = -1
	else:
		var tray := _tray_pieces()
		for i in tray.size():
			if _tray_slot_rect(i).has_point(pos):
				held = tray[i]
				held_from = Vector2i(-1, -1)
				grab = held["cells"][0]
				break
	_refresh_info()


func _in_tray(pos: Vector2) -> bool:
	return Rect2(TRAY_POS, Vector2(TRAY_COLS, 3) * (TRAY_SLOT + Vector2(6, 6))).has_point(pos)


func _cancel_hold() -> void:
	held["r"] = held_from.x
	held["c"] = held_from.y
	held = {}


func _rotate() -> void:
	if not held.is_empty():
		held["cells"] = Board.rotated(held["cells"])
		grab = held["cells"][0]
	elif not selected.is_empty() and not Board.rotate_piece(pieces, selected):
		_say("No room to turn %s here." % selected["name"], Pal.MISS)
	queue_redraw()


func _forage() -> void:
	var added := 0
	for i in 3:
		if _tray_pieces().size() >= TRAY_MAX:
			break
		var t: Array = FORAGE[_rng.randi_range(0, FORAGE.size() - 1)]
		_next_id += 1
		pieces.append(Board.comp("f%d" % _next_id, t[0], t[1].duplicate(), t[2], -1, -1, t[3].duplicate()))
		added += 1
	_say("Foraged %d component(s) into the tray." % added if added > 0 else "The bag is full.", Pal.MOSS)


# --- casting -----------------------------------------------------------------------

func _on_address(row: int, col: int, wild: bool) -> void:
	var addr := Nybble.address_name(row, col)
	var s = Board.spell_at(pieces, row - 0xA, col - 1)
	if s == null:
		_say("%s%s · no spell starts on that cell." % ["WILD " if wild else "", addr], Pal.DIM)
		return
	selected = s
	var ev := Board.evaluate(pieces, s)
	if ev["power"] <= 0.0:
		_say("%s %s fizzles: its sockets are empty." % [addr, s["name"]], Pal.MISS)
		_refresh_info()
		return
	var notes := Board.spend(pieces, s, ev)
	_flash = s
	_flash_t = 1.0
	_say("%s%s %s at %d%%%s%s" % [
		"WILD " if wild else "", addr, s["name"], int(round(ev["power"] * 100)),
		" · " + ev["bonus"] if ev["bonus"] != "" else "",
		" · " + ", ".join(notes) if not notes.is_empty() else ""], Pal.WILD if wild else Pal.FLAME)
	_refresh_info()


func _on_rejected(reason: String, _v: int) -> void:
	_say(reason, Pal.EMBER)


func _process(delta: float) -> void:
	_acc = Board.tick(pieces, delta, _acc, bloom_paused)
	_flash_t = maxf(0.0, _flash_t - delta)
	queue_redraw()


func _say(text: String, color: Color) -> void:
	msg.text = text
	msg.add_theme_color_override("font_color", color)


func _refresh_info() -> void:
	if selected.is_empty() or not Board.on_board(selected):
		info.text = "Click a spell to inspect it."
		return
	var ev := Board.evaluate(pieces, selected)
	var lines := PackedStringArray(["%s  %s  (%s, aim: %s)" % [Board.address(selected), selected["name"], "+".join(selected["schools"]), selected["aim"]]])
	for i in selected["need"].size():
		var f = ev["fill"][i]
		lines.append("  {%s}  %s" % [selected["need"][i], ("← " + f["comp"]["name"] + " (" + f["tag"] + ")") if f != null else "— empty"])
	lines.append("power %d%%%s" % [int(round(ev["power"] * 100)), "  · " + ev["bonus"] if ev["bonus"] != "" else ""])
	info.text = "\n".join(lines)


func _refresh_footer() -> void:
	footer.text = "%s\nchord %s  ·  click pick/drop  ·  R / right-click rotate  ·  F forage  ·  P pause Bloom clock (%s)  ·  N reset  ·  Esc menu" % [
		ChordInput.describe_settings(), ChordInput.profile()["hint"], "paused" if bloom_paused else "running"]


func _first_spell() -> Dictionary:
	for p in pieces:
		if p["kind"] == "spell":
			return p
	return {}


# --- persistence -------------------------------------------------------------------

func _save_layout() -> void:
	if not held.is_empty():
		_cancel_hold()
	var out := []
	for p in pieces:
		var d: Dictionary = p.duplicate()
		var cells := []
		for c in p["cells"]:
			cells.append([c.x, c.y])
		d["cells"] = cells
		out.append(d)
	var f := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if f:
		f.store_string(JSON.stringify(out))


func _load_layout() -> void:
	pieces = Board.starting_pieces()
	if "--fresh" in OS.get_cmdline_user_args() or not FileAccess.file_exists(SAVE_PATH):
		return
	var data = JSON.parse_string(FileAccess.get_file_as_string(SAVE_PATH))
	if not data is Array or data.is_empty():
		return
	var loaded := []
	for d in data:
		var p: Dictionary = d
		var cells := []
		for c in p["cells"]:
			cells.append(Vector2i(int(c[0]), int(c[1])))
		p["cells"] = cells
		p["r"] = int(p["r"])
		p["c"] = int(p["c"])
		for k in ["charge", "heat", "fresh", "fmax"]:
			if p.has(k):
				p[k] = int(p[k])
		loaded.append(p)
	pieces = loaded
