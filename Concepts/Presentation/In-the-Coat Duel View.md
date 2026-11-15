---
status: proposal
tags:
  - presentation
  - camera
  - hands
refs:
  - D-12
  - D-13
  - Q-09
  - Q-73
  - Q-61
---

# In-the-Coat Duel View

The duel camera: first person, your hands low in frame, your cloak held open below them as the board. The designer's "in the coat 1PV". The **rules** of a duel, including who can see what, live in [[Formal Duels]]; this note covers only how it looks.

## Framing (480x270)
- **Head up:** the opponent fills the middle third, 3-4 m away, hands lit. Your hands sit in the bottom quarter.
- **Head down:** the camera tilts to the open cloak (D-13). The lining **is** the board: rows A-F stitched down the left edge, columns 1-9 across ([[Cloak Inventory]], [[Board Label Lore]]).
- Glance is a mouse flick or a hold key; no free look. Two positions, one blend.
- The addressed cell glows in the lining as you chord the row, then the column, so you can play head-down until you know the board by heart.

## Hands as a readable signal
- Your hands are the biggest moving thing on screen: about 70 px tall each at 480x270.
- **Open fingers carry the school color**; closed fingers stay in the base ramp ([[Themed Indicators]], [[School Stances]]).
- A 1 px dark outline around hands, always, whatever the dye ([[Component Dyes]]).
- **The opponent's hands read the same way.** Per [[Formal Duels]], each duelist declares a spell list and the opponent's hands become readable **after the row commit**. A fluent player then knows the row before the column lands and can narrow down the declared spell. That's pillar 1 as a duel skill: you understand what the other wizard is saying.
- Before the row commit, the opponent's hands render in a soft blur at the same glow, so you see that they are casting but not what.
- Accessibility rung: tally marks of the opponent's chord float above their hands ([[Prompt Ladder]] rung 2). Off by default for experienced players, on for learners.

## Sleeved hands
- Presentation supports two states: **open hands** (readable after the row commit) and **sleeved hands** (hands inside the cloak; only a glow leaks out).
- The rule is in [[Formal Duels]]: sleeving a hand costs a round. The view shows the cost as the sleeve drawing in over one round.

## Art budget (Q-09)
- 16 base poses as finger-curl targets, one per nybble ([[Pose Animation Budget]]).
- School flavor = wrist angle, palm orientation and particle color only; no unique finger poses per school at first.
- Rings and hand markings from [[Wizard Drip]] show here and nowhere else at this size.

**Recommendation:** build the 16 base poses for this view before any other first-person use. The duel is the one place where poses carry gameplay information, so it justifies the animation cost.

**Q-73** (merged into **Q-61**, [[Formal Duels]]): the visibility question now lives there. Current ruling: readable after the row commit.

## Related
- [[Formal Duels]], [[Duel Loop]], [[Context Camera Modes]], [[Input Budget per Mode]], [[Cloak Appearance]], [[Logic vs Skin]], [[Touching Poses]]

## Open threads
- Do the duelists' cloaks face each other so spectators see both linings?
- Could the same view serve rituals ([[Ritual Raid Loop]]) with several wizards in a circle?
- VR: is this the whole VR game (D-12)?
