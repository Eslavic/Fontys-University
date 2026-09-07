## - Project description
- For this challenge, I'm going to develop a 2D Real Top-Down game in Godot. The core idea is: 'The Witness' (the protagonist) was in the wrong place at the wrong time and saw something they shouldn't have (a murder, a dirty deal,etc.) in a 1960s jazz club. Now, you have to escape the building before the gangsters catch you,  and above all, evade the Boss's right-hand man (**The Hunter**).

  This challenge combines two dynamics: **stealth** (guards and gangsters patrolling and detecting you through their line of sight) and **pursuit** (a special NPC, **The Hunter**,ho learns to intercept the player increasingly efficiently *I am still mulling over this part* ). For the visual direction, It will be inspired (Ai Generate)  from Frank-Miller-inspired noir comic-book aesthetic, utilizing a single 3-color palette (black and white + red accents). This greatly simplifies the asset design and saves time, allowing me to fully focus on the creation process within Godot and Python.
#### - What I want to learn through this project:

- **Game Development Fundamentals:** I want to learn how to create a video game using an actual industry engine, mastering the core fundamentals, the underlying programming, scene structures, character handling, and collision matrices.
- **Conceptual & Aesthetic Design:** Understand the rationale behind game design choices—specifically, why to choose a particular art style over another, how to build a cohesive narrative, and how to articulate a complete game concept.
- **AI Applied to Video Games via Reinforcement Learning (Q-learning):** Explore how an autonomous agent can learn to behave and improve its performance (specifically for 'The Hunter' role) through trial and error, relying on true algorithmic adaptation rather than a pre-programmed, static finite state machine.
- **Academic Documentation & Empirical Validation:** Learn how to document and validate the entire learning process in a realistic and measurable way, establishing clear metrics to provide concrete proof of whether the agent’s efficiency actually improved or not.

#### - Requirements (MoScoW)

| <center>![[Pasted image 20260906134740.png]]</center><br><center>**Must Have**</center> | <center>![[Pasted image 20260906134814.png]]</center><br><center>**Should Have**</center> | <center>![[Pasted image 20260906135115.png]]<br><center>**Could Have**</center></center><br> | ![[Pasted image 20260906135231.png]]<br><center>**Will Not Have**</center> |
| :-------------------------------------------------------------------------------------- | :---------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------- |
| Playable Prototipe / Playable character                                                 | Stamina / Sprint System                                                                   | Direct Combat / Killing the Enemy                                                            | Advanced settings menu (audio adjustments, graphics settings)              |
| Basic Movement 2D (WASD)                                                                | Detection Meter / Alert Gauge                                                             | Q-Learning Prototipe (Reinforcement Learning) integrated for The Hunter/NPC's                | Multiple levels                                                            |
| Colisions with the enviroment (walls)                                                   | Search State                                                                              | Combat Recovery System                                                                       | Multiplayer                                                                |
| Basic Vision Cone for enemies                                                           | Hiding Spots / Hiding Mechanics                                                           | Distraction Items                                                                            | Multiple maps or vertical floors.                                          |
| Fail On Capture / Death State                                                           |                                                                                           | Adaptative sounds effects                                                                    | Crafting                                                                   |
| Small Map with obstacles                                                                | Simple User Interface (Main Menu and Game Over screens).                                  |                                                                                              | Adaptative Jazz Music                                                      |
| NPC's (Enemies)                                                                         |                                                                                           |                                                                                              |                                                                            |
| Basic pursuit AI for the Hunter using pre-calculated pathfinding (`NavigationAgent2D`). |                                                                                           |                                                                                              |                                                                            |


### 3. Proposed Solution

#### Engine & Programming Language: Godot 4 with GDScript
* **Decision Rationale:** I selected Godot over Pygame (a bare-bones Python library) because Godot provides native systems for scenes, tilemaps, animations, and state management. This allows me to focus my limited 4-week timeline on AI agent development and visual polish rather than building engine infrastructure from scratch. 
* **Alternatives Dismissed:** Unity was discarded due to its steeper learning curve for a first engine project (C# and a high volume of simultaneous concepts). GameMaker was passed over because Godot offers similar capabilities while being entirely free and open-source. 
* **Language Synergy:** GDScript was chosen because its syntax is heavily inspired by Python, allowing me to leverage my existing (though rusty) foundational knowledge.

#### Artificial Intelligence: Tabular Q-learning for the Hunter
* **Architecture:** The Hunter's behavior will be driven by a Tabular Q-learning algorithm. 
* **State & Action Space:** The environment state will be defined by the relative position of the Hunter to the player, discretized into a grid system. The action space consists of movement in four cardinal directions.
* **Reward System:** The reward function will yield positive reinforcement for reducing the Manhattan distance to the player and negative reinforcement for idling or colliding with obstacles.
* **Technical Rationale:** I chose tabular Q-learning over a Deep Q-Network (neural networks) because it can be implemented natively in GDScript without external Python dependencies. Furthermore, a Q-table is fully inspectable, making it significantly easier to debug, visualize, and present as empirical proof of learning for university evaluation.

#### Visual Art Direction: High-Contrast Geometric Minimalism
* **Execution:** The game will utilize flat geometric shapes and a high-contrast 3-color palette composed directly within Godot.
* **Technical Rationale:** This approach completely bypasses the need for advanced pixel art skills or complex frame-by-frame animation, keeping production time tightly constrained while matching the intended 1960s Noir comic-book aesthetic.
