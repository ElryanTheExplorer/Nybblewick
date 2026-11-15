---
status: proposal
tags:
  - customization
  - art
refs:
  - D-21
  - D-28
  - Q-77
---

# Wizard Drip

What your wizard wears and carries. **Cosmetic only:** no stats, no bonuses. It's a reward type in the [[Incentive Model]] and a way to show where you've been.

## Slots, by which camera shows them
At 480x270 the iso wizard is ~32 px tall, so different slots matter in different modes ([[Context Camera Modes]]).
| Slot | Iso | Scenes | First person | Examples |
|---|---|---|---|---|
| **Hat** | Silhouette (the main read) | Yes | No | Starwatch tricorne, Hedge Circle moss-cap, Waymarch wide brim, Anvil Hall leather hood |
| **Robe** | Main color block | Yes | Sleeves only | Salt-bleached smock, peat-brown wrap, star-dotted gown |
| **Staff / wand** | Yes, a 1-2 px line | Yes | Yes, at the edge | Driftwood (Crossings), lightning-split oak, iron rod, bone wand |
| **Rings** | No | Close-ups | **Yes, one per finger** | Moonsilver band, nail-iron ring, braided root |
| **Hand markings** | No | Close-ups | **Yes** | Ink sigils on the back of the hand and knuckles |
| **Lantern** | Yes, a lit pixel (hat, staff or hood light) | Yes | Edge of frame | Your **Notoriety light**: Clear, Smoking, Guttering, Snuffed ([[Notoriety and Oaths]]). You choose the housing (paper, horn, iron cage, moth-glass); the flame's state is not cosmetic and can't be hidden |
| **Satchel** | Small | Yes | No | Waxed canvas, reed basket, ferry-mail bag |
| Cloak | See [[Cloak Appearance]] | | | |

## Rings and markings as quiet teaching
- **Apprentice marks:** the starting hand markings are the bit values `8 4 2 1` inked on the index, middle, ring and pinky knuckles ([[Finger Bit Values]]). You can swap them for school sigils later, once you don't need them.
- **Bit rings:** a ring glows when its finger is open (1). In first person this is a second, diegetic readout of the chord.

## How drip is earned
| Source | Example |
|---|---|
| **Story** | Order regalia at Standing milestones ([[Standing]]): the Barrow Wardens' bone pin after their storyline's second act |
| **Gifts** | From NPCs and co-op friends; keeps the giver's name ([[Gift and Provenance Economy]]) |
| **Crafting** | Smith forges rings, Bloom weaves hats, Alchemy makes dyes ([[Component Dyes]]) |
| **Restoration** | A region's look unlocks when you heal it: Tanglewood leaf-crown after the blight front clears ([[Restoration Loop]]) |
| **Seasons** | Wick Fair costumes from [[Seasonal Contest Loop]] |
| **Found** | Rare hats on landmarks, for explorers |

No shop, no currency (D-28, Q-25).

**Q-77:** Should the starting hand markings be the bit values `8 4 2 1` (a teaching aid you outgrow), or plain sigils with the bit values only in the HUD?

## Related
- [[Cloak Appearance]], [[Component Dyes]], [[Notoriety and Oaths]], [[Familiar Customization]], [[Sanctum Decor]], [[In-the-Coat Duel View]], [[Incentive Model]], [[Customization MOC]]

## Open threads
- Wardrobe presets tied to [[Loadout Presets]] (swap look with loadout)?
- Can others see your provenance (who gave you that hat) by inspecting you?
- Does the iso silhouette need hat-height limits for readability?
