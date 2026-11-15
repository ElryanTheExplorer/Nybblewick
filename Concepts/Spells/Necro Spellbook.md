---
status: proposal
tags:
  - spell
  - school
refs:
  - D-04
  - D-07
  - Q-05
---

# Necro Spellbook

[[Necro]]: **Raise**. Remember, speak with the dead, raise. Ring neighbors: [[Bloom]] and [[Smith]]. Components from the Barrowfen ([[Component Catalog]]). Necro uses the `rot` tag: it **consumes** rotten pieces and drains 2 freshness from living neighbors. Necro is not a villain: it tends the end of the cycle that Bloom begins ([[Rot]]).

How to read: see [[Spell Anatomy]]. **Code** = ID byte in [[Loadout Codes]] (`4x` = Necro). **Starter cell** is a suggestion only (D-04).

## Spells
| Code | Spell | Verb | Aim | Footprint | Sockets | Starter cell |
|---|---|---|---|---|---|---|
| `41` | **Raise thornwalker** (prototype) | raise (a helper) | place | `I2` | rot | `C8` (cost 3), beside Sprout's Moss mat |
| `42` | Graveside | speak with the dead | place (a grave, bones, a relic) | `L3` | rot, rot, any | — |
| `43` | Echo | remember (a place) | self | `T4` | rot, rot, any, any | — |
| `44` | Lay to rest | quiet a spirit | point | `I3` | rot, any, any | — |
| `45` | Wither | un-grow | point | `I2` | rot | — |
| `46` | Remembered path | recall a road or bridge that once stood | place | `I3` | rot, rot, any | — |
| `C2` | Rootmemory (hybrid, + [[Bloom]]) | remember (a tree) | point | `L3` | rot, bloom, any | — |
| `D2` | Wake the forge (hybrid, + [[Smith]]) | raise (a machine spirit) | place | `O4` | rot, smith, any, any | — |

| Spell | Recipe | Alt recipe | Catalyst variant | World interaction (what persists) | Story hook |
|---|---|---|---|---|---|
| Raise thornwalker | Rot (a spoiled Moss mat) | Ghostcap | Mourning veil: the walker **stays until dawn** and follows simple orders | Spoiled brush stands up and walks where you point: hauls a log, tramples a blight patch into compost, carries a lantern. The trampled path **stays clear**. | The Barrow Wardens use thornwalkers as field hands; outsiders find it ghoulish ([[Necro Storyline]]). |
| Graveside | Grave-wax + Rot + Twine | Barrow bead + Peat brick (rot ×2) | Named barrow bead: reach **one specific** ancestor | Opens a conversation with the dead of that place. Their answers open **story branches** and pin memories on your map ([[Story Scene Structure]]). | A family wants to know where their grandmother hid the deed to the mill. |
| Echo | Peat brick + Barrow bead + Twine ×2 | Bog-oak (rot ×2, `I3`) + Twine ×2 | Comet hair (off-school): the echo plays the place's **distant past** | Replays a ghostly scene of what happened here. Clues are **copied into the grimoire**. | Who broke the Crossings ferry? The river remembers. |
| Lay to rest | Grave-wax + Twine ×2 | Barrow bead + Will-o-wick + Twine | Mourning veil: the spirit leaves a **gift** behind (a Storied component) | Ends a haunting for good; the place becomes **safe** and NPCs return. The Necro answer to many [[Encounter Types]]. | A restless miller in the Grave Forges who never finished his last order. |
| Wither | Rot | Ghostcap | Heartwood chip (off-school): withers **only** the invasive plant, feeds the rest | Clears overgrowth: a choked road, a strangling vine, an invasive bramble. **Stays cleared.** Cancels a Bloom hedge or root bridge (D-07). | The Tanglewood is choking a village; the Hedge Circle says wait ([[Cross-School Tensions]]). |
| Remembered path | Peat brick + Twine | Bog-oak + Twine | Named barrow bead: the path is the one **that person** walked, and leads where they went | A ghostly bridge or road that once stood here returns. **Holds for one in-game hour**, and becomes **permanent** once its story is heard ([[Traversal and Verb Gates]]). | The Drowned Causeway, walked by the dead every autumn ([[Ring Regions]]). |
| Rootmemory | Ghostcap + Twine | Rot + Mugwort + Twine | Old Wood seed: ask the **oldest** tree in the region | An old tree tells what it saw. Answers become **map notes** and story leads. | The Mulch: the trees remember the first dusk ([[Premise Options]], The Long Dusk). |
| Wake the forge | Grave iron + Hearth coal + Twine ×2 | Rot + Iron nail + Grave-wax + Twine | Quench oil: the forge spirit **stays** and works the forge at your sanctum | Raises the spirit of a dead forge so it works again. **Permanent**: a restored forge in the world ([[Restoration Loop]]). | The Anvil Hall and the Wardens disagree over whether a forge's spirit should be woken. |

## Board notes
- Necro wants rot, which comes from **spoiled Bloom**. Place your Necro spell next to your oldest Moss mat: when it rots, the spell powers up.
- Necro also drains living neighbors. Keep it away from Bloom you still need fresh.
- Under Q-01 "require only", Necro borrows rot and the piece becomes Peat after 3 raises ([[Component Taxonomy]]).

## Related
- [[Necro]], [[Rot]], [[Spell Anatomy]], [[Component Catalog]], [[Catalysts]], [[Bloom Spellbook]], [[Smith Spellbook]], [[Hybrid Spells]], [[Spellbook as Vocabulary]]

## Open threads
- Should "speak with the dead" be a full dialogue scene, or a single line per cast (cheaper to write)?
- Consent: do some dead refuse to be raised or asked? A refusal is a good story beat and keeps Necro from feeling like a villain school.
- Can a thornwalker be a co-op friend's temporary body when they drop in ([[Drop-In Co-op]])?
