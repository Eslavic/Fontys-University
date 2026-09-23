# Project Plan — The Witness

**Client:** Nightfall Interactive
**Made by:** David Eslava, ICT Student
**Coach:** Frank & Faruk
**Project period:** 1 September – 25 September 2026 (4 weeks)
**Deadline:** Friday 25 September 2026, 16:00

---

## 1. What this plan is for

The Analysis says what I am building and why. This plan says when I do it, in what order, and how long each part takes. Frank asked for it as a separate document with a Gantt chart, activities, estimated hours and dependencies.

## 2. What gets delivered

Two things:

1. **A playable prototype** — a player moving through a walled map, an enemy patrolling a route, detection through a vision cone, and a game over when the player is caught.
2. **The documentation** — Analysis, Advice, Design, this plan, Validation, an orientation report and the devlog.

Anything marked Will Not Have in the Analysis is out of scope.

The adaptive Hunter is a Could Have. The Analysis treats it as the client's main question, but there are no hours for it in the schedule below. That contradiction is still open and I need to settle it before I write the Design document.

## 3. Phases

| Phase | When | Finished when |
|---|---|---|
| Analysis | Week 1–2 | Analysis delivered to Frank |
| Advice | Week 3–4 | Engine and AI choices written up with the reasoning |
| Design | Week 3–4 | Architecture and flowcharts done |
| Realisation | Week 4 | Prototype does everything in Must Have |
| Validation | Week 4 | Tests run and written up |
| Delivery | 25 September | Everything submitted before 16:00 |

## 4. Activities

Hours are estimates. Status is as of Tuesday 22 September.

### Analysis

| Activity | Hours | Can't start until | Status |
|---|---|---|---|
| Work out the concept, setting and core loop | 4 | — | Done |
| Compare game engines (Godot, Unity, GameMaker, Pygame) | 6 | concept is decided | Done |
| Research Q-learning for grid-based chasing | 8 | concept is decided | Done |
| Write the MoSCoW table | 4 | concept is decided | Done |
| Write the Analysis, first version | 6 | research and MoSCoW done | Done |
| Export it and send it to Frank | 1 | Analysis written | Done |

### Advice

| Activity | Hours | Can't start until | Status |
|---|---|---|---|
| Feedback meeting with Frank and write down what he said | 2 | Analysis sent | Done, 14 Sep |
| Write the Advice document — the engine and AI comparison, the trade-offs, why I chose what I chose | 3 | the research and the feedback | Today |

### Design

| Activity | Hours | Can't start until | Status |
|---|---|---|---|
| Draw the high-level flowchart | 3 | Analysis written | Done |
| Learn Godot through a tutorial project — nodes, scenes, tilemaps, collisions | 12 | engine chosen | Done |
| Build the player — eight-direction movement and the animation states | 10 | Godot basics | Done |
| Write the Design document — technical choices, how the scenes fit together, a detailed flowchart for detection only | 4 | Advice document | Today |

### Realisation

| Activity | Hours | Can't start until | Status |
|---|---|---|---|
| Build the map — tilemap, walls, collision | 3 | Design written | Wednesday |
| One enemy patrolling a fixed route | 2 | map exists | Wednesday |
| Vision cone and line-of-sight detection | 3 | enemy patrols | Wed–Thu |
| Game over and restart when caught | 1.5 | detection works | Thursday |

### Validation

| Activity | Hours | Can't start until | Status |
|---|---|---|---|
| Write the test plan | 1 | prototype playable | Thursday |
| Playtest with two or three people | 1.5 | test plan | Thursday |
| Write the Validation document | 1.5 | tests run | Thursday |

### Documentation and portfolio

| Activity                                       | Hours | Can't start until | Status    |
| ---------------------------------------------- | ----- | ----------------- | --------- |
| Write this plan                                | 2     | feedback meeting  | Done      |
| Rewrite the Analysis for the client            | 4     | feedback meeting  | Done      |
| Finish the devlog and put it all in English    | 1     | —                 | Thursday  |
| Write the evidence descriptions for each piece | 1.5   | the piece exists  | As I go   |
| Write the orientation report                   | 2     | —                 | Wednesday |
| Final check and submit                         | 1     | everything else   | Thursday  |

**Total: 88 hours. 62 done, 26 left.**

## 5. Gantt chart

```mermaid
gantt
    title The Witness — project schedule
    dateFormat YYYY-MM-DD
    axisFormat %d %b
    excludes weekends

    section Analysis
    Concept and core loop             :done, a1, 2026-08-31, 2d
    Engine research                   :done, a2, after a1, 3d
    Q-learning research               :done, a3, 2026-09-02, 5d
    MoSCoW requirements               :done, a4, 2026-09-07, 2d
    Analysis first version            :done, a5, 2026-09-09, 3d
    Send to Frank                     :done, a6, 2026-09-14, 1d

    section Advice
    Feedback meeting                  :done, b1, 2026-09-14, 1d
    Advice document                   :active, b2, 2026-09-22, 1d

    section Design
    High-level flowchart              :done, c1, 2026-09-15, 1d
    Learn Godot                       :done, c2, 2026-09-15, 4d
    Player character                  :done, c3, 2026-09-18, 3d
    Design document                   :active, c4, 2026-09-22, 1d

    section Realisation
    Map, walls and collision          :d1, 2026-09-23, 1d
    Patrolling enemy                  :d2, 2026-09-23, 1d
    Vision cone and detection         :d3, 2026-09-23, 2d
    Game over when caught             :d4, 2026-09-24, 1d

    section Validation
    Test plan                         :e1, 2026-09-24, 1d
    Playtests                         :e2, 2026-09-24, 1d
    Validation document               :e3, 2026-09-24, 1d

    section Writing
    Project plan                      :done, f1, 2026-09-21, 1d
    Analysis rewrite                  :done, f2, 2026-09-21, 1d
    Orientation report                :f5, 2026-09-23, 1d
    Devlog finished                   :f3, 2026-09-24, 1d
    Submit                            :milestone, crit, del, 2026-09-25, 0d
```

## 6. The rest of the week

| Day        | What I do                                                                                                                                                    | Hours   |
| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------- |
| **Mon 21** | Project plan, Analysis rewrite                                                                                                                               | 6, done |
| **Tue 22** | Advice document (3), Design document (4), evidence descriptions (1)                                                                                          | 8       |
| **Wed 23** | Orientation report (2), map and collision (3), patrolling enemy (2), start the vision cone (2)                                                               | 9       |
| **Thu 24** | Finish the vision cone (1), game over (1.5), test plan (1), playtests (1.5), Validation (1.5), devlog (1), last evidence descriptions (0.5), final check (1) | 9       |
| **Fri 25** | Nothing planned. Buffer, then submit before 16:00.                                                                                                           | —       |

I put the writing before the code on purpose. None of the documents need the game to compile, so if the prototype runs late the documentation is already safe.

## 7. What could go wrong

- **The week has no slack.** Wednesday and Thursday are nine-hour days. If a day runs over I cut from the list below straight away instead of waiting until Friday.
- **Detection turns out to be harder than I think.** I build the vision cone as an Area2D with one raycast for line of sight, which is the simplest thing that meets the requirement. If raycasting eats too much time I fall back to a distance check.
- **My sprites are 1024×1024 and the camera is zoomed to 0.3.** That makes a normal tileset awkward. So I build the map out of plain rectangles at the player's scale. Frank already said placeholders are fine.
- **Evidence descriptions get forgotten.** I write each one right after the thing it describes, not all of them on Thursday night.

**If I fall behind, I cut in this order:** the title and game over screens first, then the alert gauge, then the visual polish. The Must Haves and the documents don't get cut.

## 8. How I know I'm finished

- The prototype runs, and you can walk around a walled map, get spotted by a patrolling enemy, and get caught.
- All seven of Frank's points from 14 September are dealt with.
- Analysis, Advice, Design, this plan, Validation, the orientation report and the devlog are all there, finished, in English.
- Every piece has an evidence description saying why it's in the portfolio, what I learned, and what I'd do differently.
