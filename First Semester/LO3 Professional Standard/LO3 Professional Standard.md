# LO3 Professional Standard

**Student:** David Eslava  
**Programme:** Associate Degree HBO-ICT, Fontys ICT, Eindhoven
**Learning outcome:** LO3 Professional Standard  
**Challenge:** Challenge 1, The Witness  
**Period:** 1 to 25 September 2026

*I used AI (Claude) to help with the structure and English in this document. All the planning, decisions, and reflections are my own.*

## 1. How I planned the project

When the challenge began, I did not make a real plan. I jumped in with my game idea and started using Godot because that interested me most. I did not understand how the portfolio or learning outcomes worked. I thought the challenge was just about making some documents and a devlog. So, in the first weeks, I worked without much organization.

After Frank told me I needed a Project Plan with a Gantt chart, I created one. It covered the last four working days, from Monday 21 to Thursday 24 September. For each activity, I listed the hours and what it depended on. I put documentation first and the prototype second. The order was: Analysis, then Advice and Design, then the Project Plan, followed by the map, one enemy with a vision cone, and a game over screen. Validation was the final step on Thursday.

I chose this order for a reason. Most of what I was missing was the writing, and writing does not depend on the game working. If the code failed, I would still have the documents.

## 2. How the plan worked

The documentation took much longer than I expected. The Analysis went through three versions. Frank rejected version 0.1 because it was not professional. Version 0.2 was better, but I thought it was too polished and did not sound like me. I am happy with version 0.3. After that, I wrote the Advice and the Design, and I rewrote parts of them more than once because I found things in the Design that did not match my actual code.

Because Because of this, the prototype is behind schedule. Right now, the player can move, crouch, and run, with animations in eight directions, and there is a test wall. The map is designed but not built yet, and the enemy with the vision cone is not in the game yet. I am being honest about this. It is the real result of my plan. I adjusted

ThThe biggest change was The Hunter. My first idea was to make an enemy that learns with Q-learning. When I checked how much time I had left, I realized this was not realistic. I talked to my coach, and he said it was okay to leave it out because it was a Could Have in my MoSCoW table. So now The Hunter is only designed, not built. The Design document explains how it would work and how I would measure if it improves. I think this was the right choice. It is better to deliver something smaller and honest than something big that does not work.I also changed the level map. I lost my first wireframe, so I made a new one. Now it is a maze with four guards and a back door as the exit. The Design document now matches this map.

## 4. Professional standards I used

I tried to make my documents look and read like real project documents. The Analysis is written for a fictional client, Nightfall Interactive, and the client is listed on the cover page. The requirements are in a MoSCoW table, and each one is written as a user story so that someone who does not know games can still understand it. Faruk suggested this format. The Analysis also includes a list of sources.

I divided my work into separate documents for each phase. The Advice compares four engines (Godot, Unity, GameMaker, and Pygame) and different ways to make the enemy AI, and explains why I chose Godot and GDScript. The Design includes the architecture, scene tree, flowcharts, level map, and wireframes for the screens. The Project Plan contains the Gantt chart.

I use Git for version control. My notes are in Obsidian, and the Obsidian Git plugin pushes them to GitHub. My game code is in the same repository. To be honest, most of my commits are automatic “vault backup” messages, so the history is hard for someone else to follow.

## 5. What I would do differently

I  would start the prototype earlier, even with simple placeholders, instead of waiting until the documents were finished. I would also ask for help sooner. I spent the first weeks confused about the portfolio and did not mention it. I would also write my own commit messages so my Git history shows what I did and when.idence description

**A. Why did I add this to my portfolio?**  
This shows how I organized Challenge 1. The Project Plan and Gantt chart show my plan, and this document explains how the plan worked in reality and what I changed.

**B. What did I learn while creating it?**  
I learned that a plan is more than just a table at the start. The important part is looking back and seeing where things went wrong. I also learned that documentation takes much more time than I expected, so I need to plan extra time for it.

**C. What will I do differently next time?**  
Next time, I will make a plan in the first week instead of at the end. I will build a simple version of the product early and work on the documents alongside it. I will also write clear commit messages from the start.