# The Witness — AI Asset Generation Prompts

  

Prompts for Gemini (Nano Banana / Imagen) or ChatGPT (DALL·E / GPT Image).

  

 QLearning and research AI:
    - [Deep Reinforcement Learning Applied to the Snake Video Game](https://www.youtube.com/watch?v=lzd0XfBoDIw)
    - [Q Learning Intro/Table - Reinforcement Learning p.1](https://www.youtube.com/watch?v=yMk_XtIEzH8&list=PLQVvvaa0QuDezJFIOU5wDdfy4e9vdnx-7)
    - [Seatch basic game applying reinforcement learning](https://www.youtube.com/results?search_query=basic+game+applying+reinforcement+learning)
    - [Deep Reinforcement Learning Tutorial for Python in 20 Minutes](https://www.youtube.com/watch?v=cO5g5qLrLSo&list=PLgNJO2hghbmjlE6cuKMws2ejC54BTAaWV)
    - [The FASTEST introduction to Reinforcement Learning on the internet](https://www.youtube.com/watch?v=VnpRp7ZglfA)
    - [A.I. Learns to Drive](https://www.youtube.com/watch?v=r428O_CMcpI)
    - [A Beginner’s Guide to Q-Learning: Understanding with a Simple Gridworld Example](https://medium.com/@goldengrisha/a-beginners-guide-to-q-learning-understanding-with-a-simple-gridworld-example-2b6736e7e2c9)

  
## 1. Game Screens / UI Layout
(Sketch or wireframe of each screen: Main Menu, Gameplay, Game Over. 
Hand-draw them, take a photo, embed in Obsidian with ![[photo.jpg]])
https://drive.google.com/file/d/1-yiF2Pq-OgJaTXsMAQbIckoDzGINz26O/view?pli=1
## 2. Scene Architecture
(Diagram of your Godot scene tree — what scenes/nodes exist and 
how they're organized. Draw it or use a simple tree format.)

## 3. Map Layout
(Top-down sketch of your jazz club level — walls, rooms, obstacles, 
player spawn, enemy patrol paths, exits.)

## 4. Enemy Behavior Design
(Flowchart or state diagram: what states do guards have? 
Patrol → Detect → Alert → Chase → Lose sight → Return to patrol. 
What triggers each transition?)

## 5. The Hunter — Q-Learning Agent Design
(Visual diagram of: state space, action space, reward table. 
How does the grid discretization work? What does the Q-table look like?)

## 6. Art Direction Reference
(Your noir palette, reference images, how characters/walls/environment 
will look. Color codes for your 3-color palette.)
## Before you start — read this

  

**The hardest problem is getting a TRUE top-down view.** Image generators default to a

3/4 isometric perspective. You must fight this explicitly in every prompt. The phrases that

work are *"orthographic top-down"*, *"camera directly overhead"*, *"bird's eye view looking

straight down"*, *"90-degree overhead angle"*, *"no perspective distortion"*.

  

**Rules for consistency:**

  

1. Generate **one character at a time**, never a sheet of many. Sheets come out inconsistent.

2. Use **Gemini's Nano Banana** if you can — it can edit an existing image, so you generate

   the Witness once, then say *"same character, now walking"* to get matching frames.

3. Always draw characters **facing UP (north)**. Godot's rotation math depends on it.

4. Ask for a **flat magenta background** (`#FF00FF`) — it's easy to key out and never

   appears in a noir palette. Transparent PNG requests are unreliable.

5. Generate at **1024x1024**, then downscale in Godot. Never upscale.

  

**Palette to repeat in every prompt:** pure black `#000000`, pure white `#FFFFFF`,

single blood red `#CC0000`. No greys, no gradients, no other colors.

  

---

  

## 1. The Witness (Player)

  

```

Orthographic top-down sprite for a 2D game, camera positioned directly overhead at a

90-degree angle looking straight down. A 1960s man seen from directly above: I can see

the top of his head, his shoulders, and his feet foreshortened beneath him. He wears a

rumpled trench coat and a fedora. He is running, arms mid-stride. He faces toward the

top of the frame.

  

Art style: Frank Miller Sin City noir comic book. Extreme high contrast. Harsh black ink

shadows with bold brush strokes. Pure white highlights. Strictly three colors only: pure

black, pure white, and one blood red accent on his necktie. No grey tones, no gradients,

no shading ramps, no cross-hatching.

  

The figure is centered, full body visible, isolated on a flat solid magenta #FF00FF

background. No ground shadow, no floor, no scenery. Clean sharp edges suitable for

cutting out. Square image.

```

  

**Follow-up for animation frames (Nano Banana):**

> "Same character, same style, same overhead angle — now with his legs in the opposite stride position."

  

---

  

## 2. Gangster Guard (Patrolling Enemy)

  

```

Orthographic top-down sprite for a 2D game, camera directly overhead at 90 degrees

looking straight down. A 1960s mafia enforcer seen from directly above: top of his head

with slicked-back dark hair, broad shoulders in a pinstripe suit, feet foreshortened

below. He holds a revolver in his right hand, arm extended forward. He faces toward the

top of the frame.

  

Art style: Frank Miller Sin City noir comic book. Extreme high contrast, harsh black ink

shadows, bold brush strokes, pure white highlights. Strictly three colors: pure black,

pure white, and one blood red accent on his pocket square. No grey, no gradients.

  

Centered, full body, isolated on flat solid magenta #FF00FF background. No shadow, no

floor, no scenery. Sharp clean edges. Square image.

```

  

---

  

## 3. The Hunter (Q-Learning Boss NPC)

  

He must be **instantly readable as different** — bigger silhouette, distinct hat shape,

and he is the only character allowed a large red element.

  

```

Orthographic top-down sprite for a 2D game, camera directly overhead at 90 degrees

looking straight down. A tall, heavy-set 1960s hitman seen from directly above: bald

head, enormously broad shoulders in a long black overcoat that flares outward around

him. His silhouette is noticeably larger and wider than an ordinary man. He holds a

straight razor. He faces toward the top of the frame.

  

Art style: Frank Miller Sin City noir comic book. Extreme high contrast, harsh black ink,

bold brush strokes, stark white highlights. Strictly three colors: pure black, pure white,

and blood red — the red used on a long scarf trailing behind him. No grey, no gradients.

  

Menacing, imposing, predatory. Centered, full body, isolated on flat solid magenta

#FF00FF background. No shadow, no floor. Sharp edges. Square image.

```

  

---

  

## 4. Environment — Floor Tiles (Seamless)

  

```

A seamless tileable texture of a 1960s jazz club floor, viewed from directly overhead at

a 90-degree orthographic angle. Black and white checkerboard tiles, worn and scuffed,

with subtle ink texture and grime.

  

Art style: Frank Miller Sin City noir comic. Pure black and pure white only, no grey, no

gradients. Hand-inked comic book texture. High contrast.

  

The texture must tile seamlessly — edges must wrap perfectly on all four sides. Flat, no

perspective, no lighting, no vignette. Square image.

```

  

Repeat with: `dark hardwood floor planks`, `red carpet with worn patches` (allow red here),

`black and white marble lobby tiles`.

  

---

  

## 5. Environment — Props (Generate individually)

  

Use this template and swap the object:

  

```

Orthographic top-down view, camera directly overhead at 90 degrees looking straight

down at a [OBJECT] in a 1960s jazz club. Only the top surface is visible, no sides, no

perspective.

  

Art style: Frank Miller Sin City noir comic. Strictly pure black, pure white, and blood

red accents only. No grey, no gradients. Bold black ink outlines, harsh white highlights.

  

Isolated on a flat solid magenta #FF00FF background. No shadow, no floor beneath it.

Sharp clean edges for cutting out. Square image.

```

  

**Objects to generate:**

  

| Category | Objects |

| --- | --- |

| Furniture | round cocktail table, bar counter section, upholstered booth, wooden chair, barstool |

| Stage | grand piano, upright double bass, drum kit, microphone stand, stage riser |

| Cover | wooden crate, stacked barrels, folding screen, potted palm |

| Hiding spots | open closet, hanging velvet curtain, under-table gap |

| Doors | closed wooden door, open doorway, red-lit EXIT door |

| Detail | spilled drink glass, scattered playing cards, cigarette ashtray, pool of blood |

  

---

  

## 6. UI Elements

  

```

A set of minimalist 2D game UI icons in Frank Miller Sin City noir comic style. Strictly

pure black, pure white, and blood red only. Bold hand-inked brush strokes, extreme

contrast, no grey, no gradients.

  

Icons needed: a red exclamation mark (alert), a white question mark (searching), an eye

symbol (detection), a stamina bar frame, a heart or life symbol.

  

Each icon isolated on flat solid magenta #FF00FF background, arranged in a grid with

generous spacing between them. Sharp edges. Square image.

```

  

---

  

## 7. Key Art / Title Screen Image

  

This is your one "hero" image — for the main menu and your report cover.

  

```

A dramatic noir comic book poster for a video game titled "THE WITNESS".

  

Composition: a lone man in a trench coat and fedora, seen from a high overhead angle,

running across the checkerboard floor of a 1960s jazz club. He is small in the frame,

fleeing toward the bottom-left. Above and behind him, cast across the floor, stretches

the enormous distorted shadow of a huge broad-shouldered man in a long coat — the

shadow is far larger than the fleeing figure and reaches toward him. Around the edges,

overturned cocktail tables, a grand piano, and scattered chairs. A single splash of

blood red pools near the center.

  

Art style: Frank Miller Sin City. Extreme high contrast black and white. Harsh hand-inked

brush strokes, deep pools of solid black, stark white negative space. The ONLY color is

blood red, used sparingly on the blood pool and the man's necktie. No grey tones, no

gradients, no digital shading.

  

Mood: paranoid, claustrophobic, desperate. Cinematic and graphic. Vertical poster

composition with empty dark space at the top for a title.

```

  

---

  

## After generating — cleanup workflow

  

1. **Remove the magenta background:** use [remove.bg](https://remove.bg), or in GIMP:

   `Layer > Transparency > Color to Alpha`, pick the magenta.

2. **Force the 3-color palette:** if the AI snuck in greys, use GIMP

   `Colors > Posterize` (levels: 2) then manually recolor the red. This guarantees your

   palette stays consistent across every asset — do this to *every* sprite.

3. **Trim and center:** crop to the sprite's bounding box, then pad to a square. The

   character's center of mass should sit at the image center so Godot rotates it cleanly.

4. **Import to Godot:** in the Import tab set Filter to **Off** for crisp edges.

  

---

  

## Godot rotation snippet

  

Draw every character facing UP, then:

  

```gdscript

extends CharacterBody2D

  

@export var speed := 200.0

  

func _physics_process(delta: float) -> void:

    var input := Input.get_vector("left", "right", "up", "down")

    velocity = input * speed

    move_and_slide()

  

    if velocity.length() > 1.0:

        rotation = velocity.angle() + PI / 2

```

  

The `+ PI/2` is what compensates for the sprite pointing north instead of east.end me prompt