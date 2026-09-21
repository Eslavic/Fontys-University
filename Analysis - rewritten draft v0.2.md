---
document: Analysis
project: The Witness
client: Nightfall Interactive
author: David Eslava
version: "0.2"
date: 2026-09-21
status: Draft for client review
---

<center>

# THE WITNESS

### Analysis Document

<br>

**Prepared for:** Nightfall Interactive (client)
**Prepared by:** David Eslava — Fontys ICT, StartSemester
**Document:** Analysis — phase 1 of 5
**Version:** 0.2
**Date:** 21 September 2026
**Status:** Draft for client review

</center>

---

## Document control

| Version | Date       | Author       | Change                                                                                     |
| :------ | :--------- | :----------- | :----------------------------------------------------------------------------------------- |
| 0.1     | 06-09-2026 | David Eslava | First draft: project description, MoSCoW table, proposed solution.                         |
| 0.2     | 21-09-2026 | David Eslava | Restructured for the client. Technical choices moved to the Design document, learning objectives removed, MoSCoW clarified, scope and risks added. |

**Related documents:** [[Design]] · [[Project Plan]] · [[Validation]]

---

## 1. Introduction

### 1.1 Purpose of this document

This document describes the analysis phase of **The Witness**, a 2D top-down stealth game commissioned by Nightfall Interactive. It defines the problem the client wants to solve, the scope of the project, and the requirements the delivered product must meet. It does not describe how the product will be built; the technical approach is documented separately in the [[Design]] document, and the schedule in the [[Project Plan]].

This document is intended for the client's product owner and for anyone who needs to judge whether the delivered prototype meets what was agreed.

### 1.2 The client

Nightfall Interactive is a small independent game studio that publishes short, stylised, single-session games. The studio wants to test whether a *learning* opponent — an enemy that visibly gets better at hunting the player — is a strong enough hook to build a full commercial title around. Before committing to a full production budget, the studio has asked for a playable vertical slice that demonstrates the concept.

### 1.3 The product in one paragraph

The Witness is a 2D top-down stealth game set in a 1960s jazz club. The player character witnessed something they were not supposed to see — a murder or a dirty deal — and must escape the building before the gangsters inside catch them. The game combines two dynamics: **stealth**, where ordinary guards patrol fixed routes and detect the player through their line of sight, and **pursuit**, where one special enemy — **The Hunter**, the boss's right-hand man — learns over time to intercept the player more efficiently instead of following a fixed pattern.

---

## 2. Problem definition

### 2.1 The client's problem

Stealth games traditionally rely on enemies driven by fixed, hand-written rules. Once the player understands the rules, the tension disappears: the enemy becomes a puzzle with a known solution, and replay value drops sharply. Nightfall Interactive wants to know whether an enemy that *adapts* to the player can keep the tension alive across repeated sessions, and whether that adaptation is visible enough to the player to be worth marketing.

### 2.2 The project challenge

> Deliver a playable prototype that demonstrates, in a single short level, the difference between a conventional patrolling enemy and an enemy that learns to pursue the player — and provide measurable evidence that the learning enemy actually improves.

The challenge has two halves that must both succeed:

1. **The game must be playable.** The stealth loop — move, hide, be seen, get caught — has to work on its own, otherwise there is nothing for the adaptive enemy to be measured against.
2. **The adaptation must be demonstrable.** A claim that the enemy "learns" is worthless without evidence. The prototype must produce data that shows measurable improvement over time.

### 2.3 Target audience

| Aspect              | Description                                                                       |
| :------------------ | :-------------------------------------------------------------------------------- |
| Primary players     | Players aged 16+ who enjoy short, tense, single-session stealth games.            |
| Familiarity assumed | Comfortable with keyboard movement controls; no prior stealth-genre experience required. |
| Session length      | 2–5 minutes per attempt; designed for repeated attempts.                          |
| Platform            | Desktop (Windows / Linux), keyboard input.                                        |

---

## 3. Scope

### 3.1 In scope

- One small playable level set inside the jazz club.
- A player character with movement and collision against the environment.
- Conventional enemies that patrol and detect the player by line of sight.
- A fail state when the player is caught.
- A first version of The Hunter, an enemy whose pursuit behaviour improves through repeated attempts.
- Measurements that show whether The Hunter's performance improved.

### 3.2 Out of scope

- A full game with multiple levels, a story campaign, or an ending sequence.
- Commercial-quality art, voice acting, or a licensed soundtrack.
- Console or mobile platforms.
- Online or multiplayer functionality.
- Save games and player progression.

### 3.3 Constraints

| Constraint    | Detail                                                                                          |
| :------------ | :---------------------------------------------------------------------------------------------- |
| Time          | Four weeks of part-time development by a single developer, ending 25 September 2026.            |
| Team          | One developer. There is no separate artist, designer, or tester.                                |
| Experience    | This is the developer's first project in a game engine, which lowers the realistic ceiling on scope. |
| Budget        | No budget for paid assets, licensed audio, or external services.                                |

### 3.4 Assumptions

- The client accepts placeholder visuals in the prototype, provided the art direction is legible and consistent.
- The client values a working, demonstrable adaptive enemy above visual polish.
- The prototype will be judged on the concept it proves, not on production quality.

---

## 4. Requirements

The requirements are prioritised using **MoSCoW**, a standard method that sorts requirements into four groups by how essential they are. Each requirement below is stated together with a short explanation, so the table can be read without prior knowledge of the project.

### ![[Pasted image 20260906134740.png|36]] Must Have

*Without these, the prototype does not demonstrate anything*

| ID   | Requirement                        | What it means                                                                                     |
| :--- | :--------------------------------- | :------------------------------------------------------------------------------------------------ |
| M-01 | Playable prototype with a player character | The product can actually be started and played by the client, not only described.          |
| M-02 | 2D movement (WASD)                 | The player moves the character in eight directions using the W, A, S and D keys.                  |
| M-03 | Collisions with the environment    | The player cannot walk through walls or furniture; the level restricts movement as a real space would. |
| M-04 | Small map with obstacles           | One compact level containing walls and cover, so that hiding and sightlines actually matter.      |
| M-05 | Enemy characters (NPCs)            | Non-player characters that move through the level and pose a threat to the player.                |
| M-06 | Vision cone for enemies            | Each enemy sees only a cone-shaped area in front of it, the way a person's field of view works. The player is detected only inside that cone. |
| M-07 | Pathfinding for enemies            | Enemies calculate a route around walls to reach a destination, instead of walking straight into obstacles. |
| M-08 | Fail state on capture              | When an enemy catches the player, the attempt ends and the player is shown that they were caught. |

### ![[Pasted image 20260906134814.png|36]] Should Have

*Strongly wanted, adds real value, but the prototype still works without them*

| ID   | Requirement                  | What it means                                                                                                       |
| :--- | :--------------------------- | :------------------------------------------------------------------------------------------------------------------ |
| S-01 | Sprint with stamina          | The player can temporarily move faster to escape a dangerous situation. Sprinting drains a stamina bar that refills when the player stops, so running is a limited resource rather than a permanent speed increase. |
| S-02 | Detection meter (alert gauge) | A bar that fills while an enemy is looking at the player, instead of instant detection. It gives the player a moment to break the sightline, and tells them how close they are to being spotted. |
| S-03 | Search state for enemies     | After losing sight of the player, an enemy investigates the area where it last saw them before returning to its patrol route, rather than immediately forgetting. |
| S-04 | Basic user interface         | A main menu, and a game over screen with the option to try again.                                                   |

### ![[Pasted image 20260906135115.png|36]] Could Have

*Included only if time remains after the Must and Should requirements are met*

| ID   | Requirement                          | What it means                                                                                                    |
| :--- | :----------------------------------- | :---------------------------------------------------------------------------------------------------------------- |
| C-01 | Adaptive Hunter (learning enemy)     | The Hunter improves its pursuit through repeated attempts instead of following a fixed script, and its improvement can be measured. This is the client's core research question; it is prioritised as Could Have only because the stealth loop must exist first for it to be measurable at all. |
| C-02 | Hiding spots                         | Specific places — under tables, behind the bar — where the player is hidden from enemy vision while they remain still. |
| C-03 | Distraction items                    | Objects the player can throw or activate to pull an enemy away from their route.                                 |
| C-04 | Adaptive sound effects               | Audio that reacts to the danger level, for example rising tension while an enemy is searching.                   |
| C-05 | Direct combat and combat recovery    | The ability to fight an enemy rather than avoid them, and to recover afterwards.                                 |

### ![[Pasted image 20260906135231.png|36]] Will Not Have

*Explicitly excluded from this project, so expectations are clear*

| ID   | Requirement                        | Why it is excluded                                                                     |
| :--- | :--------------------------------- | :-------------------------------------------------------------------------------------- |
| W-01 | Multiple levels or vertical floors  | One level is enough to prove the concept; more levels multiply the work without adding evidence. |
| W-02 | Multiplayer                        | Out of scope for a single-player stealth concept and far beyond the available time.    |
| W-03 | Advanced settings menu             | Audio and graphics options add no value to a prototype that is demonstrated, not shipped. |
| W-04 | Crafting systems                   | Belongs to a different genre and does not support the research question.                |
| W-05 | Adaptive jazz soundtrack           | Attractive for a full title, but licensing and implementation cost cannot be justified here. |

### 4.1 Requirement on the evidence

Because the client's question is whether a learning enemy is worth building a title around, the prototype must not only *contain* The Hunter but also produce evidence about it. The prototype therefore has to record enough information per attempt — for example how long The Hunter needed to reach the player — to allow a trained Hunter to be compared against an untrained one. How this is measured and reported is described in the [[Validation]] document.

---

## 5. Proposed solution

The proposed product is a single self-contained level with two clearly separated enemy types, so that the contrast the client wants to evaluate is visible within one play session.

**The level.** One floor of the jazz club: a main room with tables and a bar, a back corridor, and an exit the player is trying to reach. The layout provides sightlines to avoid and cover to use, and is small enough that a single attempt lasts a few minutes.

**The player.** The player moves in eight directions and has no way to fight back. The only tools are movement, cover, and timing. This keeps the tension on avoidance, which is what the stealth loop is meant to test.

**Conventional enemies.** Guards follow fixed patrol routes and see the player only inside a vision cone in front of them. Their behaviour is predictable by design: they are the baseline the adaptive enemy is compared against.

**The Hunter.** One enemy behaves differently. Instead of a fixed route, The Hunter decides where to move based on where the player is relative to it, and adjusts those decisions based on the outcome of previous attempts — moves that brought it closer to the player are reinforced, moves that did not are discouraged. Over repeated attempts, its route to the player should become more direct. The client-facing promise is that this improvement is measurable, not merely claimed.

**The fail state.** When any enemy reaches the player, the attempt ends and the player is returned to try again. Repeated attempts are the intended play pattern, and are also what gives The Hunter the opportunity to improve.

**Visual direction.** The game uses a high-contrast noir look built from a restricted palette, so that the player can read the space, the enemies, and the vision cones instantly. The full rationale for this direction, and the tools used to produce it, are documented in the [[Design]] document.

---

## 6. Risks

| # | Risk                                                                 | Impact                                                            | How it is handled                                                                                              |
| :- | :------------------------------------------------------------------- | :---------------------------------------------------------------- | :-------------------------------------------------------------------------------------------------------------- |
| 1 | The adaptive Hunter does not produce a measurable improvement.        | The client's core question is left unanswered.                    | The stealth loop is delivered first and stands on its own. If the adaptive enemy is not reached, the prototype still delivers a working baseline and the measurement is reported honestly as inconclusive. |
| 2 | The scope is too large for four weeks of part-time work by one person. | Nothing is finished to a demonstrable standard.                   | MoSCoW is enforced strictly: Must Have requirements are completed before any Should or Could requirement is started. |
| 3 | First project in a game engine; unknown problems cost unknown time.   | Estimates slip.                                                   | Placeholder assets are used until the gameplay works, so engine learning does not block the core loop.         |
| 4 | Art production consumes time meant for gameplay.                      | The prototype looks better than it plays, which fails the brief.  | The art direction is deliberately minimal, and visual work is scheduled after the Must Have requirements.      |

---

## 7. Sources

> **To be completed.** This section must list the sources used during the analysis — the material consulted on stealth game design, on enemy detection systems, and on reinforcement learning for pursuit behaviour — with author, title, and date of consultation. Referencing is part of the exploratory research expected in this phase, and the section is currently empty.

---

## 8. Conclusion and next phase

The analysis establishes a project with a narrow, deliberately achievable core — a working stealth loop in one level — and a single ambitious element, the adaptive Hunter, which carries the client's actual research question. The requirements are prioritised so that the prototype has something to demonstrate even if the ambitious element is not reached.

The next phase is [[Design]], which documents the technical choices, the architecture of the game and of The Hunter, and the diagrams describing how the systems fit together. The schedule, estimated hours, and dependencies are documented separately in the [[Project Plan]].
