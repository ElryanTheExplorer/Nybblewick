---
status: proposal
tags:
  - spell
  - school
refs:
  - D-04
  - D-05
  - Q-01
---

# Alchemy Spellbook

[[Alchemy]]: **Reaction**. Brew, preserve, dissolve, cure. Ring neighbors: [[Astral]] and [[Bloom]]. Components from the Saltings ([[Component Catalog]]). Alchemy components carry **charges**: each cast spends one (refilled at waystones if Q-01 lands on "require", see [[Component Taxonomy]]).

How to read: see [[Spell Anatomy]]. **Code** = ID byte in [[Loadout Codes]] (`2x` = Alchemy). **Starter cell** is a suggestion only (D-04).

## Spells
| Code | Spell | Verb | Aim | Footprint | Sockets | Starter cell |
|---|---|---|---|---|---|---|
| `21` | **Quicksilver flask** (prototype) | dissolve | arc | `I2` | alch, any | `C1` (cost 3) |
| `22` | Preserving brine | preserve | point | `I2` | alch | — |
| `23` | Cure draught | cure | arc | `L3` | alch, alch, any | — |
| `24` | Brine causeway | terraform (crystallize) | arc | `L4` | alch, alch, any | — |
| `26` | Drain | drain water and brine | place | `L3` | alch, alch, any | — |
| `25` | Steep | brew | self (at a kettle or station) | `O4` | alch, alch, any, any | — |
| `71` | **Brimstone rain** (prototype; off-ring, + [[Smith]]) | fumigate, smelt | arc | `L3` | alch, smith | — |
| `A2` | Bottled starlight (hybrid, + [[Astral]]) | brew light | self | `I2` | alch, astral | — |
| `B1` | Fungal tonic (hybrid, + [[Bloom]]) | cure (land) | arc | `L3` | alch, bloom, any | — |

| Spell | Recipe | Alt recipe | Catalyst variant | World interaction (what persists) | Story hook |
|---|---|---|---|---|---|
| Quicksilver flask | Salt pinch + Twine | Retort alone (alch ×2) | Quickening yeast: **transmute** instead of dissolve (rubble to salt, rust back to iron) | Dissolves a rockfall, a rust-locked gate, ice, a bramble wall. **The path stays open.** | Retort survey crews clearing the old salt road ([[Alchemy Storyline]]). |
| Preserving brine | Brine pearl | Salt pinch | Philosopher's salt: **permanent** | Stops decay on a target: food stores, a sick tree's wound, old letters, a body awaiting burial. On the board, pauses freshness of bordering Bloom components. | An elder asks you to keep her late husband's letters from crumbling. |
| Cure draught | Retort + Mugwort (offered as `any`) | Tincture moss + Salt pinch | Mandrake tear (event): cures a **blight**, not just a creature | Heals a person, animal or tree. A healed NPC **remembers** and offers help later. | Marsh fever in a Saltings village. |
| Brine causeway | Retort + Twine | Starsalt + Salt pinch | Quickening yeast: the causeway is **salt-stone**, permanent | Crystallizes a path across shallow water or marsh. **Lasts until the autumn rains** ([[Day Night and Seasons]]); villagers harvest the salt. | Salt-cutters need a way to the outer pans. |
| Drain | Retort + Twine | Brine pearl + Salt pinch + Twine | Philosopher's salt: the drained brine sets as a **salt pan** you can harvest | Draws off standing water or brine from a passage, cellar or field. **Stays drained until the next flood season** ([[Day Night and Seasons]]). Opens flooded-passage gates ([[Traversal and Verb Gates]]). | The Drowned Causeway on the Saltings ([[Ring Regions]]). |
| Steep | Retort + Spring vapor flask + Twine ×2 | Any 2 alch + 2 other components | Philosopher's salt: the brew never spoils | Makes a **bottled brew** item from bordering components, usable by anyone. The crafting spell; gifts carry your [[Provenance]]. | Commissions from the Retort's guild-house ([[Commission Loop]]). |
| Brimstone rain | Sulfur bloom + Hearth coal | Brimstone (event rare, alch + smith, fills both) | Fulgurite: the smoke carries current, starting a cold forge from afar | Sulfur smoke drives pests from a granary, or **smelts surface ore in place** for Smith work. Leaves yellow scorched earth for a season. | Off-ring: the Retort and the Anvil Hall don't share a border, so this recipe is a rumor until you route both ([[Research Loop]]). |
| Bottled starlight | Starsalt alone (alch + astral) | Salt pinch + Starglass | Eclipse pearl: bottled **darkness** | A flask of light. Uncork it anywhere to light a room **permanently**. A favorite gift. | The Starwatch trades light for Retort salt. |
| Fungal tonic | Tincture moss + Twine | Salt pinch + Mugwort + Twine | Heartwood chip: the grove stays immune to that blight | Cures a blighted grove or field. **Restoration progress** ([[Restoration Loop]]). | Fungal Springs: who owns the cure, Retort or Hedge Circle? ([[Cross-School Tensions]]) |

## Dye recipes
Dyeing is crafting at the dye vat (sanctum furniture), not a cast, so it works whichever way Q-01 lands. Looks and palettes live in [[Component Dyes]]; the recipes live here.

| Dye | Recipe | Notes |
|---|---|---|
| Marsh green | Salt pinch + Mugwort | Starter dye |
| Moon wash | Moonsilver + Salt pinch | Lightens any ramp one step |
| Ember lacquer | Hearth coal + Retort | Only sets on metal (rings, staff caps) |
| Mourning ink | Grave-wax + Starsalt | Deep violet-black for markings |
| Tideline blue | Brine pearl + Lodestone | Proposed fifth: river teal from the Crossings |

## Board notes
- Charges make Alchemy components a budget. Put a 3-charge Salt pinch where only one spell reaches it; put a Retort between two spells only if you accept it running dry twice as fast.
- Preserving brine is the only board-side counter to the Bloom clock: a utility spell that is also a layout tool.

## Related
- [[Alchemy]], [[Spell Anatomy]], [[Component Catalog]], [[Catalysts]], [[Component Dyes]], [[Astral Spellbook]], [[Bloom Spellbook]], [[Hybrid Spells]]

## Open threads
- Brimstone rain pairs non-neighbors. Keep it as the canonical off-ring example, or retire it? The prototype and [[Hybrid Spells]] call it a hybrid, but Alchemy and Smith are not neighbors in the [[Canon Sheet]] ring.
- Should Alchemy's tap / hold / release timing ([[Alchemy]]) apply to Steep, so ripeness of the brew is a gentle timing game (never twitch, [[Not Doing]])?
- Can Steep's bottled brews hold *other* schools' spells, so a non-Alchemist can carry one cast?
