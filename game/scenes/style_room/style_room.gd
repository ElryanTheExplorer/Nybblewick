## Style Room (vault: Project/Art Direction, Project/Prototype Roadmap step 2).
## A low-res isometric dungeon room: 3D rendered into a 480x270 SubViewport,
## upscaled 3x with nearest filtering, then dithered to a 16-color palette.
## Walk with WASD/arrows, chord an address from the spellbook to cast at the
## tile you face.
extends Control

const Nybble := preload("res://scripts/core/nybble.gd")
const Pal := preload("res://scripts/ui/palette.gd")
const HandDisplay := preload("res://scripts/ui/hand_display.gd")
const PIXEL_SHADER := preload("res://shaders/pixel_palette.gdshader")

const LOW_RES := Vector2i(480, 270)
const COLS := 9
const ROWS := 6
const CAM_SIZE := 8.0           # world units visible vertically
const CAM_PITCH := -30.0
const CAM_YAW := 45.0
const MAX_WISPS := 6

## Address -> spell. Cheap cells (A1, A2, A8) hold the basics (see Finger Cost).
const SPELLBOOK := {
	"A1": {"name": "Kindle", "school": "Smith", "blurb": "a wisp-light ahead"},
	"A2": {"name": "Lodestep", "school": "Wayfarer", "blurb": "blink up to 3 tiles"},
	"A8": {"name": "Sprout", "school": "Bloom", "blurb": "grow a plant ahead"},
	"C4": {"name": "Starward", "school": "Astral", "blurb": "a ring of starlight (placeholder; see Astral Spellbook)"},
}
const POST_MODES := ["off", "palette", "posterize"]

var viewport: SubViewport
var screen: TextureRect
var world: Node3D
var camera: Camera3D
var player: Node3D
var torches: Array[OmniLight3D] = []
var wisps: Array[Node3D] = []
var msg: Label
var footer: Label

var player_cell := Vector2i(4, 4)   # x = column index 0-8, y = row index 0-5
var facing := Vector2i(0, -1)
var blocked := {}                   # Vector2i -> true
var post_mode := 1
var _moving := false
var _noise := FastNoiseLite.new()
var _time := 0.0
var _rng := RandomNumberGenerator.new()
var _mats := {}


func _ready() -> void:
	_rng.randomize()
	_build_viewport()
	_build_world()
	_build_hud()
	ChordInput.address_committed.connect(_on_address)
	ChordInput.address_rejected.connect(_on_rejected)
	ChordInput.settings_changed.connect(_refresh_footer)
	ChordInput.reset()
	_snap_camera(true)
	# Optional: `godot --path game res://scenes/style_room/style_room.tscn -- --demo`
	if "--demo" in OS.get_cmdline_user_args():
		_cast("A1", false)
		_turn_and_move(Vector2i(1, 0), false)
		_cast("A8", false)


# --- viewport & post-process ---------------------------------------------------

func _build_viewport() -> void:
	viewport = SubViewport.new()
	viewport.size = LOW_RES
	viewport.own_world_3d = true
	viewport.msaa_3d = Viewport.MSAA_DISABLED
	viewport.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	add_child(viewport)

	screen = TextureRect.new()
	screen.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	screen.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	screen.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	screen.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	screen.texture = viewport.get_texture()
	var mat := ShaderMaterial.new()
	mat.shader = PIXEL_SHADER
	var pal := PackedVector3Array()
	for c in Pal.WORLD:
		pal.append(Vector3(c.r, c.g, c.b))
	mat.set_shader_parameter("palette", pal)
	mat.set_shader_parameter("palette_size", pal.size())
	mat.set_shader_parameter("mode", post_mode)
	screen.material = mat
	add_child(screen)


# --- world ---------------------------------------------------------------------

func _build_world() -> void:
	world = Node3D.new()
	viewport.add_child(world)

	var env := Environment.new()
	env.background_mode = Environment.BG_COLOR
	env.background_color = Color("0d0b14")
	env.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	env.ambient_light_color = Color("3f3d5c")
	env.ambient_light_energy = 0.55
	env.glow_enabled = true
	env.glow_intensity = 0.6
	env.glow_bloom = 0.1
	env.tonemap_mode = Environment.TONE_MAPPER_FILMIC
	var we := WorldEnvironment.new()
	we.environment = env
	world.add_child(we)

	var moon := DirectionalLight3D.new()
	moon.rotation_degrees = Vector3(-55, -30, 0)
	moon.light_color = Color("9bc4e8")
	moon.light_energy = 0.35
	moon.shadow_enabled = true
	world.add_child(moon)

	camera = Camera3D.new()
	camera.projection = Camera3D.PROJECTION_ORTHOGONAL
	camera.size = CAM_SIZE
	camera.near = 0.05
	camera.far = 100.0
	camera.rotation_degrees = Vector3(CAM_PITCH, CAM_YAW, 0)
	world.add_child(camera)
	camera.current = true

	_mats["floor"] = _material(_stone_texture(11, Color("5a5873"), Color("3f3d5c")))
	_mats["floor2"] = _material(_stone_texture(23, Color("4f4d68"), Color("3f3d5c")))
	_mats["wall"] = _material(_brick_texture(5, Color("7d7a91"), Color("2e2a45")), Vector3(3, 4, 1))
	_mats["base"] = _material(_stone_texture(3, Color("2e2a45"), Color("1f1a2e")), Vector3(27, 4, 1))
	_mats["wood"] = _material(_plank_texture(7, Color("7a3a1a"), Color("4a2410")), Vector3(3, 2, 1))

	# Floor tiles (the room is the same 9x6 as the spell board).
	for z in ROWS:
		for x in COLS:
			var tile := MeshInstance3D.new()
			var pm := PlaneMesh.new()
			pm.size = Vector2.ONE
			tile.mesh = pm
			tile.material_override = _mats["floor"] if (x * 7 + z * 3) % 5 != 0 else _mats["floor2"]
			tile.position = _cell_pos(Vector2i(x, z))
			world.add_child(tile)
	var base := _box(Vector3(COLS, 0.6, ROWS), _mats["base"])
	base.position = Vector3((COLS - 1) * 0.5, -0.301, (ROWS - 1) * 0.5)

	# Back walls (far side from the camera), with a doorway.
	for x in range(-1, COLS):
		if x == 4:
			continue
		_box(Vector3(1, 2.2, 1), _mats["wall"]).position = Vector3(x, 1.1, -1)
	_box(Vector3(1, 0.6, 1), _mats["wall"]).position = Vector3(4, 1.9, -1)  # lintel
	for z in ROWS:
		_box(Vector3(1, 2.2, 1), _mats["wall"]).position = Vector3(-1, 1.1, z)

	# Props.
	_crate(Vector2i(8, 0))
	_crate(Vector2i(7, 0))
	_barrel(Vector2i(0, 5))
	_barrel(Vector2i(0, 4))
	_pillar(Vector2i(6, 3))

	_torch(Vector3(1.5, 1.4, -0.45), Vector3.ZERO)
	_torch(Vector3(6.5, 1.4, -0.45), Vector3.ZERO)
	_torch(Vector3(-0.45, 1.4, 2.5), Vector3(0, 90, 0))
	_noise.frequency = 3.0

	player = _make_wizard()
	world.add_child(player)
	player.position = _cell_pos(player_cell)
	_face(facing)


func _cell_pos(c: Vector2i) -> Vector3:
	return Vector3(c.x, 0, c.y)


func _in_room(c: Vector2i) -> bool:
	return c.x >= 0 and c.x < COLS and c.y >= 0 and c.y < ROWS


func _box(sz: Vector3, mat: Material) -> MeshInstance3D:
	var mi := MeshInstance3D.new()
	var bm := BoxMesh.new()
	bm.size = sz
	mi.mesh = bm
	mi.material_override = mat
	world.add_child(mi)
	return mi


func _flat(color: Color, emit := 0.0) -> StandardMaterial3D:
	var m := StandardMaterial3D.new()
	m.albedo_color = color
	m.roughness = 1.0
	if emit > 0.0:
		m.emission_enabled = true
		m.emission = color
		m.emission_energy_multiplier = emit
	return m


func _material(tex: Texture2D, uv_scale := Vector3.ONE) -> StandardMaterial3D:
	var m := StandardMaterial3D.new()
	m.albedo_texture = tex
	m.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	m.roughness = 1.0
	m.uv1_scale = uv_scale  # BoxMesh lays faces out 3x2 on its UVs
	return m


func _crate(c: Vector2i) -> void:
	var b := _box(Vector3(0.8, 0.8, 0.8), _mats["wood"])
	b.position = _cell_pos(c) + Vector3(0, 0.4, 0)
	blocked[c] = true


func _barrel(c: Vector2i) -> void:
	var mi := MeshInstance3D.new()
	var cm := CylinderMesh.new()
	cm.top_radius = 0.3
	cm.bottom_radius = 0.3
	cm.height = 0.8
	cm.radial_segments = 8
	mi.mesh = cm
	mi.material_override = _mats["wood"]
	mi.position = _cell_pos(c) + Vector3(0, 0.4, 0)
	world.add_child(mi)
	blocked[c] = true


func _pillar(c: Vector2i) -> void:
	var b := _box(Vector3(0.6, 2.2, 0.6), _mats["wall"])
	b.position = _cell_pos(c) + Vector3(0, 1.1, 0)
	blocked[c] = true


func _torch(pos: Vector3, rot: Vector3) -> void:
	var holder := Node3D.new()
	holder.position = pos
	holder.rotation_degrees = rot
	world.add_child(holder)
	var stick := MeshInstance3D.new()
	var sm := BoxMesh.new()
	sm.size = Vector3(0.08, 0.3, 0.08)
	stick.mesh = sm
	stick.material_override = _flat(Color("4a2410"))
	holder.add_child(stick)
	var flame := MeshInstance3D.new()
	var fm := SphereMesh.new()
	fm.radius = 0.09
	fm.height = 0.2
	fm.radial_segments = 6
	fm.rings = 3
	flame.mesh = fm
	flame.material_override = _flat(Color("ffd97a"), 4.0)
	flame.position = Vector3(0, 0.22, 0.05)
	holder.add_child(flame)
	var light := OmniLight3D.new()
	light.light_color = Color("e8a33d")
	light.light_energy = 1.6
	light.omni_range = 5.0
	light.omni_attenuation = 1.2
	light.shadow_enabled = true
	light.position = Vector3(0, 0.3, 0.35)
	holder.add_child(light)
	torches.append(light)


func _make_wizard() -> Node3D:
	var root := Node3D.new()
	var robe_mat := _flat(Color("5b82c4"))
	var trim_mat := _flat(Color("f5efe4"))

	var robe := MeshInstance3D.new()
	var rm := CylinderMesh.new()
	rm.top_radius = 0.1
	rm.bottom_radius = 0.28
	rm.height = 0.7
	rm.radial_segments = 8
	robe.mesh = rm
	robe.material_override = robe_mat
	robe.position.y = 0.35
	root.add_child(robe)

	var head := MeshInstance3D.new()
	var hm := SphereMesh.new()
	hm.radius = 0.13
	hm.height = 0.26
	hm.radial_segments = 8
	hm.rings = 4
	head.mesh = hm
	head.material_override = _flat(Color("e8c8a0"))
	head.position.y = 0.8
	root.add_child(head)

	var brim := MeshInstance3D.new()
	var bm := CylinderMesh.new()
	bm.top_radius = 0.24
	bm.bottom_radius = 0.24
	bm.height = 0.03
	bm.radial_segments = 8
	brim.mesh = bm
	brim.material_override = robe_mat
	brim.position.y = 0.9
	root.add_child(brim)

	var hat := MeshInstance3D.new()
	var cm := CylinderMesh.new()
	cm.top_radius = 0.0
	cm.bottom_radius = 0.16
	cm.height = 0.45
	cm.radial_segments = 8
	hat.mesh = cm
	hat.material_override = robe_mat
	hat.position = Vector3(0, 1.12, 0.03)
	hat.rotation_degrees.x = 12
	root.add_child(hat)

	var staff := MeshInstance3D.new()
	var sm := BoxMesh.new()
	sm.size = Vector3(0.04, 1.0, 0.04)
	staff.mesh = sm
	staff.material_override = _flat(Color("7a3a1a"))
	staff.position = Vector3(0.26, 0.5, -0.05)
	root.add_child(staff)

	var tip := MeshInstance3D.new()
	var tm := SphereMesh.new()
	tm.radius = 0.06
	tm.height = 0.12
	tm.radial_segments = 6
	tm.rings = 3
	tip.mesh = tm
	tip.material_override = _flat(Color("9bc4e8"), 3.0)
	tip.position = Vector3(0.26, 1.02, -0.05)
	root.add_child(tip)
	var glow := OmniLight3D.new()  # staff glow keeps the wizard readable in the dark
	glow.light_color = Color("9bc4e8")
	glow.light_energy = 0.8
	glow.omni_range = 2.2
	glow.position = tip.position + Vector3(0, 0.1, 0.2)
	root.add_child(glow)

	var belt := MeshInstance3D.new()
	var beltm := CylinderMesh.new()
	beltm.top_radius = 0.17
	beltm.bottom_radius = 0.17
	beltm.height = 0.05
	beltm.radial_segments = 8
	belt.mesh = beltm
	belt.material_override = trim_mat
	belt.position.y = 0.48
	root.add_child(belt)
	return root


# --- procedural pixel textures ---------------------------------------------------

func _img(seed_value: int) -> Array:
	var rng := RandomNumberGenerator.new()
	rng.seed = seed_value
	return [Image.create(32, 32, false, Image.FORMAT_RGBA8), rng]


func _stone_texture(seed_value: int, base: Color, mortar: Color) -> ImageTexture:
	var pair := _img(seed_value)
	var im: Image = pair[0]
	var rng: RandomNumberGenerator = pair[1]
	for y in 32:
		for x in 32:
			var c := base.darkened(rng.randf_range(0.0, 0.12))
			if rng.randf() < 0.04:
				c = base.lightened(0.15)
			if x == 0 or y == 0 or x == 31 or y == 31 or (x == 16 and y < 16) or (y == 16):
				c = mortar
			im.set_pixel(x, y, c)
	return ImageTexture.create_from_image(im)


func _brick_texture(seed_value: int, base: Color, mortar: Color) -> ImageTexture:
	var pair := _img(seed_value)
	var im: Image = pair[0]
	var rng: RandomNumberGenerator = pair[1]
	for y in 32:
		var course := y / 8
		var offset := 8 if course % 2 == 1 else 0
		for x in 32:
			var c := base.darkened(rng.randf_range(0.0, 0.18))
			if y % 8 == 0 or (x + offset) % 16 == 0:
				c = mortar
			im.set_pixel(x, y, c)
	return ImageTexture.create_from_image(im)


func _plank_texture(seed_value: int, base: Color, dark: Color) -> ImageTexture:
	var pair := _img(seed_value)
	var im: Image = pair[0]
	var rng: RandomNumberGenerator = pair[1]
	for y in 32:
		for x in 32:
			var c := base.darkened(rng.randf_range(0.0, 0.1) + 0.08 * sin(y * 1.7))
			if x % 8 == 0 or y == 0 or y == 31:
				c = dark
			im.set_pixel(x, y, c)
	return ImageTexture.create_from_image(im)


# --- HUD -----------------------------------------------------------------------

func _build_hud() -> void:
	var hand := HandDisplay.new()
	hand.position = Vector2(24, 616)
	add_child(hand)

	var book_lines := PackedStringArray(["SPELLBOOK"])
	for addr in SPELLBOOK:
		var s: Dictionary = SPELLBOOK[addr]
		var row := Nybble.HEX.find(addr[0])
		var col := int(addr.substr(1))
		book_lines.append("%s  %s %s  %-7s %s" % [addr, Nybble.to_bin(row), Nybble.to_bin(col), s["name"], s["school"]])
	var book := Pal.label("\n".join(book_lines), 16, Pal.PARCHMENT, true)
	book.position = Vector2(1000, 20)
	add_child(book)

	msg = Pal.label("", 22, Pal.FLAME, true)
	msg.position = Vector2(340, 640)
	add_child(msg)

	footer = Pal.label("", 14, Pal.DIM)
	footer.position = Vector2(340, 690)
	add_child(footer)
	_refresh_footer()


func _refresh_footer() -> void:
	footer.text = "%s\nWASD/arrows move  ·  chord %s  ·  P pixel filter: %s  ·  F1 trigger  ·  F2 polarity  ·  F3 device  ·  Esc menu" % [
		ChordInput.describe_settings(), ChordInput.profile()["hint"], POST_MODES[post_mode]]


func _say(text: String, color := Pal.FLAME) -> void:
	msg.text = text
	msg.add_theme_color_override("font_color", color)


# --- input & movement ------------------------------------------------------------

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
		return
	if event is InputEventKey and event.pressed and not event.echo and event.physical_keycode == KEY_P:
		post_mode = (post_mode + 1) % POST_MODES.size()
		(screen.material as ShaderMaterial).set_shader_parameter("mode", post_mode)
		_refresh_footer()


func _process(delta: float) -> void:
	_time += delta
	for i in torches.size():
		torches[i].light_energy = 1.5 + 0.35 * _noise.get_noise_2d(_time, i * 50.0)
	if not _moving:
		var dir := _held_direction()
		if dir != Vector2i.ZERO:
			_turn_and_move(dir, true)
	_snap_camera(false)


func _held_direction() -> Vector2i:
	if Input.is_physical_key_pressed(KEY_W) or Input.is_physical_key_pressed(KEY_UP):
		return Vector2i(0, -1)
	if Input.is_physical_key_pressed(KEY_S) or Input.is_physical_key_pressed(KEY_DOWN):
		return Vector2i(0, 1)
	if Input.is_physical_key_pressed(KEY_A) or Input.is_physical_key_pressed(KEY_LEFT):
		return Vector2i(-1, 0)
	if Input.is_physical_key_pressed(KEY_D) or Input.is_physical_key_pressed(KEY_RIGHT):
		return Vector2i(1, 0)
	return Vector2i.ZERO


func _face(dir: Vector2i) -> void:
	facing = dir
	player.rotation.y = atan2(-dir.x, -dir.y)


func _turn_and_move(dir: Vector2i, animate: bool) -> void:
	_face(dir)
	var next := player_cell + dir
	if not _in_room(next) or blocked.has(next):
		return
	player_cell = next
	if not animate:
		player.position = _cell_pos(next)
		return
	_moving = true
	var tw := create_tween()
	tw.tween_property(player, "position", _cell_pos(next), 0.14)
	tw.finished.connect(func(): _moving = false)


## Follow the player, snapping the camera to whole low-res pixels on its own
## screen plane so the pixel grid never swims.
func _snap_camera(instant: bool) -> void:
	var focus := player.position + Vector3(0, 0.5, 0)
	var basis := camera.global_transform.basis
	var desired := focus + basis.z * 20.0
	var current := camera.position
	var pos := desired if instant else current.lerp(desired, 0.12)
	var px := CAM_SIZE / float(LOW_RES.y)
	var local := basis.transposed() * pos
	local.x = roundf(local.x / px) * px
	local.y = roundf(local.y / px) * px
	camera.position = basis * local


# --- spells --------------------------------------------------------------------

func _on_address(row: int, col: int, wild: bool) -> void:
	_cast(Nybble.address_name(row, col), wild)


func _on_rejected(reason: String, _v: int) -> void:
	_say(reason, Pal.EMBER)


func _cast(addr: String, wild: bool) -> void:
	var target := player_cell + facing
	if wild:
		target += Vector2i(_rng.randi_range(-1, 1), _rng.randi_range(-1, 1))
	if not SPELLBOOK.has(addr):
		_ring(_cell_pos(player_cell), Pal.DIM)
		_say("%s · the page is blank. Nothing happens." % addr, Pal.DIM)
		return
	var spell: Dictionary = SPELLBOOK[addr]
	var tint := Pal.WILD if wild else Color.WHITE
	_say("%s%s · %s" % ["WILD " if wild else "", spell["name"], spell["blurb"]], Pal.WILD if wild else Pal.FLAME)
	match spell["name"]:
		"Kindle":
			_kindle(target, tint)
		"Lodestep":
			_blink()
		"Sprout":
			_sprout(target)
		"Starward":
			_ring(_cell_pos(player_cell), Pal.ASTRAL, 2.2, 1.2)


func _kindle(cell: Vector2i, tint: Color) -> void:
	if not _in_room(cell):
		cell = player_cell
	var wisp := Node3D.new()
	var mi := MeshInstance3D.new()
	var sm := SphereMesh.new()
	sm.radius = 0.1
	sm.height = 0.2
	sm.radial_segments = 6
	sm.rings = 3
	mi.mesh = sm
	var col := Pal.FLAME * tint
	mi.material_override = _flat(col, 5.0)
	wisp.add_child(mi)
	var light := OmniLight3D.new()
	light.light_color = col
	light.light_energy = 1.4
	light.omni_range = 3.5
	wisp.add_child(light)
	wisp.position = _cell_pos(cell) + Vector3(0, 0.9, 0)
	world.add_child(wisp)
	var bob := mi.create_tween().set_loops()  # dies with the wisp
	bob.tween_property(mi, "position:y", 0.12, 0.8).set_trans(Tween.TRANS_SINE)
	bob.tween_property(mi, "position:y", -0.05, 0.8).set_trans(Tween.TRANS_SINE)
	_ring(_cell_pos(cell), col)
	wisps.append(wisp)
	if wisps.size() > MAX_WISPS:
		wisps.pop_front().queue_free()


func _blink() -> void:
	var start := player_cell
	var dest := player_cell
	for i in 3:
		var n := dest + facing
		if not _in_room(n) or blocked.has(n):
			break
		dest = n
	_ring(_cell_pos(start), Pal.ASTRAL)
	player_cell = dest
	player.position = _cell_pos(dest)
	_ring(_cell_pos(dest), Pal.ASTRAL)


func _sprout(cell: Vector2i) -> void:
	if not _in_room(cell) or blocked.has(cell) or cell == player_cell:
		_say("Sprout · no soil there.", Pal.DIM)
		return
	var plant := Node3D.new()
	var stem := _box_local(Vector3(0.06, 0.6, 0.06), _flat(Color("2f4a3a")))
	stem.position.y = 0.3
	plant.add_child(stem)
	for i in 3:
		var leaf := _box_local(Vector3(0.3, 0.04, 0.12), _flat(Color("5c8a4a")))
		leaf.position = Vector3(0.12, 0.15 + i * 0.15, 0)
		leaf.rotation_degrees = Vector3(0, i * 120.0, 20)
		plant.add_child(leaf)
	var bloom := _box_local(Vector3(0.14, 0.14, 0.14), _flat(Color("ffd97a"), 1.5))
	bloom.position.y = 0.66
	plant.add_child(bloom)
	plant.position = _cell_pos(cell)
	plant.scale = Vector3.ONE * 0.05
	world.add_child(plant)
	blocked[cell] = true
	create_tween().tween_property(plant, "scale", Vector3.ONE, 0.6).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	_ring(_cell_pos(cell), Pal.MOSS)


func _box_local(sz: Vector3, mat: Material) -> MeshInstance3D:
	var mi := MeshInstance3D.new()
	var bm := BoxMesh.new()
	bm.size = sz
	mi.mesh = bm
	mi.material_override = mat
	return mi


## Expanding, fading ring on the floor. The workhorse cast effect.
func _ring(pos: Vector3, color: Color, to_scale := 1.4, secs := 0.6) -> void:
	var mi := MeshInstance3D.new()
	var tm := TorusMesh.new()
	tm.inner_radius = 0.38
	tm.outer_radius = 0.48
	tm.rings = 12
	tm.ring_segments = 4
	mi.mesh = tm
	var m := StandardMaterial3D.new()
	m.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	m.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	m.albedo_color = color
	mi.material_override = m
	mi.position = pos + Vector3(0, 0.05, 0)
	mi.scale = Vector3.ONE * 0.3
	world.add_child(mi)
	var tw := create_tween().set_parallel()
	tw.tween_property(mi, "scale", Vector3.ONE * to_scale, secs)
	tw.tween_property(m, "albedo_color:a", 0.0, secs)
	tw.chain().tween_callback(mi.queue_free)
