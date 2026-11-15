---
title: Chorded Grimoire design notes
export: 2
date: 2026-11-13
status: brainstorm, with two HTML prototypes
tags: [game-design, input, spellcasting, inventory, magic-schools, hand-signs, hardware, story, puzzles]
source: full chat session (claude.ai), compiled twice; this export supersedes the first
files:
  - chorded-grimoire-inventory-concepts.html   # six inventory plates, early, assumes elemental rows (superseded in part)
  - chorded-grimoire-cloak-proto.html          # current prototype, scopeless board
  - chorded-grimoire-design-notes.md           # this file
---

# Chorded Grimoire design notes

## 0. How to read this file

Labels used everywhere:

- **User**: said or chosen by the designer. Treat as decided unless marked "leaning".
- **Proposal**: suggested by Claude in chat. Not accepted until the designer says so.
- **Open**: unresolved.
- **Lore lead**: a real-world tradition mentioned for inspiration. Verify before using in-game.
- **Assumption**: something built into the prototype to make it run, not a design decision.

Decision IDs (D-xx) and open-question IDs (Q-xx) are stable so later notes can reference them.

---

## 1. Current state at a glance

A wizard game. Spells are cast with hand-sign addresses. Four finger states make a nibble. Two nibbles, row then column, select a cell on a **6 x 9 scopeless board** (rows A-F, columns 1-9). The thumb commits each nibble. Spells are polyomino pieces on that board, powered by foraged **components** placed against their edges. Magic schools are expressed through component behavior, not board position. View is isometric by default, with first-person or VR possible, and a **familiar's vision** as a way to change viewpoint and gain intel. The latest direction (section 11) leans away from combat toward utility, story, customization and the environment, with PvE mostly from nature and community-versus-community conflict as ritual contests.

Files:

| File | What it is | Status |
|---|---|---|
| chorded-grimoire-inventory-concepts.html | Six inventory plates (packed grid, linked sockets, wand tape, element codex, page loadouts, belt and bandolier) with a live chord rail | Early. Assumes rows are elements, and a 0-9 column set. Plate I was the favorite. |
| chorded-grimoire-cloak-proto.html | Plate I rebuilt on the scopeless board with the cloak, thumb-commit chords, device profiles, school verbs, aim stage and familiar vision | Current |

---

## 2. Decision log

### User decisions

| ID | Decision | Notes |
|---|---|---|
| D-01 | Spellcasting input is a **chorded nibble**: 4 inputs make 4 bits | Original idea: "only for keyboard warriors but akin to hand symbols for spellcasting" |
| D-02 | Two chords in sequence select a cell. Hex tops out at **F = 1111** | Corrected an earlier G9 typo |
| D-03 | Board drawn on a chalkboard: columns 0-9, rows A-F, tally marks for each chord | Photo shared. "I do fw it." |
| D-04 | **Rows are not elements.** Scopeless grid. Schools differ in which components they use, like MTG colors and mana | "think mtg schools of magic using different mana colors" |
| D-05 | Starting school ideas: **Astral** (light of any kind, folding in illusion and divination), **Alchemy** (lobbables, AOE potions, mixing at the right time), **locomotion** (teleportation, maybe magnetism), **plants** | |
| D-06 | **Smith** is wanted. Fire and electrical combined. Storm maybe separate ("both energy technically") | |
| D-07 | **Necromancy** is wanted and complements Bloom. They coexist and can cancel. Raising dead plants steals nourishment from living plants instead of giving it | |
| D-08 | **Voice, Pact and Rune are components or progression, not schools**: storylines to learn spells, familiars as boons, writing seals to unlock things | |
| D-09 | Polarity: **0 = closed, 1 = open** | Reason given: 0 as a closed loop, a closed circuit |
| D-10 | Hand poses do not have to be simple curls. A pose can have fingers touching other fingers | |
| D-11 | Pose variations per class or school, even minute, if possible | Mostly matters in first person |
| D-12 | View: **isometric** base, playable in first person or VR, or switchable. Spells that shift to isometric or through a familiar's eyes are the likely move, for strategic intel ("drone war style") | Needs hand-position animations |
| D-13 | Components come from a bag or from inside the cloak. The cloak could open in an animation to show the slotted inventory | Concern: fitting components realistically is cool but complex and could break immersion |
| D-14 | Leaning: **cut column 0, use 1-9**. The thumb is used to start the spell | "prob cut 0" |
| D-15 | After the cast starts, **mouse aims**. Left click uses, right click zooms (perhaps) | Visual indicator needs a theme. Mechanics differ per spell |
| D-16 | Casting hand is the **right hand** by default, with a **left-handed mode** | |
| D-17 | Device mappings (section 4.5) | |
| D-18 | Idea: an **orb input device**, since it is wizard themed | |
| D-19 | Plate I (packed grid) is the preferred inventory direction | "Thinkin plate 1, you've got this" |
| D-20 | Feedback on the prototype: **feels clunky**, maybe just needs getting used to, hard to do much combat until fluent | |
| D-21 | **Pivot away from combat.** Utility spells, story and choose-your-own-adventure, player customization, environment customization. PvE more than PvP. Combat between communities | "idk will figure somethn out" |
| D-22 | **Rune puzzles can be embedded-engineering puzzles**: PCB layout, binary, hex, and other easter eggs | |

### Open questions

| ID | Question |
|---|---|
| Q-01 | Do casts **consume** components, or only require them present? |
| Q-02 | Typed socket pips (`{Smith}{any}`) or a per-school mana pool? The prototype uses pips |
| Q-03 | How many schools to start with? 3 covers all hybrid pairs, 5 forms a ring |
| Q-04 | Storm: its own school, or a Smith and Wayfarer hybrid seam? The prototype uses the hybrid |
| Q-05 | Where does Necro sit in the rivalry ring? The prototype gives it a color (Rot) and treats it as a Bloom neighbor |
| Q-06 | Polarity check against hardware that reports "pressed" as 1. The prototype defaults "held input = open (1)" with a flip toggle |
| Q-07 | Is the thumb "start only" or "commit each nibble"? The prototype uses commit for both row and column |
| Q-08 | Drumpad lists reuse pads 9, 12, 14 and 15 on both hands. Typo or intended? |
| Q-09 | How many hand pose variants are worth animating for first person? |
| Q-10 | Familiar vision: camera only, or interactive (it can already reveal telegraphs in the prototype)? |
| Q-11 | Orb input: touch versus force sensing, and how to size across hands |
| Q-12 | If combat de-emphasizes, how does the input stay fun? What are the core utility verbs per school? |
| Q-13 | How does story branching read the chord vocabulary? Is a spell a sentence? |
| Q-14 | How do community conflicts work: contests, sieges, rivalry ring as diplomacy? |
| Q-15 | Which embedded easter eggs ship first, and how do they connect to the board? |

---

## 3. Board and address space

- Original chalkboard board: 6 x 10 (rows A-F, columns 0-9). Rows A-F are `1010` to `1111`. Columns 0-9 are `0000` to `1001`.
- Current: **6 x 9 = 54 cells** (column 0 cut). Column chords `0001` to `1001`.
- Earlier alternatives mentioned: 6 x 9 = 54, and the full 1-F by 1-F = 225 cells.
- Every row chord has its top bit set, which gives the hand a home anchor.
- A closed fist (0000) is not a valid column.
- **Overshoot rule (Proposal, implemented):** a column chord above 9 clears the top bit and lands one bit away (10 to 2, 11 to 3, 12 to 4, 13 to 5, 14 to 6, 15 to 7). It reads as "wild magic" instead of a dead input. This came from the earlier idea of Hamming-adjacent fizzles, where a one-finger miss warps the spell.
- **Finger cost** of an address is popcount(row) + popcount(column). Cheap cells are around A1, A2, A8. This makes the layout puzzle and the ergonomics puzzle the same puzzle (Proposal).
- **Why A-F and 1-9?** (Proposal, undecided) Either marginal coordinates printed in the grimoire's margins, or kamea lineage: Agrippa's *Three Books of Occult Philosophy* (1533) gives magic squares of order 3 to 9 for the seven classical planets (Saturn 3, Jupiter 4, Mars 5, Sun 6, Venus 7, Mercury 8, Moon 9), so 6 x 9 is the Sun's side crossed with the Moon's. A tidy "top finger open means letter" explanation does not hold exactly, because 8 and 9 also have that bit set.
- **Gray code** (Proposal): if neighboring cells differ by one finger, adjacency equals ergonomic adjacency and linked casts become easy. The 4-bit Gray sequence leaves the 0-9 range, so a Gray-ordered board needs relabeling. Not implemented.

---

## 4. Input system

### 4.1 Early chord ideas (Proposals, first turns)

- 4 keys per nibble, 15 usable chords plus the empty chord.
- Key bits that mean something (for example 1 fire, 2 water, 4 earth, 8 air) so chords compose and the grid reads like a periodic table. **Superseded by D-04** (scopeless board), kept for reference.
- Timing layers: tap versus hold on the second chord for a charged or sustained cast, release order as a flourish modifier, a roughly 60-80 ms window so chords register as one press. The thumb commit in the prototype removes the need for the window.
- Hardware: membrane keyboards ghost with 3-4 simultaneous keys, mechanical NKRO is fine, the CharaChorder is natively chord based. Keep the key cluster remappable.

### 4.2 Hand polarity and sequencing

- D-09: **0 closed, 1 open.** A fist is 0000, an open hand is 1111.
- Flag: in power symbols 0 usually means off, and in circuits closed usually means on. The designer's mapping is the opposite of the usual electrical convention, so the prototype exposes a flip flag in the input layer.
- Open hand as separator, two-handed bytes (left hand row, right hand column at once), and beginner one-hand sequential were Proposals. In the prototype the **thumb commits** each nibble: row, then column, then the spell is readied.

### 4.3 Anatomy and detection (Proposals)

- The ring finger is hardest to curl alone because it shares tendons with its neighbors, so ring-only chords feel expensive. That gives the same cell-cost puzzle in the body.
- Curl angle is easy to read with hand tracking. True contact is noisy because fingers occlude each other. Use curl thresholds with hysteresis.
- Input agnostic: the game only sees a nibble, so keyboard, numpad, drumpad, CharaChorder and hand tracking can share one system.
- Sensing idea: an EMG and IMU wristband reading finger states.

### 4.4 Mudra lineage (Lore lead)

Japanese kuji-in (nine seals) and Buddhist and Hindu mudras are thumb-contact hand-sign traditions. They are lore for naming poses without making contact literal.

### 4.5 Device mappings (User)

| Device | Thumb | Four fingers (index to pinky) | Notes |
|---|---|---|---|
| Keyboard, right hand | `b` | `7 8 9 0` | "b7890 keys could be acceptable" |
| Numpad, right hand | `0` | `7 8 9 +` | "numpad 0789+" |
| Drumpad, right hand | pad 1 | pads 9, 14, 15, 12 | thumb to pinkie: 1, 9, 14, 15, 12 |
| Drumpad, left hand | pad 4 | pads 12, 15, 14, 9 | thumb to pinkie: 4, 12, 15, 14, 9 |

- Flag (Q-08): pads 9, 12, 14 and 15 appear in both lists.
- Assumptions the prototype added to fill gaps: left-hand keyboard = space for thumb and `4 3 2 1` for index to pinky; left-hand numpad = the right-hand finger order mirrored (`+ 9 8 7`); space is an alias thumb on all keyboard profiles; the drumpad profile also reads a keyboard fallback (`z x c v`, `a s d f`, `q w e r`, `1 2 3 4` as pads 1-16, bottom row first); MIDI pad 1 = note 36 by default, editable.
- Possible route: if the drumpad is the Maschine MK3, the existing Cantrip driver work could feed pad events.
- Finger bit values are fixed by finger, not by hand: index 8, middle 4, ring 2, pinky 1, so the same hand sign works mirrored.
- Game logic sees only five logical inputs (T, I, M, R, P) plus a polarity flag. Each device is a profile mapping hardware to those.

---

## 5. Inventory and spell board

### 5.1 Core model (Proposal, developed through the session)

- **Chords are the address, the grid is the loadout.** The origin cell is what you chord. Everything else is out-of-combat arrangement.
- Spells are small polyominoes anchored at an origin cell. A bigger footprint means more power and more border for components.
- Borders carry typed sockets. A spell fires only as far as its sockets are filled by adjacent components.
- Components are shapes too. A big component can fill several sockets, or sit between two spells and serve both. Rare ones are wildcards or add a tag.
- Alternate recipes: one rare component can cover two requirements and free a slot.
- Shared components can draw from a cluster mana pool, or have a per-component charge, so overlap trades slots for burnout.
- Defaults: the first page is pre-arranged so optimizing is a mastery layer, not a gate. Raw selection always works. Rearranging is out of combat.
- Hybrid spells need components from two schools to border them (gold cards). Generic sockets (any) are colorless mana. Dual components are rare dual lands.
- Foraging: components carry tags, quality and shape. Biomes act as basic lands, borderlands drop duals, and your route decides your colors.
- Mono-school payoff (devotion) makes splashing a second school a real tradeoff.

### 5.2 Six inventory plates (inventory-concepts.html)

| Plate | Method | Lineage | Layout skill | Hand skill | Foraging yields | Cost |
|---|---|---|---|---|---|---|
| I | Packed grid | Backpack Hero, Resident Evil attache case, Opus Magnum | High | Medium | Shapes and tags | High |
| II | Linked sockets | Path of Exile gems, Diablo runewords | Medium | Low | Gems and supports | Medium |
| III | Wand tape | Noita, Magicraft, Zachtronics | High | Medium | Tokens and modifiers | Medium |
| IV | Element codex | Magicka, Little Alchemy, Outer Wilds ship log | Low | High | Fingers and discoveries | Low |
| V | Page loadouts | Slay the Spire, Monster Hunter | Medium | Medium | Recipes and ink | Low |
| VI | Belt and bandolier | Dark Souls flasks, Zelda bottles, Receiver | Low | Medium | Charges | Low |

Plates IV and VI are cheap and stack with anything (unlock fingers, spend charges). Plate IV's idea of foraged sigils unlocking fingers, which multiplies reachable cells, still fits a scopeless board.

---

## 6. Magic schools

### 6.1 Verbs (Proposals unless marked)

| School | Archetypes (Lore leads) | Verb | Behavior |
|---|---|---|---|
| Astral (D-05) | astrologer, Persian magus, Chaldean sky-reader | Pattern | Components form constellation shapes for bonuses. Moon phase or time can charge them. Divination is information (previews of telegraphs). Illusion rides the light theme |
| Alchemy (D-05) | Hermetic adept, Daoist elixir makers | Reaction | Adjacent components react, flasks are consumed. Timing: tap throws raw, hold ripens, release at the sweet spot. Five-phase cycle is a ready reaction table |
| Wayfarer / locomotion (D-05) | shaman soul-flight, Daoist step patterns, witch's mortar, hoodoo lodestone | Motion | Teleport swaps two cells and magnetism pulls components. The one school that rearranges the loadout mid-fight |
| Bloom (D-05, plants) | druid, curandera, rootworker | Growth | Components seed into neighbors, ripen, then rot. Freshness is a clock. Plugs into foraging and healing |
| Smith (D-06) | Ogun (Yoruba orisha of iron), Mande blacksmith caste and nyama, Norse and Yakut smiths | Charge | Resistive heating: current heats metal, metal carries current. Metal soaks charge or heat across casts and releases it. Overheating is its clock |
| Necro (D-07) | volva, sangoma | Raise | Shares one resource with Bloom: **rot**. Bloom ripens until components spoil, Necro raises the spoiled. Raising drains freshness from living neighbors. Golgari (black-green) as the reference |

### 6.2 Other schools raised and set aside

Seal (Solomonic seals, Daoist talismans), Pact (djinn, fae bargains), Ancestral (volva, sangoma), Voice (Kalevala singers, Norse galdr), Weather (medieval tempestarii, Slavic storm lore). D-08 turns Voice, Pact and Rune into components or progression axes.

### 6.3 Rivalry ring (Proposal)

Five schools in a ring where each feeds one neighbor and checks another, like the MTG color wheel and the five-phase cycle. Suggested first pie: Astral, Alchemy, Wayfarer, Bloom, Smith. Necro still needs a slot or a Bloom hybrid (Q-05). Storm is a hybrid seam between Smith and Wayfarer (Q-04). Hybrids give the ring its seams.

### 6.4 Superseded

An early elemental split (Ember, Tide, Stone, Gale, Bloom) was proposed while explaining color-pie mechanics, and an early plate set used element rows. Both were replaced by D-04 and the schools above.

---

## 7. Hand signs and poses

- D-09 polarity, D-10 touching poses, D-11 per-class variants.
- **Logic versus skin** (Proposal): the nibble is the logic, the pose is the skin. One nibble can have a base pose plus a school-flavored variant.
- Stances (draft, invented placeholders): Astral thumb to ring finger ring, Alchemy a pinch and shake, Wayfarer two fingers walking the knuckles, Bloom a cupped pod opening, Smith a fist knocking the palm, Necro palm down dragging through soil.
- **Animation need** for first person or VR: 16 nibble poses with school variants. Cheaper build: finger-curl targets per pose, school-specific wrist and palm orientation, plus particle color. In isometric view only a small flourish is needed.

---

## 8. Camera, aiming and familiars

- D-12: isometric base, first person or VR possible and switchable, familiar vision.
- D-15 cast flow: chord the address, the thumb starts the spell, then mouse aims, left click uses, right click zooms (perhaps). Mechanics differ per spell. Familiar-assisted interactions were floated. The designer flagged scope creep.
- **Aim archetypes** (Proposal): Point (bolt or beam), Arc (lob), Place (ground target), plus Blink in the prototype.
- **Themed indicators** (Proposal, implemented): Smith a glowing wire with a heat shimmer, Astral a constellation of points, Alchemy a vapor arc, Wayfarer a ghost silhouette at the destination, Bloom a sprouting seed, Necro a wisp on a tether, Storm a zigzag current.
- **Familiar vision** (Proposal, implemented): fog hides what the player's sight does not reach. The familiar has its own reveal radius and its own camera mode. Enemy telegraphs show when seen.
- **Scope tiers** (Proposal): 0 chord logger and resolver, 1 add cheap plates and one aim archetype in isometric, 2 add packing and 2-3 schools, 3 add familiar vision, first person, hand animation and VR.

---

## 9. Cloak presentation

- D-13: components live in a bag or in the cloak, and the cloak could open as the inventory menu.
- Proposals: the cloak lining is the board (stitched pockets), snap-in with a magnet pull and no physics, two tiers (bag for bulk, cloak for the active loadout), opening the cloak mid-fight as a vulnerability window, and rotation as the only manual fitting step. All of this is in the prototype except the vulnerability window.
- Concern to keep in mind: realistic fitting can break immersion if done wrong.

---

## 10. Orb input device (D-18)

- Idea: an orb with capacitive touch regions.
- Open (Q-11): sizing across hands.
- Proposals: calibrate per user by resting the hand and recording five contact centroids, or use force sensing so finger count stays constant. An IMU inside would let rotating the orb aim. Two or three diameters or a modular shell. Prototype first with drum pads or force pads.

---

## 11. Direction pivot: utility, story, community (latest)

**User (D-20, D-21):** the prototype feels clunky, maybe just needs getting used to, and it seems hard to do much combat until you are very fluent. The designer would like to dissuade combat and lean into utility spells, story and choose-your-own-adventure, player customization, environment customization. PvE is likely the main mode, and combat between communities is a possible exception.

**Proposals from the discussion:**

- The slow input (two chords plus a thumb) is a feature for ritual. It only fails if a spell must land inside half a second. Fluency becomes the skill, like speaking, and favorites drift into cheap cells until they are muscle memory.
- **Spellbook as vocabulary:** spells are verbs the world answers (dissolve, go, hold). The sentence you build and the components you brought decide which story branch opens.
- **Provenance:** foraged components carry where they came from, so the same moss can behave differently and also mean something to the people you hand it to.
- **Utility identities per school:** Astral mapping, lighting, stagecraft, illusions that change how a place feels. Alchemy brewing, preserving, dissolving, curing. Wayfarer ferrying, tethering, doors between settlements, logistics as magic. Bloom growing, mending, terraforming. Smith forging, repairing, powering. Necro remembering, since the dead hold the stories, which also doubles as narrative branching through "speaking to ancestors".
- **PvE as the land and its moods:** blight spreads, storms roll in, wild spirits want bargains. Rot becomes an ecological force that Bloom and Necro tend or fight.
- **Community conflict as ritual:** siege as a huge slow warding or unwarding needing several players chording in sync, like a choir, so hard input becomes coordination. Rival towns contest a season, a river or a harvest with big slow spells where preparation is the fight, and spectators can read the hand signs. Fights carry built-in cost, since spells draw on land you would be harming. The rivalry ring doubles as the diplomatic map of who feeds and who checks whom.

---

## 12. Rune puzzles as embedded-engineering easter eggs (D-22)

The designer's idea: rune puzzles could be PCB layout problems, with binary, hex and layout puzzles as easter eggs. Proposals so far:

- **PCB layout as seals:** route traces with no crossings, match lengths so two runes arrive together, keep sensitive runes away from noisy ones. A ground plane is a warding circle. A via is a portal between layers (Wayfarer). Decoupling caps next to the power pin or the spell browns out.
- **Gray code locks:** dials where only one bit may change per turn. The board's neighbor-differs-by-one-finger idea is already one.
- **Parity and Hamming:** an inscription with one flipped bit to find and fix. Ties to wild-magic miscasts being one bit off.
- **Logic gates as runes:** AND, OR, XOR, NOT wired into seal circuits with truth tables as the clue.
- **Floating pins:** an unconnected input is an unbound spirit until you pull it up or down.
- **Debounce:** a rune that chatters on and off and needs a time filter.
- **Serial protocols:** UART framing with start and stop bits and baud mismatch as garbled spirit speech. I2C address collisions as two spirits with one address. SPI clock polarity and phase as variants of one hand sign.
- **RC curves:** charge and decay are exponential, so Bloom ripening and rot can be a literal capacitor curve.
- **Voltage dividers:** alchemical dilution.
- **Resistor color bands:** read the rings on a charm for its value.
- **Watchdog timers:** a ward that resets the area if you do not pet it in time.
- **Interrupts versus polling:** a guardian that sleeps until woken or one that stays awake and burns power.
- **Endianness:** a seal that only works read in the right byte order.
- **LFSRs:** a sequence that looks random but cycles, so the key is the seed.
- **Memory maps:** the cloak as a memory map, with alignment, overlap and overflow as packing problems.
- **Magic smoke:** miswire and release the smoke as a visible fizzle.
- **Datasheets as grimoires:** the answer sits in an in-world datasheet's timing table, with the errata page as a hidden hint.
- **Bricked spirits:** unresponsive until reflashed with the right bootloader sequence.

---

## 13. Prototype manifest and handoff notes

### 13.1 chorded-grimoire-inventory-concepts.html (early)

Single file, six plates, sticky chalk rail taking live chords. Assumes elemental rows and a 0-9 column set and column 0 on the thumb. Kept for reference, since the plate ideas still apply, but parts of Plates I, II and V are out of date relative to D-04 and D-14.

### 13.2 chorded-grimoire-cloak-proto.html (current)

Single file, no dependencies except Google Fonts. Design language: ARX parchment (#F5EFE4), rust (#7A3A1A), EB Garamond and IBM Plex Mono, with dark twill wool for the cloak and the practice field.

**Chord flow:** shape the fingers, press the thumb to lock the row (needs `1010`-`1111`), shape the column, press the thumb. If the address is a spell origin with at least one socket filled, the spell is readied, and the stage takes aim. Left click looses it. Esc stows it. Pressing the thumb while aiming also stows it.

**Controls:** fingers on the on-screen hand toggle. Keyboard, numpad and drumpad profiles with right and left hand, a polarity flip, and Web MIDI for pads. `T` turns the selected or held piece. `G` toggles familiar vision. Right mouse button held zooms. `Esc` stows or cancels a drag. Space is an alias thumb.

**Board:** drag spells and components between cells and the tray. The cloak opens once on load (flaps slide apart). The "Finger cost" overlay shades cells by chord cost. "Forage a clearing" adds three random components to the tray. "Age living things" and "Pause rot" control the Bloom clock.

**Data model (all pieces in one array):**
- `spell`: `{id, name, schools[], aim, look, range, need[], cells[[r,c]], r, c, blurb}`. Origin is `cells[0]` offset by `r, c`.
- `comp`: `{id, name, tags[], cells, r, c, charge?, heat?, fresh?, fmax?}`. `r == null` means in the tray.
- Neighbors of a spell are components with a cell 4-adjacent to any spell cell.
- Each neighbor offers its current tags. Tags: `astral, alch, way, bloom, smith, rot, any`.
- **Socket fill:** typed sockets take a matching tag first, then `any` sockets take what is left. Power = filled / total. An Astral constellation (two or more astral contributors in one row or column) multiplies power by 1.5. Power 0 means the spell fizzles.
- **Spend rules on cast:** components with `charge` lose one and vanish at 0 (Alchemy). Components with `heat` gain one and overheat at 3 for 4.5 seconds, providing no tags (Smith). Rotten components contributing to a Necro spell are consumed, and living neighbors lose 2 freshness. Bloom components lose 1 freshness every 3 seconds and become Rot tags at 0.
- Wild magic: columns 10-15 clear the top bit.

**Starting layout:**

| Spell | Schools | Aim and look | Range | Sockets | Origin |
|---|---|---|---|---|---|
| Cinder bolt | smith | point, wire | 7 | smith | A1 |
| Starfall | astral | place, constellation | 6 | astral, any | A5 |
| Quicksilver flask | alchemy | arc, vapor | 7 | alch, any | C1 |
| Brimstone rain | alchemy + smith | arc, vapor | 7 | alch, smith | C4 |
| Lodestep | wayfarer | blink, ghost | 6 | way | A8 |
| Briar snare | bloom | place, sprout | 6 | bloom | E1 |
| Raise thornwalker | necro (rot) | place, wisp | 6 | rot | E5 |
| Stormstep | smith + wayfarer | blink, storm | 6 | smith, way | D7 |

Placed components: Cinder (B1), Retort (alch x2, 4 charges, C2-C3), Starglass (B5), Iron nail (B4), Lodestone (B8), Hearth coal (D6), Mugwort (F1, freshness 9), Moss mat (bloom x2, E6-F6, freshness 5). Tray: Twine x2, Meteoric iron (smith + astral), Waybone (way x2), Struck oak (bloom + smith), Salt pinch (alch, 3 charges), Moonsilver (astral x2, L-shaped).

At load, every spell is at 100% except Starfall (50%, missing its `any` socket) and Raise thornwalker (0%, fizzles until Moss mat rots).

**Practice field:** 13 x 13 isometric tiles with fog, four wandering dummies who periodically telegraph, and a familiar that orbits the player or, in familiar mode, follows the mouse and becomes the camera with a sepia vignette. Effects are rings, bolts and lingering zones per look.

### 13.3 Verification status (be honest about this)

- **Done:** JavaScript syntax check. A Node run of the logic (socket fill for every spell, chord commit, row validation, wild-magic warp, rot and raise, constellation bonus, Smith overheat, Alchemy spend, rotation, forage, device mapping for keyboard, numpad and drumpad on both hands, polarity flip). A headless Chrome render of the full page with the cloak forced open and a spell readied, which showed the board, tray, sheet, hand and stage as intended.
- **Not verified:** the cloak-open animation (the flap transition did not advance in headless rendering, so it showed closed until forced). Two small layout fixes made after the last screenshot (tighter tray spacing and smaller font for long spell names) were only syntax-checked, not re-rendered. Real keyboard chord feel, touch, MIDI hardware, left-hand visuals and pointer dragging on touch screens have not been exercised.
- **Known rough edges:** no rearranging by keyboard alone (the spellbook buttons only select). The thumb-commit timing and clunk (D-20) are unproven against real use. Pad numbering in the keyboard fallback assumes bottom-left is pad 1.

---

## 14. Superseded or set aside

- Elemental rows, element-based chord bits, and a column 0 on the thumb (D-04, D-14).
- Early elemental school split (Ember, Tide, Stone, Gale, Bloom).
- Tap/hold chord window of 60-80 ms (the thumb commit replaces the need).

---

## 15. Source log (condensed, chronological)

1. **Input schema idea.** Chorded nibble, hex grid A1-G9, hand-sign flavor. Reply laid out nibbles, bytes, meaningful key bits, fizzles, timing and hardware.
2. **F9 correction.** Hex tops out at F. Board sizes discussed (54 or 225).
3. **Grid as loadout.** Variable spell sizes, component requirements, overlap, alt recipes, foraging, multicast. Reply: chords as address, polyomino spells, sockets, pools, Gray code, foraging.
4. **Chalkboard photo.** Request for methodologies and inventory GUI concepts. Delivered the six-plate HTML.
5. **Plate I and scopeless grid.** Rows are not elements. Schools use different components. Reply: school verbs, hybrids, chord ergonomics, open forks.
6. **Magic types.** Astral, Alchemy, locomotion, plants, folk traditions. Reply: verbs per school, extra schools, kuji-in, rivalry ring.
7. **Smith, Necro, hand signs.** Smith with fire and electric, Necro with Bloom, Voice/Pact/Rune as components, curiosity about hand signs.
8. **Polarity, POV, cloak, orb.** 0 closed and 1 open, finger-touch poses, variants, isometric plus familiar vision, hand animation, cloak inventory, A-F reasoning, cut column 0, thumb starts the spell, mouse aiming, handedness, device mappings, orb. First notes export requested.
9. **Prototype v2.** Rebuilt the UI proto to match the updates (the cloak proto file).
10. **Clunk feedback and pivot.** Feels clunky, lean toward utility, story and customization, PvE, community combat.
11. **Rune puzzles as embedded easter eggs.** Embedded-engineering puzzle ideas.
12. **Re-export** of these notes with the whole conversation.
