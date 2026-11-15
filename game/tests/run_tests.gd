## Headless logic tests. Run from the repo root:
##   godot --headless --path game -s res://tests/run_tests.gd
## Exit code 0 = all passed.
extends SceneTree

const Nybble := preload("res://scripts/core/nybble.gd")
const ChordInputScript := preload("res://scripts/input/chord_input.gd")
const Board := preload("res://scripts/core/board_rules.gd")

var failures := 0
var checks := 0


func _initialize() -> void:
	_test_nybble()
	_test_thumb_flow()
	_test_rejections()
	_test_dwell()
	_test_release()
	_test_polarity()
	_test_board_start()
	_test_board_rules()
	print("\n%d checks, %d failure(s)" % [checks, failures])
	quit(1 if failures > 0 else 0)


func check(cond: bool, msg: String) -> void:
	checks += 1
	if cond:
		print("  ok   ", msg)
	else:
		failures += 1
		printerr("  FAIL ", msg)


func key(ci: Node, code: Key, pressed: bool) -> void:
	var ev := InputEventKey.new()
	ev.physical_keycode = code
	ev.pressed = pressed
	ci._input(ev)


func make() -> Dictionary:
	var ci: Node = ChordInputScript.new()
	var log := {"addr": [], "rej": [], "nyb": []}
	ci.address_committed.connect(func(r, c, w): log["addr"].append([r, c, w]))
	ci.address_rejected.connect(func(_reason, v): log["rej"].append(v))
	ci.nybble_committed.connect(func(v): log["nyb"].append(v))
	return {"ci": ci, "log": log}


func _test_nybble() -> void:
	print("nybble helpers")
	check(Nybble.to_hex(12) == "C", "12 -> C")
	check(Nybble.to_bin(0xC) == "1100", "C -> 1100")
	check(Nybble.to_bin(7) == "0111", "7 -> 0111")
	check(Nybble.popcount(0xF) == 4, "popcount F = 4")
	check(Nybble.is_row(0xA) and Nybble.is_row(0xF) and not Nybble.is_row(9), "rows are A-F")
	check(Nybble.resolve_column(0)["col"] == 0, "fist is not a column")
	check(Nybble.resolve_column(9)["col"] == 9 and not Nybble.resolve_column(9)["wild"], "9 is a plain column")
	var expected := {10: 2, 11: 3, 12: 4, 13: 5, 14: 6, 15: 7}
	for v in expected:
		var r := Nybble.resolve_column(v)
		check(r["col"] == expected[v] and r["wild"], "wild %d -> %d" % [v, expected[v]])
	check(Nybble.address_name(0xC, 7) == "C7", "address name C7")
	check(Nybble.address_byte(0xC, 7) == 0xC7, "address byte 0xC7")
	check(Nybble.finger_cost(0xA, 1) == 3, "A1 costs 3 fingers")
	check(Nybble.wrong_fingers(0xC, 0xE) == 0x2, "C vs E differ in ring")
	check(Nybble.finger_list(0x2) == "ring", "finger list names ring")


func _test_thumb_flow() -> void:
	print("thumb commit flow")
	var t := make()
	var ci: Node = t["ci"]
	key(ci, KEY_7, true)
	key(ci, KEY_8, true)
	check(ci.bits == 0xC, "index+middle held = 1100")
	key(ci, KEY_B, true)
	key(ci, KEY_B, false)
	check(ci.stage == ci.Stage.COLUMN and ci.row == 0xC, "thumb locks row C")
	key(ci, KEY_7, false)
	key(ci, KEY_9, true)
	key(ci, KEY_0, true)
	check(ci.bits == 0x7, "middle+ring+pinky = 0111")
	key(ci, KEY_SPACE, true)
	check(t["log"]["addr"] == [[0xC, 7, false]], "space thumb casts C7")
	check(ci.stage == ci.Stage.ROW, "back to row stage")
	ci.free()


func _test_rejections() -> void:
	print("rejections and wild magic")
	var t := make()
	var ci: Node = t["ci"]
	ci.commit(3)
	check(t["log"]["rej"] == [3], "3 rejected as a row")
	ci.commit(0xA)
	ci.commit(0)
	check(t["log"]["rej"] == [3, 0] and ci.stage == ci.Stage.COLUMN, "fist rejected, still waiting for column")
	ci.commit(0xE)
	check(t["log"]["addr"] == [[0xA, 6, true]], "column E warps to wild A6")
	ci.commit(0xB)
	ci.reset()
	check(ci.stage == ci.Stage.ROW, "reset cancels a half address")
	ci.free()


func _test_dwell() -> void:
	print("dwell (auto-detect)")
	var t := make()
	var ci: Node = t["ci"]
	ci.trigger = ci.Trigger.DWELL
	key(ci, KEY_7, true)
	key(ci, KEY_8, true)
	ci._process(0.1)
	check(t["log"]["nyb"].is_empty(), "no commit before dwell time")
	ci._process(0.1)
	check(t["log"]["nyb"] == [0xC], "commit C after 200 ms")
	ci._process(0.5)
	check(t["log"]["nyb"] == [0xC], "holding does not recommit")
	key(ci, KEY_7, false)
	ci._process(0.5)
	check(t["log"]["nyb"] == [0xC], "half-release does not commit (requires full release)")
	key(ci, KEY_8, false)
	key(ci, KEY_8, true)
	key(ci, KEY_9, true)
	key(ci, KEY_0, true)
	ci._process(0.2)
	check(t["log"]["addr"] == [[0xC, 7, false]], "dwell casts C7")
	ci.free()


func _test_release() -> void:
	print("commit on release")
	var t := make()
	var ci: Node = t["ci"]
	ci.trigger = ci.Trigger.RELEASE
	key(ci, KEY_7, true)
	key(ci, KEY_8, true)
	key(ci, KEY_7, false)
	check(t["log"]["nyb"].is_empty(), "partial release waits")
	key(ci, KEY_8, false)
	check(t["log"]["nyb"] == [0xC], "full release commits the peak chord C")
	key(ci, KEY_8, true)
	key(ci, KEY_0, true)
	key(ci, KEY_8, false)
	key(ci, KEY_0, false)
	check(t["log"]["addr"] == [[0xC, 5, false]], "release casts C5")
	ci.free()


func _test_polarity() -> void:
	print("polarity flip")
	var t := make()
	var ci: Node = t["ci"]
	ci.invert_polarity = true
	key(ci, KEY_7, true)
	check(ci.bits == 0x7, "inverted: holding index = 0111")
	ci.free()


func _find(pieces: Array, id: String) -> Dictionary:
	for p in pieces:
		if p["id"] == id:
			return p
	return {}


func _test_board_start() -> void:
	print("cloak board: starting layout (matches the HTML prototype)")
	var pieces := Board.starting_pieces()
	var expected := {"s1": 1.0, "s2": 0.5, "s3": 1.0, "s4": 1.0, "s5": 1.0, "s6": 1.0, "s7": 0.0, "s8": 1.0}
	for id in expected:
		var s := _find(pieces, id)
		var ev := Board.evaluate(pieces, s)
		check(is_equal_approx(ev["power"], expected[id]), "%s %s at %d%%" % [Board.address(s), s["name"], int(expected[id] * 100)])
	check(Board.spell_at(pieces, 0, 0)["name"] == "Kindle", "A1 holds Kindle")
	check(Board.spell_at(pieces, 0, 1) == null, "A2 is not an origin")


func _test_board_rules() -> void:
	print("cloak board: rules")
	var pieces := Board.starting_pieces()
	# Constellation: Starfall (A5) with Starglass (B5) + Moonsilver placed at A7 row... use a second astral in row B.
	var starfall := _find(pieces, "s2")
	var meteoric := _find(pieces, "t3")
	check(Board.fits(pieces, meteoric, 1, 5), "Meteoric iron fits at B6")
	meteoric["r"] = 1
	meteoric["c"] = 5
	var ev := Board.evaluate(pieces, starfall)
	check(ev["bonus"] == "Constellation" and is_equal_approx(ev["power"], 1.5), "two astral in row B = constellation x1.5")
	check(not Board.fits(pieces, _find(pieces, "t1"), 0, 0), "cannot place on an occupied cell")
	check(not Board.fits(pieces, _find(pieces, "t4"), 5, 8), "cannot hang off the board")
	# Charge spend: Quicksilver flask uses Retort (charge 4).
	var flask := _find(pieces, "s3")
	var retort := _find(pieces, "c2")
	Board.spend(pieces, flask, Board.evaluate(pieces, flask))
	check(retort["charge"] == 3, "Alchemy cast spends one charge")
	# Heat: Kindle uses Cinder; third cast overheats it and it offers no tags.
	var kindle := _find(pieces, "s1")
	var cinder := _find(pieces, "c1")
	for i in 3:
		Board.spend(pieces, kindle, Board.evaluate(pieces, kindle))
	check(cinder.get("cool", 0.0) > 0.0 and Board.tags_of(cinder).is_empty(), "Smith overheats at 3 heat")
	check(is_equal_approx(Board.evaluate(pieces, kindle)["power"], 0.0), "overheated Cinder leaves Kindle at 0%")
	Board.tick(pieces, 5.0, 0.0, true)
	check(cinder["heat"] == 0 and not Board.tags_of(cinder).is_empty(), "cools after 4.5 s of play")
	# Rot: Moss mat spoils, Raise thornwalker powers up, then consumes it.
	var moss := _find(pieces, "c8")
	var acc := 0.0
	acc = Board.tick(pieces, 3.0 * 5, acc)
	check(moss["fresh"] == 0 and "rot" in Board.tags_of(moss), "Bloom freshness decays to Rot in play time")
	var raise := _find(pieces, "s7")
	var rev := Board.evaluate(pieces, raise)
	check(is_equal_approx(rev["power"], 1.0), "Raise thornwalker powered by Rot")
	Board.spend(pieces, raise, rev)
	check(not pieces.has(moss), "Necro raise consumes the rotten Moss mat")
	# Rotation keeps the origin cell.
	var briar := _find(pieces, "s6")
	var before: Vector2i = Board.abs_cells(briar)[0]
	check(not Board.rotate_piece(pieces, briar), "rotation refused when Mugwort blocks F1")
	_find(pieces, "c7")["r"] = -1  # Mugwort back to the tray
	var ok := Board.rotate_piece(pieces, briar)
	check(ok and Board.abs_cells(briar)[0] == before and Board.abs_cells(briar)[1] == before + Vector2i(1, 0), "rotation turns I2 around its origin")
	check(Board.rotated([Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2)]) == [Vector2i(0, 0), Vector2i(1, 0), Vector2i(2, 0)], "I3 rotates to vertical")
