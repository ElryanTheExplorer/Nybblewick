---
status: proposal
tags:
  - presentation
  - learning
  - input
refs:
  - D-20
  - Q-19
  - Q-74
  - Q-42
---

# Chord QTEs

Quick-time events where the prompt is a chord, not a button. They are the scene-side form of the beats in [[Encounter Types]]. The [[Light-Up Drill]] is the engine: a cell lights up, you chord its address. In a scene, the cell is a lantern, a crack in a dam, a spirit's eye.

## The rule
**Failure branches the story; it never ends the game** (D-20, [[Not Doing]]). Every QTE beat has three outcomes, each with its own authored branch, and all continue the scene ([[Story Scene Structure]]):
| Outcome | What happened | Example consequence |
|---|---|---|
| **Clean** | Right address before the fuse burns out | The cart is saved and the carter offers a lift |
| **Late** | Right address after the fuse burns out | Smaller consequence: the cart is saved, its load is lost |
| **Wrong** | A different address | That spell happens and the scene plays along ([[Wild Magic Overshoot]]); it can be funny or costly |
- A late or wrong outcome may cost a component, a bit of Standing, a shortcut, or change who trusts you. It never costs a save or a reload. Lost things come back later through a [[Commission Loop|commission]] or another chapter.
- Retrying a scene ("Rewrite") exists only as an accessibility option (Q-42).

## QTE types
| Type | Prompt | Example |
|---|---|---|
| **Single** | One lit address | The bridge rope snaps: cast Salt-and-star ward under the cart |
| **Sequence** | 2-4 addresses in order | Relight three beacons as the ferry drifts |
| **Hold** | Keep a chord steady, 2-5 s | Hold a ward shut while a spirit pushes |
| **Choice** | Two lit cells, each a branch | Root bridge or Lodestep across; you pick by casting |
| **Choir** | Co-op: each player gets one address, or all cast the same one | A Ritual Raid seal needs four wizards at once ([[Choir Casting]]) |

Spells come from the spellbooks ([[Astral Spellbook]], [[Bloom Spellbook]], [[Wayfarer Spellbook]]); the address shown is whatever cell the spell sits on in your cloak.

## Timing (generous by default)
- The timer is a **fuse**, not a bar: a spark runs along a cord, so you see how much time is left without numbers. When it burns out, the beat isn't lost; a right cast just counts as **late**.
- Window = **3x your own median time** for that nybble pair (from drill stats), never under 4 s.
- Settings: Untimed (the fuse doesn't burn, so every right cast is clean), Generous (default), Tight (1.5x median; optional mastery).
- After the beat, [[XOR Feedback]] shows which fingers were off. No feedback mid-beat.

## Prompt Ladder as difficulty and accessibility
- The prompt shows your current rung for each nybble ([[Prompt Ladder]]): drawn fingers for a beginner, the spell name for a fluent player.
- Accessibility setting: lock every QTE to rung 1 (fingers drawn) or rung 2 (binary).
- Fluent players get **richer** prompts, not harder ones: the spell name alone, so a QTE reads like a line of dialogue.

## Q-19 (partial answer)
- **Recommendation:** both. The drill lives in-fiction as apprentice lessons and as a practice candle in the sanctum, and the same code runs every QTE. Learning and story share one engine, and your drill stats set your QTE timing.

**Q-74:** Should QTEs be untimed by default until a player's drill stats show fluency for those nybbles, with the fuse only burning after?

## Related
- [[Light-Up Drill]], [[Prompt Ladder]], [[Cinematic Scenes]], [[Cast Trigger Modes]], [[Fluency as Skill]], [[Input Budget per Mode]], [[Drop-In Co-op]]

## Open threads
- Do QTEs use auto-detect commit ([[Cast Trigger Modes]], Hybrid option) or the player's world setting?
- Should a late or wrong outcome ever be secretly the better branch?
- Can a co-op partner "catch" your wrong cast by casting the right address before the fuse runs out?
