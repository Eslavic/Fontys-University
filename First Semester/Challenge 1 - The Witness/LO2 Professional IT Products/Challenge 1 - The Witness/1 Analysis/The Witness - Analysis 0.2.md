- **Client:** Nightfall Interactive

- **Made by:** David Eslava, Fontys ICT Student

- **Version 0.2 - 23 September 2026**

---
## 1. Introduction
### 1.1 Purpose of this document
This document is the analysis phase of **The Witness**. It is a 2D top-down stealth game for the client Nightfall Interactive. Here I explain the problem of the client, the scope of the project, and the requirements that the product must have. I do not explain here how I build it. The technical part is in the [[Design]] document, and the planning is in the [[Project Plan]].

### 1.2 The client
**Nightfall Interactive** is a small independent game studio. They make short games with a strong style. The studio wants to know if a learning enemy is a good idea for a full game. A learning enemy is an enemy that gets better at hunting the player, and the player can see that it gets better. The studio does not want to pay for a full game yet. First they asked me for a small prototype that they can play, so they can see if the idea works.

### 1.3 The product in one paragraph
**The Witness** is a 2D top-down stealth game in a jazz club in the 1960s. The player saw something they were not supposed to see, for example a murder or a dirty deal. Now they have to escape from the building before the gangsters catch them. The game has two parts. The first part is **stealth**: normal guards walk fixed routes and they see the player with their line of sight. The second part is **pursuit**: a special enemy called **The Hunter** is the right hand man of the boss. He learns over time and gets better at catching the player, instead of always doing the same thing.

---
## 2. Problem definition

### 2.1 The client's problem
Normally in stealth games the enemies follow fixed rules that somebody wrote by hand. When the player understands the rules, the tension is gone. The enemy becomes a puzzle and the player already knows the solution, so people do not play it again. Nightfall Interactive wants to know if an enemy *that adapts* to the player keeps the tension alive when you play many times. They also want to know if the player can really see that the enemy adapts. If nobody sees it, it is not useful for marketing.

### 2.2 The project challenge
>The studio agreed to do this in two steps. You can only judge a learning enemy if there is a working stealth game around it. So the first delivery has to build that base, and also a finished design of the enemy.

Deliver a prototype that you can play and that shows the stealth loop in one short level. Also deliver a complete design for the adaptive enemy, with the method to measure if it improves.

The challenge has two halves and both of them have to work:

1. **The game must be playable**. The stealth loop is move, hide, be seen, get caught. It has to work on its own. If it does not work, there is nothing to compare the adaptive enemy with.

2. **The design must be specific enough to build from**. It is not enough to say that the enemy "learns". The design has to say what the enemy sees. It has to say which moves the enemy can make. And it has to say how I measure if the enemy improves.
### 2.3 Target audience

| Aspect              | Description                                                                          |
| ------------------- | -------------------------------------------------------------------------------------- |
| Primary players     | Players from 16 years old who like short stealth games with tension.                 |
| Familiarity assumed | They can use the keyboard to move. They do not need experience with stealth games.   |
| Session length      | 3 to 6 minutes per attempt. The game is made to play many attempts.                  |
| Platform            | Desktop (Windows / Linux), with keyboard.                                            |

---
## 3. Scope
### 3.1 In scope
- One small playable level inside the jazz club.
- A player character that moves and cannot walk through walls.
- Guards that patrol and see the player with a vision cone.
- A game over screen when the player is caught.
- A complete design for The Hunter, the learning enemy, including how I would measure if it improves.
### 3.2 Out of scope
- More than one level, or a story with an ending.
- Finished art, voice acting or licensed music.
- Console or mobile versions.
- Online or multiplayer.
- Saving your progress.

### 3.3 Designed, but not built in this delivery
The learning behaviour of The Hunter is completely designed in this project, but I do not build it in the prototype. I used the time for the stealth loop, because the stealth loop has to work before I can measure any learning behaviour. The Design document explains what The Hunter sees, which moves it can make, how it gets its rewards, and how I would measure if it improves. To build it and measure it is my first recommendation for the next iteration.
## 4. Requirements (MoSCoW)

I sorted the requirements with **MoSCoW**. This method puts the requirements in four groups. The first group means "the project fails without this". The last group means "we decided not to do this". Every requirement is a user story. A user story says who wants it, what they can do, and why it is important. In this way the table is also clear for somebody who does not know the project.

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

C-01 is the main research question of the client. I design it completely in this project, and I also explain how I would measure if it improves. But I do not build it in this prototype. The stealth loop has to work first, because without it I cannot measure any learning behaviour.
#### Will Not Have

_I exclude these from the project, so the expectations are clear_

| ID   | Requirement                        | Why it is excluded                                                                                        |
| ---- | ---------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| W-01 | Multiple levels or vertical floors | One level is enough to show the concept. More levels mean much more work and they do not give more evidence. |
| W-02 | Multiplayer                        | This is a single-player stealth game. Multiplayer is also much more work than the time I have.            |
| W-03 | Advanced settings menu             | Audio and graphics options do not add value to a prototype that I only demonstrate.                       |
| W-04 | Crafting systems                   | Crafting belongs to a different type of game and it does not help the research question.                  |
| W-05 | Adaptive jazz soundtrack           | This is nice for a full game, but the licence and the work cost too much for this project.                |
## 5. Proposed solution

One floor of the jazz club. There is a main room with tables and a bar, a corridor at the back, and an exit that the player wants to reach. The level is small, so one attempt takes a few minutes.

The guards are predictable on purpose, because they are the comparison. The Hunter is the interesting one. He does not follow a route. He decides where to move with the position of the player compared to his own position, and he changes his decisions with what happened in the attempts before. When a move brings him closer, that move gets a reward. When a move does not bring him closer, it gets a penalty. After many attempts his way to the player should be more direct. I design this behaviour in this project, but I do not build it in the prototype.

The question of the client is if this really works. So the design says what the prototype has to save in every attempt, for example how much time The Hunter needs to reach the player. With this data you can compare a trained Hunter with an untrained one. The [[Design]] document explains the measurement method.

The game uses a noir look with high contrast and very few colours. In this way the player sees the space, the enemies and the vision cones immediately. The reason for this choice and the tools I use are in the [[Design]] document.

## 6. Risks

- **The Hunter maybe does not show a measurable improvement.** If this happens, the stealth part still works on its own. Then I report the real result and I do not pretend that it worked.
- **The scope can be too big for four weeks alone.** I control this: I finish all the Must Have items before I start anything else.
- **This is my first project in a game engine, so problems take more time than I expect.** I use placeholder graphics until the gameplay works, so learning the engine does not block the core game.

## 7. Sources

These are the sources I used in the analysis. There are three groups. The first group is the research about reinforcement learning for The Hunter. The second group is the research about which engine I use and how to work with it. The third group is the templates I read, to learn how people normally write a game design document. I used all of them between 1 and 22 September 2026.

**Reinforcement learning and AI.** I used these to decide which algorithm is good for The Hunter.

- [Deep Reinforcement Learning Applied to the Snake Video Game](https://www.youtube.com/watch?v=lzd0XfBoDIw) (YouTube)
- [Q Learning Intro/Table — Reinforcement Learning p.1](https://www.youtube.com/watch?v=yMk_XtIEzH8&list=PLQVvvaa0QuDezJFIOU5wDdfy4e9vdnx-7) (YouTube, sentdex)
- [Deep Reinforcement Learning Tutorial for Python in 20 Minutes](https://www.youtube.com/watch?v=cO5g5qLrLSo&list=PLgNJO2hghbmjlE6cuKMws2ejC54BTAaWV) (YouTube)
- [The FASTEST introduction to Reinforcement Learning on the internet](https://www.youtube.com/watch?v=VnpRp7ZglfA) (YouTube)
- [A.I. Learns to Drive](https://www.youtube.com/watch?v=r428O_CMcpI) (YouTube)
- [A Beginner's Guide to Q-Learning: Understanding with a Simple Gridworld Example](https://medium.com/@goldengrisha/a-beginners-guide-to-q-learning-understanding-with-a-simple-gridworld-example-2b6736e7e2c9) (Medium)
- [General search: basic games applying reinforcement learning](https://www.youtube.com/results?search_query=basic+game+applying+reinforcement+learning) (YouTube search, I used it to get an overview)

**Engine research.** I used these to choose an engine and to learn to work with Godot.

- [How to Make a Game in Python](https://www.youtube.com/watch?v=waY3LfJhQLY) (YouTube)
- [Making a Game in Python with No Experience](https://www.youtube.com/watch?v=H09PmP5tsy8) (YouTube)
- [Godot 4 Crash Course #1 — The Basics](https://www.youtube.com/watch?v=q7wlSvt0JIc&list=PL4cUxeGkcC9iHCXBpxbdsOByZ55Ez4bgF) (YouTube)
- [How to Make a Video Game — Godot Beginner Tutorial](https://www.youtube.com/watch?v=LOhfqjmasi0) (YouTube)
- [True Top-Down 2D](https://catlikecoding.com/godot/true-top-down-2d/) (Catlike Coding)

**Game design document templates.** I read these to learn how this kind of document is normally structured.

- [Detailed Game Design Documentation Template](https://drive.google.com/file/d/17-51Uwxqle3DZVleir6OhDlWA_aerw5g/view) (Google Drive)
- [How to write an effective Game Design Document (GDD)?](https://www.reddit.com/r/gamedesign/comments/1iof781/how_to_write_an_effective_game_design_document/) (Reddit, r/gamedesign)
- [How to Write a Game Design Document](https://www.gamedeveloper.com/business/how-to-write-a-game-design-document) (Game Developer)
- [A GDD Template for the Indie Developer](https://www.gamedeveloper.com/design/a-gdd-template-for-the-indie-developer) (Game Developer)
- [A Template for Analyzing Game Design](https://notlaura.com/a-template-for-analyzing-game-design/) (notlaura.com)
---

The next document is [[Design]]. It explains the tools, the technical choices and the diagrams. The planning with the hours and the dependencies is in the [[Project Plan]].
