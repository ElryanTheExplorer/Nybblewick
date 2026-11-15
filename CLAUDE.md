# Nybblewick vault: notes for AI assistants

This folder is an Obsidian vault for brainstorming the game **Nybblewick**. It is not a codebase (yet). Treat it as a wiki.

## Layout
- `Home.md` is the entry point (with a "Start here" reading order). `Maps/` holds one MOC (map of content) per area.
- `Spine/` is the design backbone: Pitch, Design Pillars, Not Doing, Loop Stack, Decision Gates, Canon Sheet, Reference Deconstruction. **Read the Canon Sheet before writing lore or systems**: it holds shared names, the region/component table and which note owns what.
- `Concepts/<Area>/` holds atomic notes (areas: Input, Learning, Board, Spells, Schools, Story, RPG, World, Loops, Multiplayer, Incentives, Presentation, Customization, Puzzles, Hardware): **one idea per note**, named in Title Case, linked with `[[wikilinks]]`.
- `Project/` holds the Decision Log, Open Questions, Glossary, prototypes and scope.
- `game/` is the Godot 4.7 prototype (has its own `CLAUDE.md`). Hidden from Obsidian via `.obsidian/app.json`.
- `Inbox/` is for raw, unsorted thoughts. Triage them into Concepts when asked.
- `_templates/` has note templates (Concept, Loop, Spell, Storyline, System, Open Question, Inbox Item, Visual Reference). `_sources/` has the original design-notes export and the HTML prototype. Do not edit `_sources/`.

## Rules
1. **Never promote a status.** Only the designer turns `proposal`/`idea` into `leaning`/`decided`. If you suggest something, mark it `status: proposal` (or put it under a "Proposals" heading) so it stays distinguishable from decisions.
2. Decisions use stable IDs `D-xx`, open questions `Q-xx`. Add new ones at the end of [[Decision Log]] / [[Open Questions]]; never renumber. Put the IDs in the note's `refs` property.
3. Keep notes atomic. If a note grows a second idea, split it and link both ways.
4. When you create a note, link it from the relevant MOC in `Maps/` and from at least one sibling note.
5. Unresolved `[[links]]` are fine. They mark ideas worth writing later.
6. Superseded ideas are kept, set to `status: superseded`, with a line saying what replaced them.
7. Frontmatter: `status`, `tags` (area tags like `input`, `learning`, `board`, `spell`, `school`, `story`, `rpg`, `world`, `loop`, `multiplayer`, `incentive`, `presentation`, `customization`, `puzzle`, `hardware`, `spine`, `project`), optional `refs`.
9. Note titles must be unique across the whole vault (Obsidian links by name).
10. New ideas must pass [[Design Pillars]] and avoid [[Not Doing]]. Big forks go in [[Decision Gates]] as Q-xx.
11. The designer works async: **collect questions in [[Open Questions]] and notes' Open threads instead of asking in chat.**
8. Each concept note ends with **Open threads**: questions worth brainstorming next.

## Core facts (quick context)
- Nybble = 4 fingers, index 8, middle 4, ring 2, pinky 1. 0 = closed, 1 = open.
- Address = row chord (A-F, `1010`-`1111`) then column chord (1-9). Board is 6x9, scopeless.
- Thumb commits by default; auto-detect is an option under study ([[Cast Trigger Modes]]).
- Direction: RPG with per-school storylines (D-26); utility, story and environment over combat; PvE first, solo plus drop-in co-op, PvP consensual and costly (D-27); incentives, not economics (D-28).
- Proposed loop structure: [[Loop Stack]] (Q-16 still open). Premise/tone undecided: three sketches ([[Premise Options]]).
