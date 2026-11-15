## Title screen: pick a prototype. Built in code so the .tscn stays trivial.
extends Control

const Pal := preload("res://scripts/ui/palette.gd")

const ENTRIES := [
	["Light-Up Drill", "res://scenes/drill/light_up_drill.tscn",
		"A cell lights up. Chord its address. Learn the hand, the board and hex."],
	["Cloak Board", "res://scenes/cloak/cloak_board.tscn",
		"The board as a loadout. Drag spells and components, fill sockets, chord to cast."],
	["Style Room", "res://scenes/style_room/style_room.tscn",
		"A low-res isometric dungeon room. Walk, chord a spell, watch it land."],
]

var _settings: Label


func _ready() -> void:
	var bg := ColorRect.new()
	bg.color = Pal.BG
	bg.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	add_child(bg)

	var title := Pal.label("NYBBLEWICK", 72, Pal.FLAME, true)
	title.position = Vector2(120, 110)
	add_child(title)
	var sub := Pal.label("four fingers · four bits · one spell", 22, Pal.DIM, true)
	sub.position = Vector2(124, 200)
	add_child(sub)

	var y := 290.0
	var first: Button
	for e in ENTRIES:
		var b := Button.new()
		b.text = "  " + e[0] + "  "
		b.add_theme_font_size_override("font_size", 28)
		b.position = Vector2(120, y)
		b.size = Vector2(360, 56)
		var path: String = e[1]
		b.pressed.connect(func(): get_tree().change_scene_to_file(path))
		add_child(b)
		var d := Pal.label(e[2], 18, Pal.PARCHMENT)
		d.position = Vector2(500, y + 14)
		add_child(d)
		if first == null:
			first = b
		y += 80.0
	first.grab_focus()

	_settings = Pal.label("", 18, Pal.ASTRAL, true)
	_settings.position = Vector2(120, 560)
	add_child(_settings)
	var help := Pal.label(
		"Chord keys: %s   ·   F1 trigger mode   ·   F2 polarity   ·   F3 device   ·   Backspace cancel   ·   Esc back\nEnter / click to start." % ChordInput.profile()["hint"],
		16, Pal.DIM)
	help.position = Vector2(120, 600)
	add_child(help)
	ChordInput.settings_changed.connect(_refresh)
	_refresh()


func _refresh() -> void:
	_settings.text = ChordInput.describe_settings()
