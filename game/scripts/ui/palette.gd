## Shared colors. One place to tune the look.
## Use via: const Pal := preload("res://scripts/ui/palette.gd")
extends RefCounted

const BG := Color("14111a")
const PANEL := Color("1f1a2e")
const GRID := Color("2e2a45")
const DIM := Color("6b6275")
const PARCHMENT := Color("f5efe4")
const RUST := Color("7a3a1a")
const EMBER := Color("e8a33d")
const FLAME := Color("ffd97a")
const MOSS := Color("7fa35a")
const MISS := Color("c4483e")
const ASTRAL := Color("9bc4e8")
const WILD := Color("b27ad6")

## 16-color world palette used by the pixel post-process shader.
const WORLD := [
	Color("0d0b14"), Color("1f1a2e"), Color("2e2a45"), Color("3f3d5c"),
	Color("5a5873"), Color("7d7a91"), Color("a9a5b5"), Color("f5efe4"),
	Color("7a3a1a"), Color("b5582a"), Color("e8a33d"), Color("ffd97a"),
	Color("2f4a3a"), Color("5c8a4a"), Color("4b6fa8"), Color("9bc4e8"),
]


static func mono_font() -> Font:
	var f := SystemFont.new()
	f.font_names = PackedStringArray(["IBM Plex Mono", "JetBrains Mono", "DejaVu Sans Mono", "monospace"])
	return f


## Quick label factory used by the code-built scenes.
static func label(text: String, size: int, color: Color = PARCHMENT, mono := false) -> Label:
	var l := Label.new()
	l.text = text
	l.add_theme_font_size_override("font_size", size)
	l.add_theme_color_override("font_color", color)
	l.add_theme_color_override("font_outline_color", Color("0d0b14"))
	l.add_theme_constant_override("outline_size", 6)
	if mono:
		l.add_theme_font_override("font", mono_font())
	return l
