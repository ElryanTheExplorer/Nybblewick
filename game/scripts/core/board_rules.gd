## Pure rules for the cloak board (vault: Spell Anatomy, Sockets and Components,
## Component Taxonomy). Ported from the HTML cloak prototype in _sources/.
## No engine state: pieces are Dictionaries, so everything is unit-testable.
##
## Piece: {id, kind: "spell"|"comp", name, cells: Array[Vector2i] (x=row, y=col
## offsets; cells[0] is the origin), r, c (board row/col index, -1 = in tray), ...}
## spell extra: schools: Array[String], need: Array[String], aim
## comp extra:  tags: Array[String], optional charge / heat / fresh, fmax / cool
extends RefCounted

const ROWS := 6
const COLS := 9
const ROW_NAMES := "ABCDEF"
const OVERHEAT := 3
const COOL_SECONDS := 4.5
const FRESH_TICK_SECONDS := 3.0
const NEIGHBORS := [Vector2i(1, 0), Vector2i(-1, 0), Vector2i(0, 1), Vector2i(0, -1)]


static func spell(id: String, name: String, schools: Array, aim: String, need: Array, cells: Array, r: int, c: int) -> Dictionary:
	return {"id": id, "kind": "spell", "name": name, "schools": schools, "aim": aim,
		"need": need, "cells": _v(cells), "r": r, "c": c}


static func comp(id: String, name: String, tags: Array, cells: Array, r: int, c: int, extra := {}) -> Dictionary:
	var p := {"id": id, "kind": "comp", "name": name, "tags": tags, "cells": _v(cells), "r": r, "c": c}
	p.merge(extra)
	return p


static func _v(cells: Array) -> Array:
	var out := []
	for rc in cells:
		out.append(Vector2i(rc[0], rc[1]))
	return out


## The prototype's starting layout, renamed to match the spellbooks.
static func starting_pieces() -> Array:
	return [
		spell("s1", "Kindle", ["smith"], "point", ["smith"], [[0, 0], [0, 1]], 0, 0),
		spell("s2", "Starfall", ["astral"], "place", ["astral", "any"], [[0, 0], [0, 1]], 0, 4),
		spell("s3", "Quicksilver flask", ["alch"], "arc", ["alch", "any"], [[0, 0], [1, 0]], 2, 0),
		spell("s4", "Brimstone rain", ["alch", "smith"], "arc", ["alch", "smith"], [[0, 0], [0, 1], [1, 0]], 2, 3),
		spell("s5", "Lodestep", ["way"], "blink", ["way"], [[0, 0], [0, 1]], 0, 7),
		spell("s6", "Briar hedge", ["bloom"], "place", ["bloom"], [[0, 0], [0, 1]], 4, 0),
		spell("s7", "Raise thornwalker", ["necro"], "place", ["rot"], [[0, 0], [1, 0]], 4, 4),
		spell("s8", "Stormstep", ["smith", "way"], "blink", ["smith", "way"], [[1, 0], [1, 1], [0, 1]], 2, 6),
		comp("c1", "Cinder", ["smith"], [[0, 0]], 1, 0, {"heat": 0}),
		comp("c2", "Retort", ["alch", "alch"], [[0, 0], [0, 1]], 2, 1, {"charge": 4}),
		comp("c3", "Starglass", ["astral"], [[0, 0]], 1, 4),
		comp("c4", "Iron nail", ["smith"], [[0, 0]], 1, 3, {"heat": 0}),
		comp("c5", "Lodestone", ["way"], [[0, 0]], 1, 7),
		comp("c6", "Hearth coal", ["smith"], [[0, 0]], 3, 5, {"heat": 0}),
		comp("c7", "Mugwort", ["bloom"], [[0, 0]], 5, 0, {"fresh": 9, "fmax": 9}),
		comp("c8", "Moss mat", ["bloom", "bloom"], [[0, 0], [1, 0]], 4, 5, {"fresh": 5, "fmax": 6}),
		comp("t1", "Twine", ["any"], [[0, 0]], -1, -1),
		comp("t2", "Twine", ["any"], [[0, 0]], -1, -1),
		comp("t3", "Meteoric iron", ["smith", "astral"], [[0, 0]], -1, -1, {"heat": 0}),
		comp("t4", "Waybone", ["way", "way"], [[0, 0], [1, 0]], -1, -1),
		comp("t5", "Struck oak", ["bloom", "smith"], [[0, 0], [1, 0]], -1, -1, {"fresh": 7, "fmax": 7, "heat": 0}),
		comp("t6", "Salt pinch", ["alch"], [[0, 0]], -1, -1, {"charge": 3}),
		comp("t7", "Moonsilver", ["astral", "astral"], [[0, 0], [0, 1], [1, 1]], -1, -1),
	]


# --- geometry --------------------------------------------------------------------

static func on_board(p: Dictionary) -> bool:
	return p["r"] >= 0


static func abs_cells(p: Dictionary) -> Array:
	var out := []
	for cell in p["cells"]:
		out.append(Vector2i(cell.x + p["r"], cell.y + p["c"]))
	return out


static func address(p: Dictionary) -> String:
	var o: Vector2i = abs_cells(p)[0]
	return ROW_NAMES[o.x] + str(o.y + 1)


## Map of Vector2i cell -> piece for everything on the board (except `skip`).
static func occupancy(pieces: Array, skip = null) -> Dictionary:
	var occ := {}
	for p in pieces:
		if p == skip or not on_board(p):
			continue
		for cell in abs_cells(p):
			occ[cell] = p
	return occ


static func fits(pieces: Array, p: Dictionary, r: int, c: int, cells = null) -> bool:
	var shape: Array = cells if cells != null else p["cells"]
	var occ := occupancy(pieces, p)
	for cell in shape:
		var rr: int = cell.x + r
		var cc: int = cell.y + c
		if rr < 0 or rr >= ROWS or cc < 0 or cc >= COLS or occ.has(Vector2i(rr, cc)):
			return false
	return true


## Rotate a shape 90 degrees clockwise and normalize to non-negative offsets.
## The first cell stays first, so the origin follows the rotation.
static func rotated(cells: Array) -> Array:
	var n := []
	for cell in cells:
		n.append(Vector2i(cell.y, -cell.x))
	var mr := 99
	var mc := 99
	for cell in n:
		mr = mini(mr, cell.x)
		mc = mini(mc, cell.y)
	var out := []
	for cell in n:
		out.append(Vector2i(cell.x - mr, cell.y - mc))
	return out


## Rotate in place on the board, keeping the origin cell where it is. Returns success.
static func rotate_piece(pieces: Array, p: Dictionary) -> bool:
	var rc := rotated(p["cells"])
	if not on_board(p):
		p["cells"] = rc
		return true
	var o: Vector2i = abs_cells(p)[0]
	var nr: int = o.x - rc[0].x
	var nc: int = o.y - rc[0].y
	if fits(pieces, p, nr, nc, rc):
		p["cells"] = rc
		p["r"] = nr
		p["c"] = nc
		return true
	return false


static func spell_at(pieces: Array, row: int, col: int) -> Variant:
	for p in pieces:
		if p["kind"] == "spell" and on_board(p) and abs_cells(p)[0] == Vector2i(row, col):
			return p
	return null


# --- sockets & power ----------------------------------------------------------------

## Tags a component offers right now: none while overheated; spoiled Bloom offers Rot.
static func tags_of(p: Dictionary) -> Array:
	if p.get("cool", 0.0) > 0.0:
		return []
	var t: Array = p["tags"].duplicate()
	if p.has("fresh") and p["fresh"] <= 0:
		for i in t.size():
			if t[i] == "bloom":
				t[i] = "rot"
	return t


static func neighbors(pieces: Array, s: Dictionary) -> Array:
	var occ := occupancy(pieces)
	var found := []
	for cell in abs_cells(s):
		for d in NEIGHBORS:
			var q = occ.get(cell + d)
			if q != null and q != s and q["kind"] == "comp" and not found.has(q):
				found.append(q)
	return found


## Socket fill: typed sockets take a matching tag first, then {any} takes what's left.
## Returns {fill: Array (null or {tag, comp}), contrib, filled, total, power, bonus, nb}.
static func evaluate(pieces: Array, s: Dictionary) -> Dictionary:
	var nb := neighbors(pieces, s)
	var pool := []
	for p in nb:
		for t in tags_of(p):
			pool.append({"tag": t, "comp": p})
	var need: Array = s["need"]
	var fill := []
	fill.resize(need.size())
	for i in need.size():
		if need[i] == "any":
			continue
		for k in pool.size():
			if pool[k]["tag"] == need[i]:
				fill[i] = pool.pop_at(k)
				break
	for i in need.size():
		if need[i] == "any" and pool.size() > 0:
			fill[i] = pool.pop_front()
	var contrib := []
	var filled := 0
	for f in fill:
		if f != null:
			filled += 1
			if not contrib.has(f["comp"]):
				contrib.append(f["comp"])
	var power := float(filled) / float(need.size())
	var bonus := ""
	if "astral" in s["schools"]:
		var astral_cells := []
		for c in contrib:
			if "astral" in tags_of(c):
				astral_cells.append(abs_cells(c)[0])
		if astral_cells.size() >= 2:
			var same_row := true
			var same_col := true
			for cell in astral_cells:
				same_row = same_row and cell.x == astral_cells[0].x
				same_col = same_col and cell.y == astral_cells[0].y
			if same_row or same_col:
				bonus = "Constellation"
				power *= 1.5
	return {"fill": fill, "contrib": contrib, "filled": filled, "total": need.size(),
		"power": power, "bonus": bonus, "nb": nb}


## Apply per-school spend rules after a cast. Mutates `pieces`. Returns notes.
static func spend(pieces: Array, s: Dictionary, ev: Dictionary) -> Array:
	var notes := []
	if "necro" in s["schools"]:
		for c in ev["contrib"].duplicate():
			if c.has("fresh") and c["fresh"] <= 0:
				pieces.erase(c)
				notes.append("%s raised" % c["name"])
		for c in ev["nb"]:
			if pieces.has(c) and c.has("fresh") and c["fresh"] > 0:
				c["fresh"] = maxi(0, c["fresh"] - 2)
				notes.append("%s drained" % c["name"])
	for c in ev["contrib"]:
		if not pieces.has(c):
			continue
		if c.has("charge"):
			c["charge"] -= 1
			if c["charge"] <= 0:
				pieces.erase(c)
				notes.append("%s spent" % c["name"])
		elif c.has("heat"):
			c["heat"] += 1
			if c["heat"] >= OVERHEAT:
				c["cool"] = COOL_SECONDS
				notes.append("%s overheated" % c["name"])
	return notes


## Advance play time. Freshness ticks only while playing (Anti-Chore Rules).
## `acc` carries the leftover freshness timer between calls. Returns new acc.
static func tick(pieces: Array, delta: float, acc: float, bloom_paused := false) -> float:
	for p in pieces:
		if p.get("cool", 0.0) > 0.0:
			p["cool"] = maxf(0.0, p["cool"] - delta)
			if p["cool"] == 0.0:
				p["heat"] = 0
	if bloom_paused:
		return acc
	acc += delta
	while acc >= FRESH_TICK_SECONDS:
		acc -= FRESH_TICK_SECONDS
		for p in pieces:
			if p.has("fresh") and p["fresh"] > 0:
				p["fresh"] -= 1
	return acc
