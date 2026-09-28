# Validation: The Witness

**Author:** David Eslava
**Version:** 0.1
**Date:** 25 September 2026

## 1. What validation should be

Validation is the last phase of the project. In this phase I check if the product does what the Analysis asked for. For a game this means two things. First, I test the requirements from the MoSCoW list, for example "the guard catches the player and the game shows a game over". Second, I let other people play and I ask them what they think, so I can improve the game in a next version.

## 2. Why I did not do it in this challenge

I did not do a real validation for this delivery. I want to explain why.

**There was not enough time.** The challenge was four weeks. I spent the first two weeks on the Analysis, because it was my first time writing a document like this and my coach Frank asked me to change a lot. I only started to learn Godot on 15 September. After that I had to write the Advice, the Design and the Project Plan too, and build the game at the same time.

**The main mechanic is not finished.** Most of my Must Have requirements are about the guards: they patrol, they see the player, and they catch him. The guard is not built yet. So I cannot test these requirements. If I let people play now, they can only walk around the map. Their feedback would be about the look of the game, not about the stealth, and the stealth is the whole point of the game.

**I focused on learning.** This is my first semester and my first game. I did not know Godot or GDScript before this challenge. I decided that for me it was more important to understand the basics well. I wanted to know how nodes, scenes, movement, collisions and lights work, and to be able to explain my own code. I also wanted to learn how to write professional documents. I think this was the right choice for now, even if the game is smaller than I wanted.

## 3. What I did test

I did not do a formal test with other players, but I tested the game a lot while I was building it. After every change I pressed play and checked it myself. In the table below I put these checks next to the Must Have and Should Have requirements from the [[The Witness - Analysis 0.2|Analysis]], so it is clear which ones work and which ones I cannot test yet.

| ID | Requirement (short) | How I tested it | Result |
|---|---|---|---|
| M-01 | The client can start the game and play it | I start the main scene from Godot and play it | Partly. It runs from the Godot editor, but there is no exported build yet |
| M-02 | The player moves in eight directions with W, A, S, D | I walk in all 8 directions and watch the animation | Works. The right animation plays for every direction, and the player is not faster on a diagonal |
| M-03 | The player cannot walk through walls or furniture | I walk into walls, tables and the bar counters | Works. The player stops and slides along the wall |
| M-04 | Walls and furniture work as cover | I check that walls and tables block the light | Not testable yet. The shadows work, but cover only matters when there is a guard |
| M-05 | Enemies move through the level | - | Not built yet |
| M-06 | The player is only seen inside a vision cone | - | Not built yet |
| M-07 | Enemies walk around walls | - | Not built yet |
| M-08 | Game over when an enemy catches the player | - | Not built yet |
| S-01 | Sprint with a stamina bar | I hold Shift and run | Partly. Running works, but there is no stamina, so the player can run forever |
| S-04 | Main menu and retry screen | - | Not built yet. The screens are only wireframes in the Design |

So 2 of the 8 Must Haves work, 1 works partly, and 5 are not built. The 5 that are missing are all about the guard. This shows very clearly what the next step is.

When something felt wrong during testing, I changed it. For example, I removed the acceleration one time, but the movement felt worse, so I put it back. This is small testing, but it helped me to make the movement feel good.

You can see the current state of the game in "Video 3 - Map and lights (25 Sep).mp4" in the folder 4 Realisation.

## 4. What I will do next time

When the first guard and the game over screen work, I will do the validation like this:

1. Make a simple test table with every Must Have requirement, what I expect, and what really happens.
2. Let three or four classmates play the game without my help, and watch where they get stuck.
3. Ask them a few short questions, for example "Was it clear where to go?" and "Was the guard fair?".
4. Write down the results, change the game, and test again.

In the next challenge I will also plan time for validation from the start, and not leave it for the last days.
