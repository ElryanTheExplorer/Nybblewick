---
status: proposal
tags:
  - presentation
  - camera
  - story
---

# Cinematic Scenes

How story scenes are framed and shot: third person mixed with cinematic cuts, after Detroit: Become Human's framing (mechanic reference only, [[Reference Deconstruction]]). What happens in a scene and where it branches is decided in [[Story Scene Structure]].

## Shot grammar (six shot types, no more)
| Shot | Use | Notes at 480x270 |
|---|---|---|
| **Establish** | Opens the scene | The iso exploration camera, pulled back and held; the cut in is the scene start |
| **Two-shot** | Conversation | Both figures waist-up, ~90 px tall |
| **Over-the-shoulder** | Choices, confrontation | Behind the speaker's listener; the only third-person framing at launch ([[Context Camera Modes]]) |
| **Hand close-up** | Every cast beat | The hands fill the frame; same pose rig as the [[In-the-Coat Duel View]] |
| **Insert** | A component, a letter, a seal | Static, one object, often with a slow push-in |
| **Land wide** | The spell's result | Pulls out to show the world change (pillar 2: the land answers) |

Rules: cut on a line or a cast, never on a camera move. Hold each shot at least 2 s. No handheld shake (it shimmers on the pixel grid).

## Casting in a scene (the cast beat)
1. A choice can be a spell: "Light the shrine (Kindle)" sits next to spoken options.
2. Picking it cuts to the **hand close-up**; the target cell is prompted at your [[Prompt Ladder]] rung.
3. You chord at your own pace (untimed unless the beat is a [[Chord QTEs|QTE]]).
4. Commit cuts to the **land wide**: the shrine lights, the NPC reacts.
- Outcomes are clean, late or wrong, each with its own branch ([[Chord QTEs]]). A wrong address lands a different spell and the scene plays along ([[Wild Magic Overshoot]]). The scene branches; it doesn't stop.

## Cost-saving tricks
- **All in engine**, in the same 480x270 dithered buffer. Low resolution hides cheap faces and stiff animation.
- **Sets are levels**: scenes happen in places you walk through; cameras are markers dropped into the level.
- **Theater blocking**: characters walk to marks and hold poses; a pose change plus a cut sells an emotion.
- **Portrait insets** for faces in close dialogue (a 64x64 hand-drawn bust beside the text), instead of facial animation.
- **Letterbox** to 480x204 during scenes: fewer pixels to fill, and a clear "scene mode" signal.
- **Text first**, voice later if ever.
- Budget per scene: at most 8 camera markers and one new animation.

## Co-op
- The host decides; guests' casts add options to a choice, and guests can join cast beats ([[Choir Casting]]). Detailed rules: [[Drop-In Co-op]].

## Related
- [[Story Scene Structure]], [[Story Scene Loop]], [[Branch Flowchart]], [[Chord QTEs]], [[Context Camera Modes]], [[Input Budget per Mode]], [[Art Direction]]

## Open threads
- Do scenes pause the world (weather, Bloom freshness)? Recommend yes.
- Can players replay a scene from the flowchart leaf ([[Branch Flowchart]]) and pick a different branch?
- Should each school get one signature shot (Astral: a sky-down overhead; Necro: a ground-level shot through grass)?
