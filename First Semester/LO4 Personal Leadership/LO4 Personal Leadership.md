# LO4 Personal Leadership

**Student:** David Eslava  
**Programme:** Associate Degree HBO-ICT, Fontys ICT, Eindhoven  
**Learning outcome:** LO4 Personal Leadership  
**Challenge:** Challenge 1, The Witness  
**Period:** 1 to 25 September 2026

*I used AI (Claude) to help with the structure and English in this document. The feedback, the choices and the reflections are my own.*

## 1. Where I started

At the start of the semester I did not really understand how the portfolio works. I thought a challenge was some documents and a devlog. So in the first weeks I worked mostly on what I liked most, the game idea and Godot, and I did not ask many questions.

I also know I have a problem with perfectionism. I can spend hours on one small part, like the sprites of the player, while other parts are not started. This came back a lot in this challenge, and my coaches noticed it too.

## 2. Feedback I got and what I did with it

I had meetings with both of my coaches. I wrote down what they said after every meeting. The notes are in my Feedback folder.

| Date | From | What they said | What I did with it | Where you can see it |
|---|---|---|---|---|
| 11 Sep | Faruk | My analysis was already quite good. I could write about my sprite problem and how I solved it | I wrote about the Mixamo and Blender solution | Design 2.2 |
| 11 Sep | Faruk | Set time limits so perfectionism does not eat my time, and contact both coaches every week | I made a Project Plan with hours for every task. I did not always keep the limits, see section 5 | Project Plan |
| 14 Sep | Frank | The Analysis was not professional. Write it for a fictional client, remove my personal learning goals | I rewrote it for Nightfall Interactive, with the client on the cover | Analysis 0.2 and 0.3 |
| 14 Sep | Frank | Make a separate Project Plan with a Gantt chart | I made it, with activities, hours and dependencies | Project Plan |
| 14 Sep | Frank | Move the tools and technical choices to the Design | I moved them, and I wrote a separate Advice document for the comparison | Advice, Design 2 |
| 14 Sep | Frank | Start the core mechanics now, with placeholders | I started, but too late. The guard is the last part | Section 5 of this document |
| 15 Sep | Faruk | Write the MoSCoW as user stories: "As a ... I can ... so that ..." | I rewrote every requirement like this | Analysis, MoSCoW table |
| 15 Sep | Faruk | Put all the workshops in the Orientation document, short | I did this | LO1 Orientation |
| 18 Sep | Faruk | The game has to be playable, or there is no validation. Use `match` to make my code cleaner | I changed my player script from about 50 lines of `if` and `elif` to one short `match` | `player_character.gd`, Design 4.4 |

## 3. How I developed

The clearest example is the Analysis. Version 0.1 was rejected because it was not professional. Version 0.2 was better, but I felt it did not sound like me anymore. Version 0.3 is professional and still in my own words. I learned that professional does not mean complicated.

My code also changed. My first player script had a long list of `if` and `elif` for every direction and it did not work well. After Faruk's feedback I rewrote it with one `match`. It is shorter and I understand it better.

I also had to make hard choices. The Hunter, the enemy that learns, was my favourite idea. When I looked at the time I had left, I saw I could not build it. I asked my coach, and because it was a Could Have, I decided to only design it. That was difficult for me, but I think it was the right choice. For the sprites, AI could not make real top-down images, so I found my own way with Mixamo and Blender. And when I lost my first level map, I made a new one that is better for a stealth game.

## 4. My core values

%% TO DO David: check these. They come from what you told me about yourself. Change or delete anything that is not true for you. %%

**Autonomy.** I like to find my own solution. The sprite problem is a good example: nobody told me to use Mixamo and Blender, I found it myself.

**Creativity.** I like the place where code and creative work meet. That is why I chose a game with its own style, and not only a technical project.

**Honesty.** I prefer to deliver something smaller that is true, than something big that does not work. This is why The Hunter is "designed, not built", and why I say in my documents when I used AI.

## 5. How I used AI, and what I learned from it

Fontys allows AI as a tool, not to do the work for you. I used Claude to help with structure, English and checking my documents. Sometimes it made mistakes too: the Design once said I use an `enum`, but my code does not. I found this because I compared the document with my real script. Since then I check every document against my code.

On the last day I used Grammarly Humanizer on my documents. It changed my sentences, but it also broke things: it deleted tables, glued paragraphs together and removed images. I learned that I have to read everything after a tool changes it. A tool can help, but I am the one responsible for what I hand in.

## 6. What I will do differently next time

My plan for the next challenge:

- Start the prototype in the first or second week, with placeholders, and write the documents next to it.
- Put a time limit on every task and stop when the time is over, also when it is not perfect.
- Talk to my coaches every week, and ask as soon as I do not understand something, not after two weeks.
- Write my devlog every day for five minutes, in English.

## Evidence description

**A. Why did I add this to my portfolio?**  
This document shows how I used the feedback of my coaches, how my work changed because of it, and what I learned about myself during Challenge 1.

**B. What did I learn while creating it?**  
When I put all the feedback in one table, I saw that I used almost all of it. But I also saw that the most important point, "start the game early", came from both coaches and I was too late with it.

**C. What will I do differently next time?**  
I will keep this feedback table from the first week, and update it after every meeting, not at the end.
