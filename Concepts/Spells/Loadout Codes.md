---
status: proposal
tags:
  - spell
  - board
  - learning
refs:
  - D-02
  - D-24
  - Q-35
---

# Loadout Codes

Share a board layout as a hex string. Every address is already a byte (`C7` = `1100 0111` = `0xC7`, [[Two-Chord Addressing]]), so a layout serializes to hex almost by itself, and reading codes teaches hex for free ([[Binary to Hex Teaching]]).

## Encoding sketch (v1)
```
[V P] - [ID AD R] - [ID AD R] ... - 00 - [ID AD R] ... - [K]
 header   spells (5 digits each)    sep   components      check
```
| Field | Digits | Meaning |
|---|---|---|
| `V` | 1 | format version (`1`) |
| `P` | 1 | page, 1-9 ([[Grimoire Pages]]) |
| `ID` | 2 | spell or component ID. High nybble = school in ring order: `1` Astral, `2` Alchemy, `3` Bloom, `4` Necro, `5` Smith, `6` Wayfarer; `A`-`F` = the six borderland hybrids; `7` = off-ring; `8`-`9` = catalysts ([[Component Catalog]], spellbooks) |
| `AD` | 2 | origin address as a byte: row nybble `A`-`F`, column nybble `1`-`9` |
| `R` | 1 | rotation, `0`-`3` quarter turns from the spellbook drawing |
| `00` | 2 | separator. `00` is never a valid address (no row 0, no column 0, D-14), so it can't be mistaken for one |
| `K` | 1 | check digit: XOR of every digit before it ([[Parity Inscriptions]], [[XOR Feedback]]) |

## Worked example: the prototype's starting layout
Spells (cloak prototype, [[Prototypes]]): Cinder bolt / Kindle `51` at `A1`, Starfall `11` at `A5`, Quicksilver flask `21` at `C1`, Brimstone rain `71` at `C4`, Lodestep `61` at `A8`, Briar snare `31` at `E1`, Raise thornwalker `41` at `E5`, Stormstep `E1` at `D7`. Components: Cinder `B1`, Retort `C2`, Iron nail `B4`, Starglass `B5`, Lodestone `B8`, Hearth coal `D6`, Mugwort `F1`, Moss mat `E6`.

```
11-51A10-11A50-21C10-71C40-61A80-31E10-41E50-E1D70-00-53B10-22C20-51B40-11B50-61B80-52D60-31F10-32E60-9
```
The smallest possible code, one spell: `11-51A10-F` (version 1, page 1; Kindle at `A1`, unrotated; 1⊕1⊕5⊕1⊕A⊕1⊕0 = F).

## How it teaches
- Every `AD` field is an address the player has chorded hundreds of times. Seeing `C4` inside `71C40` is recognition, not study.
- IDs teach **bit fields**: the first digit says the school, the second says which spell. `E1` reads "Smith-Wayfarer hybrid, number 1".
- The check digit is a parity lesson: mistype one digit and the code is refused with the XOR shown. Later [[Rune Puzzles]] use the same trick.
- Codes can be **chorded in**, digit by digit, at a waystone: a long, calm fluency exercise with a reward at the end.

## Trading codes
- With co-op friends ([[Drop-In Co-op]]): paste, speak, or chord a code. Your board rearranges to match; spells you don't know and components you don't own appear as **ghosts**.
- An unknown spell ID is a **rumor**: "your friend knows a `C2`". It seeds a [[Research Loop]] lead.
- Codes on waystones and in the async [[Community Layer]], written as hex glyphs: a "recommended loadout for the Barrowfen" left by another player.
- Codes never move items. Components are physical and stay with their owner ([[Gift and Provenance Economy]]).

**Q-35:** Should codes carry component placements, or spells only?
**Recommendation:** both, with components as **tag ghosts** on the receiving side (the code stores the ID, the receiver sees "needs alch ×2, `I2`"). A layout without its components is half a recipe.

## Related
- [[Loadout Presets]], [[Grimoire Pages]], [[Component Catalog]], [[Binary to Hex Teaching]], [[Community Layer]], [[Two-Chord Addressing]]

## Open threads
- Q-35 above.
- Base-16 ID space allows 15 spells per school (`x1`-`xF`). Enough? A second ID byte would cover expansions.
- Should catalysts in codes be hidden (a surprise when you find one), or shown?
- A printed code on a physical card (merch, a Kickstarter reward) that unlocks a starter layout?
