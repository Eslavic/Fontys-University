
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
> Deliver a playable prototype that demonstrates, in a single short level, the difference between a conventional patrolling enemy and an enemy that learns to pursue the player — and provide measurable evidence that the learning enemy actually improves.

The challenge has two halves that must both succeed:
1. **The game must be playable.** The stealth loop — move, hide, be seen, get caught — has to work on its own, otherwise there is nothing for the adaptive enemy to be measured against.

2. **The adaptation must be demonstrable.** A claim that the enemy "learns" is worthless without evidence. The prototype must produce data that shows measurable improvement over time.