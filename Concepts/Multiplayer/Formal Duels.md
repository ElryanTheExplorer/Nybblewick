---
status: proposal
tags:
  - multiplayer
  - input
refs:
  - D-20
  - D-21
  - D-27
  - Q-61
---

# Formal Duels

A duel is a ritual exchange of utility spells between two consenting wizards. No health bars: you win by binding, out-reading or out-preparing the other, not by out-clicking them. This note owns the **duel visibility rule** used by [[In-the-Coat Duel View]].

## The rite
1. **Challenge:** send a sealed glyph naming the terms: tempo, wager, witnesses, place.
2. **Accept or decline.** Declining is free, with two exceptions: a wizard under the **Oath of the Witness** must accept ([[Notoriety and Oaths]]), and a **caught thief** called to account must accept or take a Notoriety step ([[Subterfuge]]).
3. **Prepare and declare:** each duelist packs a duel loadout in private ([[Loadout Presets]], [[Grimoire Pages]]) and **declares its spell list**: names are public, addresses are not. Preparation is half the duel ([[Design Pillars]], pillar 3).
4. **Draw the circle:** witnesses stand at the edge; the view moves into the coat.
5. **Exchange rounds** until someone holds three **Marks**, or yields.
6. **Settle:** the wager changes hands; witnesses record the result on each duelist's duel leaf.

## Visibility rule
- The opponent's hand is hidden while they shape the row chord. **After the row commit, their hand is readable**: you watch the column chord form.
- A duelist can **sleeve** a hand (hide the column too), but sleeving costs a round: they skip their next call.
- Because the spell list is declared, reading the row plus a half-formed column is often enough to guess the spell. That guess is the duel's core skill.
- **Q-61** (merges E's Q-73): is this the right reveal point, or should only fluent readers (a fluency tier) see the column forming?

## The duel spells
| Role | Spells (school) | Effect in a duel | Beaten by |
|---|---|---|---|
| **Ward** | Salt-and-star ward (Astral + Alchemy), Briar hedge (Bloom), Hearthstone (Smith) | Protects one of your board rows or columns for the round | Unweave |
| **Unweave** | Unweave (Astral) | Breaks a ward or a Glamour | Glamour (unweaving a decoy wastes the round) |
| **Glamour** | Glamour (Astral) | Dresses your board: a phantom ward on an open line, or an open look on a warded one. It never hides which cell you chord | Unweave |
| **Tether** | Tether (Wayfarer) | Binds one of the opponent's cells so it can't be cast next round. A tether that lands on an unwarded cell scores a **Mark** | Ward |

Other schools add one move each, not new rules: **Mend** (Bloom) clears one tether per duel; **Echo** (Necro) recalls the opponent's last spell and casts it back once.

## Call and response (why slow input still works)
- Rounds are turn-based in pairs: the **caller** casts, then the **responder** answers within the response window.
- **Tempo** is agreed in the challenge: Slow (10 s window), Measured (6 s), Quick (3 s). Both must accept the tempo, so an apprentice never faces a speed they didn't choose (D-20).
- **Prepared boards** matter more than speed: where your wards sit, which cells you leave open as bait, which Glamour you saved.

## Wagers
- Allowed: components (they gain "won in a duel at …" [[Provenance]]), favours (the loser does one commission for the winner), a Keepsake, a secret (a story clue only the winner learns).
- Never allowed: board pages, fluency, cloak capacity, Standing.
- **Witness's due:** an order witness (NPC) grants a small Standing bump to both duelists for an honourable duel, nothing for a dishonourable one (refused rematch, broken terms).

**Recommendation:** best of three Marks at Slow tempo by default; it plays well at apprentice fluency and keeps duels near five minutes.

## Related
- [[PvP Philosophy]], [[Duel Loop]], [[In-the-Coat Duel View]], [[Subterfuge]], [[Grimoire Pages]], [[Input Budget per Mode]], [[Chord QTEs]], [[Astral Spellbook]], [[Multiplayer MOC]]

## Open threads
- **Q-61:** see the Visibility rule above (includes Q-73).
- Should NPC story duels use the same spells, so solo players learn the form?
- Can three- or four-way duels exist, or does the call-and-response pairing break?
