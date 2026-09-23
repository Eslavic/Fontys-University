# Advice — The Witness

- **Client:** Nightfall Interactive
- **Made by:** David Eslava — Fontys ICT Student
- **Version 0.1 — 23 September 2026**

---

## 1. Purpose of this document

Before building anything, two decisions had to be made: which engine and programming language to build the game in, and how the enemies should decide where to move. This document compares the options for both, explains the trade-offs, and gives my advice to Nightfall Interactive.

The requirements these choices have to serve are in the [[The Witness - Analysis  0.2|Analysis]]. What follows from the choices, the scene structure, the diagrams and the design of The Hunter, is in the [[Design]] document.

## 2. What the choice has to fit

The options are judged against the situation this project is actually in:

- **One developer, four weeks, first engine project.** Whatever I pick, I have to learn it while building with it.
- **A 2D top-down game.** It needs collisions with walls, animated characters in eight directions, a camera and simple screens.
- **Free tools.** There is no budget for licences.
- **I already know some Python.** A language that feels like Python saves learning time.
- **The client's question is about a learning enemy.** The choice must not make The Hunter impossible to build later.

## 3. Decision 1: engine and programming language

### 3.1 The options

| | **Godot 4 + GDScript** | **Unity + C#** | **GameMaker + GML** | **Pygame + Python** |
|---|---|---|---|---|
| **Cost** | Free and open source | Free up to a revenue limit, then paid | Free for non-commercial use, paid licence to publish | Free and open source |
| **Learning curve for a first engine** | Gentle, small editor | Steep: C# plus many systems at once | Gentle | Easy to start, hard to grow |
| **Built-in 2D tools** (scenes, collisions, animation, camera) | Yes, all of them | Yes, all of them | Yes, all of them | No, I would write them myself |
| **Language close to Python** | Yes, GDScript is modelled on Python | No | No | It is Python |
| **Machine learning libraries** | No | Some (ML-Agents) | No | Yes, the whole Python ecosystem |

### 3.2 Trade-offs

**Pygame** looked like the obvious choice at first, because it is Python and most of the reinforcement learning tutorials I watched are in Python too. After watching two Pygame tutorials I dropped it. Pygame is a library, not an engine: collisions, animation, scene switching and the camera would all be code I write myself, and in four weeks that would leave almost no time for the game.

**Unity** is the most used engine in the industry and has its own machine learning toolkit, so it would be the stronger choice for a studio with experience. For me it means learning C# and a large editor at the same time, which is too much at once for a first project.

**GameMaker** is good for 2D and easy to learn, but its language only exists inside GameMaker and publishing needs a paid licence. Godot gives me the same 2D tools for free.

**Godot** has everything the game needs built in, and GDScript reads almost like Python. I followed a beginner Godot tutorial before deciding (the `first-game` project in my Realisation folder) and ended up with a working character, a patrolling enemy and a death zone. Its weakness is that GDScript has no machine learning libraries. That matters less than it sounds: the kind of learning I chose for The Hunter (see Decision 2) only needs a table of numbers, which GDScript can handle on its own.

### 3.3 Advice

**Build the game in Godot 4 with GDScript.** It is free, it has every 2D tool the game needs, and it lets me reuse what I know from Python. What we give up is direct access to Python's machine learning libraries, which only becomes a problem if The Hunter ever needs a neural network.

## 4. Decision 2: how the enemies decide where to move

There are two kinds of enemy in the game. The **guards** patrol and react when they see the player. **The Hunter** is the enemy the client's question is about: one that gets better at catching the player over time.

### 4.1 The options

| | **Hand-written state machine** | **Pathfinding (NavigationAgent2D)** | **Tabular Q-learning** | **Deep reinforcement learning** |
|---|---|---|---|---|
| **What it is** | Fixed rules: patrol, chase when you see the player, stop when caught | The engine calculates the shortest route to the player around walls | The enemy keeps a table of how good each move is in each situation and updates it after every move | A neural network learns the same thing from many examples |
| **Learns from the player?** | No | No | Yes | Yes |
| **Runs inside Godot without extra software** | Yes | Yes, built in | Yes, it is only a table | No, needs Python and extra libraries |
| **Can I explain why it did something?** | Yes | Yes | Yes, you can read the table | Hard |
| **Time to build** | Hours | Hours | Days, including training | Weeks |

### 4.2 Trade-offs

A **state machine** is the simplest option and it is exactly what the guards need. They should be predictable, because the player has to be able to learn their routes. They are also the comparison: The Hunter only means something next to enemies that do not learn.

**Pathfinding** always finds the shortest route, so a pathfinding Hunter would be strong from the first second and never improve. That makes it useless for the client's question. It is still useful as a helper for the guards if they get stuck on walls while chasing.

**Deep reinforcement learning** is what the "AI learns to drive" and Snake videos use. It needs far more training, it runs outside Godot, and when it does something strange it is very hard to find out why. For an enemy that only chooses between four moves on a small map, that is much more than the problem needs.

**Tabular Q-learning** is the smallest thing that actually learns. The Hunter looks at its situation, picks one of four moves, gets a reward or a penalty, and writes down what happened in a table. Over many attempts the good moves get higher scores. The whole "brain" is a table of about 1,500 numbers that I can open and read, which also makes the result easy to check.

### 4.3 Advice

**Use a state machine for the guards and tabular Q-learning for The Hunter.** Build the guards in this delivery, because the stealth game has to work first. Design The Hunter in full now and build it in the next iteration, as agreed in the Analysis. If the guards get stuck on walls during testing, add Godot's built-in pathfinding to their chase state.

## 5. Summary

| Decision | Advice | Main reason | What we give up |
|---|---|---|---|
| Engine and language | Godot 4 with GDScript | Free, all 2D tools built in, close to Python | Python's machine learning libraries |
| Guards | Hand-written state machine | Predictable on purpose, quick to build | They never surprise the player |
| The Hunter | Tabular Q-learning, designed now, built next iteration | Smallest method that really learns, and easy to explain | It can only learn simple situations, not complex tactics |

## 6. Sources

The sources behind this advice are listed in full in section 7 of the Analysis. The ones that shaped these two decisions most:

- [How to Make a Game in Python](https://www.youtube.com/watch?v=waY3LfJhQLY) and [Making a Game in Python with No Experience](https://www.youtube.com/watch?v=H09PmP5tsy8), YouTube, for what building in Pygame involves.
- [How to Make a Video Game — Godot Beginner Tutorial](https://www.youtube.com/watch?v=LOhfqjmasi0), YouTube, which I followed to build the `first-game` test project.
- [Q Learning Intro/Table — Reinforcement Learning p.1](https://www.youtube.com/watch?v=yMk_XtIEzH8&list=PLQVvvaa0QuDezJFIOU5wDdfy4e9vdnx-7), YouTube, sentdex, and [A Beginner's Guide to Q-Learning](https://medium.com/@goldengrisha/a-beginners-guide-to-q-learning-understanding-with-a-simple-gridworld-example-2b6736e7e2c9), Medium, for how tabular Q-learning works.
- [Deep Reinforcement Learning Applied to the Snake Video Game](https://www.youtube.com/watch?v=lzd0XfBoDIw) and [A.I. Learns to Drive](https://www.youtube.com/watch?v=r428O_CMcpI), YouTube, as examples of what deep reinforcement learning needs.

All consulted between 1 and 22 September 2026.
