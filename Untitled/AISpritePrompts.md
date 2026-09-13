# The Witness — AI Asset Generation Prompts

Prompts for Gemini (Nano Banana / Imagen) or ChatGPT (DALL·E / GPT Image).

---

## Before you start — read this

**The hardest problem is getting a TRUE top-down view.** Image generators default to a
3/4 dramatic hero angle no matter how many times you say "90 degrees".

**Describing the angle does not work. Describing what must be ABSENT does.** This is the
single most important technique in this document. Instead of asking for an overhead camera,
state plainly that the face is not visible, the tie and lapels are not visible, and the
fronts of the shoes are not visible. Absence constraints force the geometry; angle
descriptions get ignored.

**How to tell if a generation actually worked:**

| Correct (true 90° overhead) | Wrong (3/4 hero shot) |
| --- | --- |
| Hat crown is a rounded shape, brim a ring around it | You can see the front of the hat brim |
| No face at all | Face, chin, or jaw visible |
| No tie, no lapels | Necktie and coat lapels visible |
| Feet are short foreshortened stubs | You see the fronts/sides of shoes |
| Shoulders are the widest part | Chest or coat flare is the widest part |

**Why this matters so much:** the player sprite rotates to face its movement direction. A
true overhead sprite looks correct at every rotation. A 3/4 sprite looks like the character
is lying on his side the moment he moves left or right. This breaks the game, and you will
only notice after building a full asset set.

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

## Costume logic — who wears a coat

The whole game takes place **inside** a jazz club, so coats carry meaning. Use this:

| Character | Wears | Why |
| --- | --- | --- |
| The Witness | Shirtsleeves, open waistcoat, no coat | A patron. He was here to listen to music. He belongs. |
| Gangster Guards | Suit jackets, no overcoats | Staff. They work here. |
| The Hunter | Full-length overcoat and hat | He came in **from outside**, and he is not staying. |

The Hunter keeping his coat on indoors is the point — it visually marks him as the
intruder, the one thing in the room that does not belong. It also makes his silhouette
the widest and darkest shape on screen, which is exactly what you want for the character
the player must track at a glance.

**Silhouette contrast, from above:** the Witness reads as bright white arms on a dark
torso, the guards as mid-weight blocky shapes, the Hunter as a large solid black mass.
Three distinct readings at any rotation.

---

## 1. The Witness (Player)

```
A sprite for a top-down 2D game, viewed from a security camera mounted on the ceiling
looking straight down at the floor.

A 1960s jazz club patron, running. He is dressed for indoors on a hot night: a white
dress shirt with the sleeves rolled up to his elbows, a dark waistcoat worn open over it,
dark suspenders, dark trousers, and a pale fedora. He is NOT wearing a coat or overcoat.

He is seen from DIRECTLY ABOVE, so:
- His FACE IS NOT VISIBLE AT ALL. We see only the flat top crown of his fedora as a
  rounded shape, with the brim forming a ring around it.
- His necktie and shirt collar are NOT visible, because we are looking down onto his
  shoulders from above.
- We do NOT see the fronts of his shoes. His feet are short foreshortened stubs.
- His shoulders are the widest part of the figure.
- His bare white forearms swing out to the sides in mid-stride, clearly separated from
  his dark waistcoat.
He runs toward the top of the frame.

Art style: Frank Miller Sin City noir comic book. Extreme high contrast. Harsh black ink
shadows with bold brush strokes. Pure white highlights. Strictly three colors only: pure
black, pure white, and one small blood red accent on his hatband. No grey tones, no
gradients, no shading ramps.

Tonal separation is critical: the waistcoat and trousers are solid black, the shirt
sleeves and hat are bright white, so the arms read clearly against the torso from above.

This is a flat orthographic overhead view with zero perspective distortion. It is NOT a
3/4 view, NOT a dramatic low angle, NOT a hero shot, NOT a character running toward the
camera.

Centered, full body, isolated on a flat solid magenta #FF00FF background. No ground
shadow, no floor, no scenery. Clean sharp edges. Square image.
```

**If you already have a good character at the wrong angle**, don't restart — feed the
image back to Nano Banana and change only the camera:

```
Keep this exact character, exact art style, exact colors, and exact linework.
Change ONLY the camera angle.

Move the camera to directly above him, looking straight down at the floor — like a
security camera mounted on the ceiling, or a bird flying directly overhead.

Critically, from this angle:
- His FACE IS NOT VISIBLE AT ALL. We only see the flat top crown of his fedora as a
  rounded shape, with the brim as a ring around it.
- His necktie and coat lapels are NOT visible, because we are looking down at his
  shoulders from above.
- We do NOT see the fronts of his shoes. His feet are heavily foreshortened stubs
  below his coat.
- His shoulders are the widest part of the image.

This is a flat orthographic overhead view with zero perspective distortion. It is NOT a
3/4 view, NOT a dramatic low angle, NOT a hero shot.

Same magenta #FF00FF background.
```

**Follow-up for animation frames (Nano Banana):**
> "Same character, same overhead angle, same style — now with his legs in the opposite stride position."

**Note on the red accent:** at a true overhead angle the necktie is hidden, so move the
red to something visible from above — a hatband, the shoulder seams, or a scarf.

---

## 2. Gangster Guard (Patrolling Enemy)

```
A sprite for a top-down 2D game, viewed from a security camera mounted on the ceiling
looking straight down at the floor.

A 1960s mafia enforcer in a pinstripe suit, walking. He is seen from DIRECTLY ABOVE, so:
- His FACE IS NOT VISIBLE AT ALL. We see only the top of his skull and his slicked-back
  dark hair from above.
- His necktie and suit lapels are NOT visible, because we are looking down onto his
  shoulders.
- We do NOT see the fronts of his shoes. His feet are short foreshortened stubs.
- His shoulders are the widest part of the figure.
He holds a revolver, his arm extended forward, and faces toward the top of the frame.

Art style: Frank Miller Sin City noir comic book. Extreme high contrast, harsh black ink
shadows, bold brush strokes, pure white highlights. Strictly three colors: pure black,
pure white, and one small blood red accent on his shoulder seams. No grey, no gradients.

This is a flat orthographic overhead view with zero perspective distortion. It is NOT a
3/4 view, NOT a dramatic angle, NOT a character facing the camera.

Centered, full body, isolated on flat solid magenta #FF00FF background. No shadow, no
floor, no scenery. Sharp clean edges. Square image.
```

---

## 3. The Hunter (Q-Learning Boss NPC)

He must be **instantly readable as different** — bigger silhouette, distinct hat shape,
and he is the only character allowed a large red element.

```
A sprite for a top-down 2D game, viewed from a security camera mounted on the ceiling
looking straight down at the floor.

A tall, heavy-set 1960s hitman in a long black overcoat, stalking forward. He is seen
from DIRECTLY ABOVE, so:
- His FACE IS NOT VISIBLE AT ALL. We see only the top of his bald skull as a smooth
  rounded shape.
- His collar and lapels are NOT visible, because we are looking down onto his shoulders.
- We do NOT see the fronts of his shoes. His feet are short foreshortened stubs below
  the hem of his coat.
- His enormously broad shoulders are the widest part of the figure, and his overcoat
  flares outward flat around him like a dark pool.
His silhouette is noticeably larger and wider than an ordinary man. He holds a straight
razor and faces toward the top of the frame.

Art style: Frank Miller Sin City noir comic book. Extreme high contrast, harsh black ink,
bold brush strokes, stark white highlights. Strictly three colors: pure black, pure white,
and blood red — the red used on a long scarf trailing flat behind him across the floor.
No grey, no gradients.

This is a flat orthographic overhead view with zero perspective distortion. It is NOT a
3/4 view, NOT a dramatic low angle, NOT a hero shot.

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

The `+ PI/2` is what compensates for the sprite pointing north instead of east.
