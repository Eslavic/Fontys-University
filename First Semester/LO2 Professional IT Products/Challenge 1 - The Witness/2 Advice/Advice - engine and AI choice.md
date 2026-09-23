# Advice — The Witness

- **Client:** Nightfall Interactive
- **Made by:** David Eslava — Fontys ICT Student
- **Version 0.1 - 23 September 2026**

---

## 1. What is this document about

Before I start building, I need to make two decisions:

1. Which engine and programming language I use to make the game.
2. How the enemies move and how they decide where to go.

In this document I compare the options for both decisions, I explain the good and bad points, and I give my advice to Nightfall Interactive.

The requirements are in the [[The Witness - Analysis  0.2|Analysis]]. How I build the game with these choices is in the [[Design]] document.

## 2. What is important for this project

I compare the options with these points in mind:

- **I work alone, I have four weeks, and it is my first game engine.** I have to learn the tool while I build the game.
- **It is a 2D top-down game.** I need collisions with walls, animations in eight directions, a camera and some simple screens.
- **The tools have to be free.** There is no money for licences.
- **I already know some Python.** If the language is similar to Python, I learn faster.
- **The client wants an enemy that learns.** My choice cannot make The Hunter impossible to build later.

## 3. Decision 1: engine and programming language

### 3.1 The options

| | **Godot 4 + GDScript** | **Unity + C#** | **GameMaker + GML** | **Pygame + Python** |
|---|---|---|---|---|
| **Price** | Free, open source | Free until you earn a certain amount, then you pay | Free for non-commercial use, you pay to sell the game | Free, open source |
| **Easy to learn for a first engine?** | Yes, the editor is small | No, C# and a lot of things at the same time | Yes | Easy to start, but hard when the game gets bigger |
| **2D tools included** (scenes, collisions, animations, camera) | Yes | Yes | Yes | No, I have to program them myself |
| **Language similar to Python** | Yes, GDScript is based on Python | No | No | It is Python |
| **Machine learning libraries** | No | Some (ML-Agents) | No | Yes, a lot |

### 3.2 Good and bad points

**Pygame** was my first idea, because it is Python and most of the reinforcement learning tutorials I watched also use Python. I watched two tutorials about making a game with Pygame and then I decided not to use it. Pygame is a library, not an engine. I would have to program the collisions, the animations, the scenes and the camera myself. In four weeks I would have almost no time left for the game.

**Unity** is the most used engine in the industry, and it has its own tool for machine learning. For a studio with experience it is a good choice. For me it means learning C# and a very big editor at the same time, and that is too much for my first project.

**GameMaker** is good for 2D games and it is easy to learn. But its language only works inside GameMaker, and you have to pay to publish a game. Godot gives me the same 2D tools for free.

**Godot** has everything I need for the game, and GDScript looks a lot like Python. Before I decided, I followed a beginner tutorial in Godot (it is the `first-game` project in my Realisation folder). At the end I had a character that moves, an enemy that patrols and a zone that kills the player. The bad point of Godot is that GDScript has no machine learning libraries. But for The Hunter I only need a table with numbers (see Decision 2), and GDScript can do that without any library.

### 3.3 My advice

**Make the game in Godot 4 with GDScript.** It is free, it has all the 2D tools the game needs, and I can use what I already know from Python. What we lose is the machine learning libraries of Python. That is only a problem if The Hunter needs a neural network one day.

## 4. Decision 2: how the enemies move and decide where to go

The game has two types of enemies. The **guards** patrol and react when they see the player. **The Hunter** is the enemy the client is interested in: an enemy that gets better at catching the player over time.

When an enemy moves there are two different questions:

- **How does it get to a place?** It has to walk around the bar and the tables, not into them (requirement M-07). This is **pathfinding**.
- **Where does it want to go?** To the next patrol point, to the player, or to the last place it saw the player. For the guards this is a few simple rules. For The Hunter this is the part that has to learn.

### 4.1 How the guards move around the level

| | **Straight line to the target** | **Pathfinding (NavigationRegion2D + NavigationAgent2D)** | **My own pathfinding on a grid (A\*)** |
|---|---|---|---|
| **What is it** | The guard walks straight to the target and slides along things in the way | Godot finds the shortest way around walls and furniture | I program the search for the route myself |
| **Walks around obstacles?** | No, it gets stuck in corners | Yes | Yes |
| **Already in Godot** | Yes | Yes | No |
| **Time to build** | Minutes | A few hours, mostly to learn how to set it up | Days |

Most beginner tutorials use a straight line. But when a table is between the guard and the player, it does not work anymore. A guard that keeps walking into a table looks broken, and the game is not tense anymore. Programming my own A\* would teach me a lot, but Godot already has it and it is tested. I prefer to use my time for the stealth part.

**My advice:** the guards use **the pathfinding that Godot already has**. I mark the floor where they can walk with a NavigationRegion2D, and every guard has a NavigationAgent2D that finds the way around the furniture.

### 4.2 How the guards decide where to go

Pathfinding only tells the guard *how* to go somewhere. The guard still has to decide *where* to go: the next patrol point, the player, or the last place it saw the player. These are the options for that:

|                                               | **Simple rules (states)**                                                         | **Q-learning with a table**                                                                                          | **Deep reinforcement learning**                               |
| --------------------------------------------- | --------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------- |
| **What is it**                                | A few rules: patrol, chase the player when you see them, stop when you catch them | The enemy has a table that says how good every move is in every situation, and it updates the table after every move | A neural network learns the same thing from a lot of examples |
| **Learns from the player?**                   | No                                                                                | Yes                                                                                                                  | Yes                                                           |
| **Works inside Godot without other programs** | Yes                                                                               | Yes, it is only a table                                                                                              | No, it needs Python and extra libraries                       |
| **Can I explain why it did something?**       | Yes                                                                               | Yes, I can read the table                                                                                            | Very difficult                                                |
| **Time to build**                             | Hours                                                                             | Days, with the training                                                                                              | Weeks                                                         |

For the guards, simple rules are enough and it is what the game needs. The player has to be able to learn the route of a guard to sneak past it, so the guards have to be easy to read. They are also the comparison: The Hunter is only interesting next to enemies that do not learn. And because they use pathfinding, the guards still move in a natural way through the club.

### 4.3 How The Hunter decides where to go

For The Hunter, only pathfinding is not a good answer. Pathfinding always finds the shortest way, so The Hunter would be perfect from the first second and it would never get better. Then there is nothing to measure, and that is exactly the question of the client.

**Deep reinforcement learning** is what they use in the "A.I. Learns to Drive" and Snake videos. It needs much more training, it works outside Godot, and when it does something strange it is very hard to know why. The Hunter only chooses between four moves on a small map, so this is too much for the problem.

**Q-learning with a table** is the simplest method that really learns. The Hunter looks at its situation, chooses one of four moves, gets points or loses points, and writes the result in a table. After many tries, the good moves have higher scores. All the "brain" of The Hunter is a table with around 1,500 numbers. I can open it and read it, so it is also easy to check the result.

### 4.4 My advice

**Guards: the pathfinding of Godot to move, and a few simple rules to decide where to go. The Hunter: Q-learning with a table.** I build the guards in this delivery, because the stealth game has to work first. I design The Hunter completely now, and it gets built in the next iteration, like I explain in the Analysis.

## 5. Summary

| Decision | My advice | Main reason | What we lose |
|---|---|---|---|
| Engine and language | Godot 4 with GDScript | Free, all 2D tools included, similar to Python | The machine learning libraries of Python |
| How the guards move | Pathfinding of Godot (NavigationAgent2D) | They walk around the furniture, not into it (M-07) | Time to learn the setup, and I do not program the route search myself |
| What the guards decide | Simple rules: patrol, chase, catch | Easy to read, so the player can learn their routes | They never surprise the player |
| The Hunter | Q-learning with a table, designed now, built in the next iteration | Simplest method that really learns, and easy to explain | It can only learn simple situations, not complex tactics |

## 6. Sources

All my sources are in section 7 of the Analysis. These are the ones that helped me most with these two decisions:

- [How to Make a Game in Python](https://www.youtube.com/watch?v=waY3LfJhQLY) and [Making a Game in Python with No Experience](https://www.youtube.com/watch?v=H09PmP5tsy8), YouTube. To see what it means to make a game with Pygame.
- [How to Make a Video Game — Godot Beginner Tutorial](https://www.youtube.com/watch?v=LOhfqjmasi0), YouTube. I followed it to make the `first-game` test project.
- [Q Learning Intro/Table — Reinforcement Learning p.1](https://www.youtube.com/watch?v=yMk_XtIEzH8&list=PLQVvvaa0QuDezJFIOU5wDdfy4e9vdnx-7), YouTube, sentdex, and [A Beginner's Guide to Q-Learning](https://medium.com/@goldengrisha/a-beginners-guide-to-q-learning-understanding-with-a-simple-gridworld-example-2b6736e7e2c9), Medium. To understand how Q-learning with a table works.
- [Deep Reinforcement Learning Applied to the Snake Video Game](https://www.youtube.com/watch?v=lzd0XfBoDIw) and [A.I. Learns to Drive](https://www.youtube.com/watch?v=r428O_CMcpI), YouTube. Examples of what deep reinforcement learning needs.

I checked all of them between 1 and 22 September 2026.
