## Pure helpers for 4-bit hand-sign values (nybbles).
## No engine state, so everything here is safe to unit test.
## Use via: const Nybble := preload("res://scripts/core/nybble.gd")
extends RefCounted

const HEX := "0123456789ABCDEF"

## Finger order everywhere: index, middle, ring, pinky. Polarity: 1 = open.
const FINGER_NAMES := ["index", "middle", "ring", "pinky"]
const FINGER_BITS := [8, 4, 2, 1]

## Board: rows A-F (1010-1111), columns 1-9 (0001-1001). Column 0 is cut.
const ROW_MIN := 0xA
const ROW_MAX := 0xF
const COL_MIN := 1
const COL_MAX := 9
const ROWS := [0xA, 0xB, 0xC, 0xD, 0xE, 0xF]


static func to_hex(v: int) -> String:
	return HEX[v & 0xF]


static func to_bin(v: int) -> String:
	var s := ""
	for bit in FINGER_BITS:
		s += "1" if v & bit else "0"
	return s


static func popcount(v: int) -> int:
	var n := 0
	for bit in FINGER_BITS:
		if v & bit:
			n += 1
	return n


static func is_row(v: int) -> bool:
	return v >= ROW_MIN and v <= ROW_MAX


## Resolves a column chord. Returns {"col": int, "wild": bool}.
## col == 0 means invalid (closed fist). Chords above 9 are wild magic:
## the top bit clears, landing one finger away (10->2 ... 15->7).
static func resolve_column(v: int) -> Dictionary:
	v &= 0xF
	if v == 0:
		return {"col": 0, "wild": false}
	if v <= COL_MAX:
		return {"col": v, "wild": false}
	return {"col": v & 0x7, "wild": true}


static func address_name(row: int, col: int) -> String:
	return to_hex(row) + str(col)


## Every address is a byte: C7 -> 0xC7.
static func address_byte(row: int, col: int) -> int:
	return ((row & 0xF) << 4) | (col & 0xF)


## Number of open fingers needed to cast an address.
static func finger_cost(row: int, col: int) -> int:
	return popcount(row) + popcount(col)


## Mask of fingers that differ between what was wanted and what was cast.
static func wrong_fingers(wanted: int, got: int) -> int:
	return (wanted ^ got) & 0xF


static func finger_list(mask: int) -> String:
	var names := PackedStringArray()
	for i in FINGER_BITS.size():
		if mask & FINGER_BITS[i]:
			names.append(FINGER_NAMES[i])
	return ", ".join(names) if names.size() > 0 else "none"
