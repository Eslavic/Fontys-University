
- **Client:** Nightfall Interactive

- **Made by:** David Eslava — Fontys ICT Student

- **Version 0.2 — 21 September 2026**

--- 
## 1. Introduction
### 1.1 Purpose of this document
This document describes the analisys phase of **The Witness**, a 2D top-down stealth game commisioned by Nightfall Interactive. It defines the problem the client wants to solve, the scope of the project, and the requierements the delivered product must meet. It does not describe how the product will be built, the technical approach is documented separately in the [[Design]] document, and the schedule in the [[Project Plant]].

### 1.2 The client
**Nightfall Interactive** is a small independent game studio that publishes short, stylised games. The studio wants  to test whether a learning enemy that visibly gets better at hunting the player is a strong enough hook to biuld a real game around. Before commiting to a full production budget, the studio has asked me for a playable prototype that demonstrates the concept.

### 1.3 The product in one paragraph 
**The Witness** is a 2D top-down stealth game set in 1960's jazz club. The player charachter witnessed something they were not supposed to see, a murder, dirty deal... And must escape the building before the gangsters inside catch them. The game combines two dynamics: **stealth**, where ordinary guards patrol fixed routes and detect the player through their line of sight, and **pursuit**, where the special enemy **The Hunter**, the boss's right-hand man learns over time to intercept the player more efficiently instead of following a fixed pattern.

---
## 2. Problem definition

### 2.1 The client's problem
Stealth games traditionally rely on enemies driven by fixed hand-written rules. Once the plater understands the rules, the tension dissapears, the enemy becomes a puzzle with a known solution, and replay value drops significaly. Nightfall Interactive wants to know whether an enemy *that adapts* to the player can keep the tension alive across repeated sessions, and whether that adaptation is visible enough to the player to be worth marketing. 

### 2.2 The project challenge
>The studio agreed to do this in two steps. A learning enemy can only be judged if there is a working stealth game around it, so the first delivery has to establish that foundation and produce a worked-out design for the enemy itself.

Deliver a playable prototype that demonstrates the stealth loop in a single short level, and a complete design for the adaptive enemy, including the method that would be used to measure whether it improves.

The challenge has two halves that must both succeed:

1. **The game must be playable**. The stealth loop, move, hide, be seen, get caught, has to work on its own, otherwise there is nothing for the adaptive enemy to be measured against.

2. **The design must be specific enough to build from**. A description of an enemy that "learns" is worthless if it does not say what the enemy perceives, what it can do, and how its improvement would be measured.
### 2.3 Target audience

| Aspect              | Description                                                                                   |
| ------------------- | --------------------------------------------------------------------------------------------- |
| Primary players     | Players aged 16+ who enjoy short, tense, single sessions stealth games.                       |
| Familiarity assumed | Comfortable with keyboard movement controls, no prior experience with stealth games required. |
| Session length      | 3-6 minutes per attempt; designed for repeated attempts.                                      |
| Platform            | Desktop (Windows / Linux), keyboard input.                                                    |

---
## 3. Scope
### 3.1 In scope
- One small playable level set inside the jazz club.
- A player charachter that moves and cannot walk through walls.
- Guards that patrol and see the player though a vision cone.
- A game over screen when the player is caught.
- A complete design for The Hunter, the learning enemy, including how its improvement would be measured
### 3.2 Out of scope
- More than one level, or a story with an ending.
- Finished art, voice acting or licensed music.
- Console or mobile versions.
- Online or multiplayer.
- Saving your progress.

### 3.3 Designed, but not built in this delivery
The Hunter's learning behaviour is fully designed in this project but is not implemented in the prototype. The available time went into the stealth loop, which has to work before any learning behaviour can be measured against it. What The Hunter perceives, the moves it can make, how it is rewarded, and the method for measuring whether it improves are all documented in the Design document. Building and measuring it is the first recommendation for the next iteration
## 4. Requirements (MoSCoW)

The requirements are prioritised using **MoSCoW**, a method that sorts them into four groups, from "the project fails without this" down to "we are deliberately not doing this". Each requirement is written as a user story, which names who wants it, what they can do, and why it matters, so the table stays readable for someone who does not know the project.

#### Must Have

| ID   | User story                                                                                                            |
| ---- | --------------------------------------------------------------------------------------------------------------------- |
| M-01 | As the client, I can start the game and play it myself, so that I can judge the concept instead of reading about it   |
| M-02 | As a player, I can move my character in eight directions with the W, A, S and D keys, so that I can navigate the club |
| M-03 | As a player, I cannot walk through walls or furniture, so that the level behaves like a real space                    |
| M-04 | As a player, I can use walls and furniture as cover, so that where I stand actually matters                           |
| M-05 | As a player, I meet enemies that move through the level, so that there is something to avoid                          |
| M-06 | As a player, I can only be seen when I am inside an enemy's vision cone, so that hiding behind cover actually works   |
| M-07 | As a player, I see enemies walk around walls instead of into them, so that their movement is believable               |
| M-08 | As a player, I am told the attempt is over when an enemy catches me, so that being spotted has a consequence          |

#### Should Have

|ID|User story|
|---|---|
|S-01|As a player, I can sprint for a few seconds using a stamina bar that refills when I stop, so that I can escape a bad moment without being able to run forever|
|S-02|As a player, I can watch a meter fill while an enemy looks at me, so that I have a moment to break the line of sight before I am caught|
|S-03|As a player, I can see an enemy search the place it last saw me before returning to its patrol, so that escaping feels earned|
|S-04|As a player, I can start from a main menu and retry from a game over screen, so that I can make repeated attempts without restarting the program|

#### Could Have

| ID   | User story                                                                                                                                            |
| ---- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| C-01 | As a player, I can face an enemy that gets better at chasing me the more I play, so that the game stays tense after I have learned the guards' routes |
| C-02 | As a player, I can hide under a table or behind the bar while I stay still, so that I have somewhere to go when a guard approaches                    |
| C-03 | As a player, I can throw or activate an object to pull a guard off their route, so that I can create an opening                                       |
| C-04 | As a player, I can hear the audio react while a guard is searching, so that I feel the danger without watching the interface                          |
| C-05 | As a player, I can fight an enemy instead of avoiding them, so that being cornered is not always fatal                                                |
C-01 is the client's core research question. It is designed in full in this project, including how its improvement would be measured, but it is not implemented in this prototype. The stealth loop has to work before any learning behaviour can be measured against it.
#### Will Not Have

_Explicitly excluded from this project, so expectations are clear_

| ID   | Requirement                        | Why it is excluded                                                                               |
| ---- | ---------------------------------- | ------------------------------------------------------------------------------------------------ |
| W-01 | Multiple levels or vertical floors | One level is enough to prove the concept; more levels multiply the work without adding evidence. |
| W-02 | Multiplayer                        | Out of scope for a single-player stealth concept and far beyond the available time.              |
| W-03 | Advanced settings menu             | Audio and graphics options add no value to a prototype that is demonstrated, not shipped.        |
| W-04 | Crafting systems                   | Belongs to a different genre and does not support the research question.                         |
| W-05 | Adaptive jazz soundtrack           | Attractive for a full title, but licensing and implementation cost cannot be justified here.     |
## 5. Proposed solution

One floor of the jazz club: a main room with tables and a bar, a back corridor, and an exit you are trying to reach. Small enough that one attempt takes a few minutes.

The guards are predictable on purpose. They are the comparison. The Hunter is the interesting one: instead of following a route, he decides where to move based on where you are compared to him, and he adjusts those decisions based on what happened in earlier attempts. Moves that brought him closer get reinforced, moves that did not get discouraged. Over many attempts his route to the player should get more direct. This behaviour is designed in this project but not implemented in the prototype

Because the client's question is whether this actually works, the design specifies what the prototype would need to record per attempt, for example how long The Hunter needed to reach the player. That is what would make it possible to compare a trained Hunter against an untrained one. The measurement method is described in the [[Design]] document.

The game uses a high contrast noir look with a very limited colour palette, so the player can instantly read the space, the enemies and the vision cones. The reasoning behind that choice and the tools I picked are in the [[Design]] document.

## 6. Risks

- **The Hunter might not show a measurable improvement.** If that happens, the stealth part still works on its own and I report the result honestly instead of pretending it worked.
- **The scope might be too big for four weeks on my own.** I deal with this by finishing all the Must Have items before starting anything else.
- **This is my first project in an engine, so problems will take longer than I expect.** I use placeholder graphics until the gameplay works, so learning the engine does not block the core game.

## 7. Sources

> Still to do. This section needs the sources I used while researching: what I read about stealth game design, about enemy detection systems, and about reinforcement learning for chasing behaviour.

---

The next document is [[Design]], which covers the tools, the technical choices and the diagrams. The planning with hours and dependencies is in the [[Project Plan]].