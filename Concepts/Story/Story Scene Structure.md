---
status: proposal
tags:
  - story
  - presentation
refs:
  - D-20
  - D-21
  - Q-13
  - Q-42
---

# Story Scene Structure

How an authored scene is built, Detroit-style (mechanic reference only, [[Reference Deconstruction]]). This note owns the **branch content**. QTE input and camera grammar live in [[Chord QTEs]] and [[Cinematic Scenes]].

## The six parts
1. **Setup:** where, who, what's at stake. 30-60 s of cinematic, then control returns.
2. **Read:** the player can look before acting: [[Astral Projection]] or [[Familiar Vision]] to see what's hidden, "remember" (Necro) to replay what happened here. Reading reveals options, it never takes them away.
3. **Choices:** 2-4 dialogue or action options per decision point. Some are always available; others need a verb you know.
4. **Casts as dialogue:** you answer people with spells ([[Spellbook as Vocabulary]]). The cast *is* the line.
5. **Chord QTE beats:** one or two moments where the scene asks for a specific cast now, generously timed (D-20).
6. **Consequence:** the scene ends on a branch, which sets flags: Standing, world state, who lives where, what is remembered.

## Casts as dialogue (examples)
| School | Verb | In a conversation |
|---|---|---|
| Astral | light | lift a lamp to a liar's face; the scene branches on what you see |
| Alchemy | preserve | keep a dying man's letter from crumbling so it can be read |
| Wayfarer | tether | stop someone storming out, and they have to keep talking |
| Bloom | mend | heal the broken fence the neighbors are fighting over |
| Smith | repair | fix the tool the argument is about, ending it |
| Necro | speak with the dead | call the one witness nobody else can |

A cast in dialogue costs what it always costs ([[Component Consumption]], Q-01): if it consumes, saying it with a spell means something.

## Failure branches, not game over
- A missed QTE or a wrong verb never ends the scene. It picks another branch ([[Not Doing]]).
- Each QTE beat has three outcomes: **clean** (fast and right), **late** (right but slow: a different, smaller consequence), **wrong** (a wrong cast, which does *something*: [[Wild Magic Overshoot]] can make it funny or costly).
- Failure branches are written as good content. Rule of thumb: every failure branch gets at least one line or image the success branch doesn't.
- Lost things (a bridge, an NPC's trust) can be recovered later through a [[Commission Loop|commission]] or another chapter, never through a reload.

## Budget per scene
- 2-4 decision points, 1-2 QTE beats, 2-4 end states that collapse into at most 3 flags.
- Branches rejoin within the chapter; only flags carry forward ([[Branch Flowchart]]).

## Co-op
Host-led ([[Drop-In Co-op]]). Guests each get their own casts at a QTE beat; decision points are host's call, but guests can cast a verb to open an option ([[Cross-School Tensions]]).

**Q-42:** after a failed QTE, can the player retry that beat? Options: (a) never: failure branches; (b) one retry if they choose it, at a cost (time or a component); (c) a setting. Lean (a): clean, late and wrong each have their own authored branch. Retrying ("Rewrite", see [[Branch Flowchart]]) exists only as an accessibility option.

## Related
- [[Story Scene Loop]], [[Chord QTEs]], [[Cinematic Scenes]], [[Branch Flowchart]], [[Light-Up Drill]], [[Premise Options]]

## Open threads
- Q-42 above.
- Can the player cast a verb the scene didn't plan for, and get a generic but in-character reaction?
- Should provenance of the component used change the line ([[Provenance]])?
