# The Witness — Asset Generation Guide

Two pipelines: an **orthographic 3D render pipeline** for characters (reliable, gives
animation frames), and **pure AI prompting** for environment props and key art.

> **Which to use for what.** Prompting cannot reliably produce a true 90° camera — every
> generator defaults to a 3/4 hero angle. For anything that must rotate in-game (the
> player, guards, the Hunter), use the render pipeline below. For static props seen from
> above and for key art, prompting is fine.

## Decision: the camera is a true 90° top-down. No cheating.

Locked. This matches the stated art direction — *High-Contrast Geometric Minimalism* — by
forcing the design onto pure shape and value rather than anatomy.

**Why prompting cannot deliver this.** Generators produce a sprite that is internally
inconsistent: the head and shoulders render at ~90°, but the legs revert to a ~70° 3/4
view, showing thighs, knees, shins and shoe tops. That mismatch inside a single sprite is
what reads as "wrong", more than the angle itself. It happens because the training data
contains almost no true overhead humans but millions of front-on full-body photos, so the
model fakes the easy part (a head is a round mass) and falls back to what it knows below.
No amount of prompt engineering fixes the lower body reliably. An orthographic render
cannot make this mistake — the whole figure is projected through one camera matrix, so
consistency is geometric rather than a guess.

**What a true 90° figure actually looks like:** legs almost entirely hidden beneath the
torso, only shoe tips showing and alternating slightly during the walk. Trousers, shoes
and neckties effectively do not exist. Plan for that instead of fighting it.

### Where character identity lives at 90°

| | The Witness | Guard | The Hunter |
| --- | --- | --- | --- |
| **Head shape** | Fedora: wide clear ring | Small dark oval | Bald: large smooth oval |
| **Shoulder outline** | Narrow, white arms outside | Medium, square | Very wide, coat overflowing |
| **Value pattern** | White arms / black torso | Stripes | Solid black |

**Exaggerate the hat and shoulders beyond realistic proportions.** This is the standard
top-down trick — anatomically correct proportions do not read at gameplay scale. The
Witness's fedora should be generously, almost cartoonishly wide.

### Adding the fedora in Blender

Mixamo characters have no hats, and at 90° the hat is most of the character. Build it in
two minutes, no modelling skill required:

1. `Add > Mesh > Cylinder`, flatten on Z — this is the crown
2. `Add > Mesh > Cylinder` again, wider and flatter — this is the brim
3. Position both over the head
4. Select the hat, then <kbd>Shift</kbd>-select the armature, `Ctrl+P > Bone`, pick the
   head bone

The hat now follows the head through the whole animation.

The Hunter needs nothing — Mixamo's bald head works as-is. His overcoat can be faked with
a very flattened cone around the body, since at 90° only the black outline mass reads,
never the detail.

---

# PART A — Character sprites via orthographic render

The generator is never asked for the camera angle. The angle is locked by an orthographic
3D render; AI only repaints the style afterward, if at all.

## A1. Mixamo — get the animation

Go to [mixamo.com](https://www.mixamo.com) (free Adobe account, browser-based, no
modelling skill needed).

1. Pick any humanoid character. It does not need to look like the Witness — you are
   harvesting **pose and angle**, not costume.
2. Search the animation library for **Running**. Also grab **Walking** (for guards) and
   **Standing Idle**.
3. **Tick the "In Place" checkbox** in the animation settings panel.

> ### The In Place gotcha
> Mixamo animations carry root motion by default — the character sprints forward and
> leaves the camera view within about a second, so you get one usable frame and then an
> empty floor. "In Place" pins him to the origin to run on the spot. This is the most
> common mistake in this workflow. Check it every time.

4. Download with these settings:

| Setting | Value |
| --- | --- |
| Format | FBX Binary (.fbx) |
| Skin | With Skin |
| Frames per Second | **30** |
| Keyframe Reduction | none |

30 FPS because it divides cleanly by 3, 5 and 6, which makes frame sampling painless.
You will not render all of them.

## A2. Blender — camera setup

Import with `File > Import > FBX`.

**Add the camera** (`Add > Camera`), then in Object Properties set it to look straight
down. Blender's default camera points along −Z, so zero rotation *is* straight down:

| Property | Value |
| --- | --- |
| Location | `0 m, 0 m, 10 m` |
| Rotation | `0°, 0°, 0°` |

**In Camera Data Properties:**

| Property | Value |
| --- | --- |
| Type | **Orthographic** |
| Orthographic Scale | `3.0` — raise to zoom out, lower to zoom in |

Orthographic is the whole point: it has mathematically zero perspective distortion, so
the head cannot appear larger than the feet. No prompt can guarantee this. A render can.

Mixamo characters are roughly 1.7–1.8 Blender units tall, so a scale of `3.0` frames the
figure with a little margin. Press <kbd>Numpad 0</kbd> to check framing.

## A3. Render engine and lighting

**Use EEVEE, not Cycles.** Render Properties → Render Engine → EEVEE.

The reasoning is worth keeping for the report: the final step crushes the image to pure
black and white, so every advantage Cycles offers — accurate global illumination, soft
shadow falloff, noise-free gradients — is destroyed by the threshold. You would pay
minutes per frame for detail you then delete. Across ~40–60 frames and several re-render
iterations, EEVEE turns hours into seconds. The same holds if you restyle via img2img,
since low-denoise img2img also discards fine lighting detail.

Enable these so *some* form survives the threshold:

| Setting | Value | Why |
| --- | --- | --- |
| Ambient Occlusion | ON | Darkens the crease between arm and torso, keeping limbs separable |
| Soft Shadows | ON | Default in recent versions |

On Blender 4.2+ you have EEVEE Next, where enabling **Raytracing** covers both.

**Lighting:** one sun, angled — not straight down, or the figure renders completely flat
with no form.

`Add > Light > Sun`, then set its rotation to about `45°, 0°, 135°`. Strength `3–5`.

Angled light gives you shadow on one side of the body, which is what survives posterizing
into a readable noir shape. Flat light gives you a featureless blob.

## A4. Render output and exporting the PNGs

Settings live in two different panels — the icons are in the vertical strip on the right
of the Properties editor.

### Render Properties (camera-back icon)

Scroll to **Film** → tick **Transparent**. This gives real alpha straight out of Blender:
no magenta background, no keying step.

### Output Properties (printer icon)

**Format:**

| Setting | Value |
| --- | --- |
| Resolution X | `1024` |
| Resolution Y | `1024` |
| % | `100` |

**Frame Range:**

| Setting | Value |
| --- | --- |
| Frame Start | `1` |
| End | `25` |
| Step | `4` |

**Output:**

| Setting | Value |
| --- | --- |
| Path | `//renders/witness_` |
| File Format | **PNG** |
| Color | **RGBA** |
| Color Depth | `8` |

> **The two settings that must both be right.** `Film > Transparent` (Render Properties)
> AND `Color > RGBA` (Output Properties). The usual failure is enabling Transparent but
> leaving Color at RGB — the alpha channel is then discarded on write and every frame
> comes out with a solid background. Both, or neither works.

The `//` prefix means "the folder containing the .blend file". Blender appends frame
numbers automatically: `witness_0001.png`, `witness_0005.png`, `witness_0009.png`… Set
this path explicitly — the default dumps into a system temp folder.

### Rendering

Press **`Ctrl + F12`**, or `Render > Render Animation` from the top menu.

> **Render Animation, not Render Image.** `Ctrl+F12` writes every frame to disk
> automatically. `F12` (Render Image) only displays the result and saves nothing — you
> would have to `Image > Save As` manually, once per frame.

A window opens and cycles through the frames; with EEVEE this takes seconds. Close it
when done — the PNGs are already written.

### Verify

Open one frame in GIMP. You should see a transparency checkerboard behind the character.
White or black background means `Color` was left on RGB — fix it and re-render.

### Frame count

### Frame count

Mixamo's run cycle is about **26 frames at 30 FPS** (one full two-step loop). Sample it
down with Frame Step:

| Frame Step | Frames you get | Use |
| --- | --- | --- |
| 3 | ~8 | Smooth, safe |
| 4 | ~6 | Balanced — recommended |
| 6 | ~4 | Minimal, very Hotline Miami |

**Set Frame End to 25, not 26.** Frame 26 duplicates frame 1, and rendering it makes the
loop visibly hitch every cycle.

Render with `Ctrl + F12` (animation, not single frame).

## A5. Turn the render into noir

**You may not need AI at all here.** Do the threshold in Blender's Compositor rather than
in GIMP: it applies automatically to every frame on render, and updates itself if you
change the lighting later.

### Compositor node setup

Switch to the **Compositing** workspace and tick **Use Nodes**.

Add, with `Shift + A`:

| Node | Category | Purpose |
| --- | --- | --- |
| RGB to BW | Converter | Desaturates |
| Math → **Greater Than** | Converter | The threshold slider |
| **Set Alpha** → **Replace Alpha** | Converter | Restores transparency |
| Viewer | Output | Live preview while adjusting |

Wire it like this — note that **two cables leave Render Layers**:

```
Render Layers ──[Image]──> RGB to BW ──> Math (Greater Than) ──[Image]──┐
                                                                        ├─> Set Alpha ──> Composite
Render Layers ──[Alpha]────────────────────────────────────[Alpha]──────┘
```

> **Why Set Alpha is mandatory.** `RGB to BW` outputs a single luminance value and
> discards the alpha channel; the Math node passes on a single value too. Composite then
> treats the result as fully opaque, so the transparent background — which is black RGB
> with zero alpha — comes out as **solid black**. Routing the original Alpha socket around
> the threshold chain and reapplying it with Set Alpha is what fixes this. Black
> backgrounds after adding a threshold chain are always this.

### Set View Transform to Standard

**Render Properties → Color Management → View Transform → `Standard`.**

Blender 4.x defaults to **AgX**, a filmic transform that compresses highlights and lifts
blacks to emulate film stock. With it on, the threshold slider operates on already-graded
values and never seems to land cleanly. With Standard, the slider maps to real luminance
and the cut becomes predictable.

### The red accent

The threshold crushes everything to pure black and white, so **red cannot survive the
chain**. Two options:

- **Paint it in GIMP afterwards** — simplest, and it is only ~6 frames with the hatband in
  a consistent place. Recommended for a 4-week timeline.
- **Render a second pass** with only the hat visible and use it as a mask for the red.
  More elegant, costs an afternoon.

If the threshold result is too crude, restyle instead with Stable Diffusion **img2img**:

| Setting | Value |
| --- | --- |
| Denoising strength | `0.4 – 0.6` |
| Prompt | the noir style block from Part B |

Low denoise is the key number: the pose and camera angle stay locked by your render, and
the model only repaints surface style. Push past ~0.7 and it starts reinventing the
perspective, which is the exact problem you were escaping.

## A6. Why this pipeline over training a LoRA

Worth writing up in your report under "Alternatives Dismissed":

- **The bootstrap problem.** Training a LoRA on true top-down requires a dataset of true
  top-down images — the very thing that is hard to obtain. And if you ever assembled that
  dataset, you would not need the LoRA, because you could use the images directly.
- **Time budget.** A first LoRA means environment setup, dataset curation, captioning, and
  hyperparameter iteration: realistically 3–7 days out of a 4-week project, spent on
  something in none of the four stated learning goals.
- **It solves a second problem for free.** Rendering gives frame-to-frame character
  consistency, which prompting cannot — every AI generation drifts slightly, so an
  8-frame prompted run cycle would flicker between eight subtly different men.

---

# PART B — Props, tiles and key art via AI prompting

Static objects seen from above are much easier to prompt than figures, because there is
no body geometry for the model to get wrong. Use the prompts below.

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
| The Witness | White shirtsleeves, open black waistcoat, pale fedora, red hatband | A patron. He was here to listen to music. He belongs. |
| Gangster Guards | Bold black-and-white pinstripe suit, revolver, small red shoulder accents | Staff. They work here. |
| The Hunter | Full-length solid black overcoat, bald, large red scarf | He came in **from outside**, and he is not staying. |

The Hunter keeping his coat on indoors is the point — it visually marks him as the
intruder, the one thing in the room that does not belong. It also makes his silhouette
the widest and darkest shape on screen, which is exactly what you want for the character
the player must track at a glance.

**Silhouette contrast, from above:** the Witness reads as bright white arms on a dark
torso, the guards as bold striped shapes, the Hunter as a large solid black mass.
Three distinct readings at any rotation.

Because the guards are visually loud — maximum-contrast stripes pull the eye — the Hunter
must be pushed further to keep the hierarchy right: noticeably larger, solid black, and
the only character with a large red element. If a guard shouts louder than the Hunter,
the player watches the wrong enemy.

### The 64px silhouette test

Before generating the rest of the asset set, put all three characters side by side,
scaled down to **64 × 64**, and check:

1. Can you tell which is which in under a second?
2. Does the Hunter read as the biggest threat?
3. Do the guard's stripes still read as stripes, or have they turned to grey mush?

Thirty seconds of checking here saves rebuilding the whole set in week 3. Keep the
comparison image — a silhouette readability test at true gameplay scale is far stronger
evidence for the report than describing the decisions in prose.

### Common generation flaw to watch for

Overhead heads often come out as a **spiral or swirl** pattern that reads as a snail
shell rather than hair. Fix with: *"replace with a simple, smooth, solid dark oval of
slicked-back hair — flat and plain, no spiral, no swirl, no concentric rings."*

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
