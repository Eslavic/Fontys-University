
 
 - **Client:** VerdeTrópico B.V
 - **Made by:** David Eslava, Fontys ICT Student
 - **Version 0.1 - 28 September 2026**

## 1. Introduction
### 1.1 Purpose of this document
This document covers the analysis phase of **TropiCare**. It describes an web with push notifications that measures **soil moisture**, **ambient humidity to help prevent mold**, **watering needs**, and surrounding **temperature**. Here, I explain the client's problem, the project scope, and the product requirements. Details about how the app was built are not included here; you can find technical information in the [[Design]] document and planning details in the [[Project Plan]].
### 1.2 The client
**VerdeTrópico B.V.** is a small **tropical plant nursery** and online shop in the Netherlands. The company brings in rare and valuable tropical seeds and cuttings, like special types of *Monstera, Philodendron, Anthurium, and Passiflora ligularis.* They grow these plants locally and sell them to plant collectors throughout Europe.
### 1.3 The product in one paragraph
**TropiCare** app that **measures soil moisture, environmental humidity** (to avoid mold), and **watering needs** while **tracking ambient temperature**. You just have to set up the hardware, choose your plant type and fully customize every value. **You will receive phone notifications** if, for example, "the temperature surpasses 30°C or the humidity drops below X%."

---
## 2. Problem definition
### 2.1 The client's problem
Germinating tropical plants in the Netherlands is highly challenging due to the climate, especially without precise control over humidity, light, and temperature. 

One of the biggest causes of failure has been the lack of control over watering and humidity. Often, the plants are watered too much or too little. Additionally, high humidity occasionally led to mold growth, which killed the seeds.  Finding the perfect balance of water, humidity, and temperature **without any tools** often **leads** to a lot of dead seeds.

Growing tropical plants in the Netherlands is difficult because of the climate. Without careful control of humidity, light, and temperature, it becomes even harder.

A major reason for failure is not being able to control watering and humidity. Plants often get too much or too little water. High humidity sometimes causes mold, which kills the seeds. Without any tools to help, it is hard to find the right balance, and many seeds die.

-  **Why is this problem important to them?**
	- **VerdeTrópico B.V.** needs to solve these environmental problems quickly for three important business reasons:
	  - **High Financial Losses from Dead Seeds:** Rare tropical seeds cost a lot and are hard to find. Each seed lost to root rot from overwatering or to mold hurts their profits and lowers their stock.
	  - **Lack of 24/7 Expert Staff:** As a small but growing business, they cannot hire a full-time team to always check soil moisture and temperature. They need a way for the environment to warn them before problems occur.
	  - **The Dutch Winter Halts Scalability:** Cold weather in the Dutch autumn and winter stops their plants from growing. Without accurate climate monitoring, their business cannot move forward for half the year.

### 2.2 The project challenge
The client needs a web app to help control all the factors that affect the germination and growth of tropical plants, such as soil moisture, environmental humidity, ambient temperature, and watering needs.

**The first version, 0.1, will measure soil moisture, environmental humidity to help prevent mold, watering needs, and track ambient temperature**. You only need to set up the hardware, **and  customize each value as needed. **All sensor data will be sent to a website with login and a database**. **You will get phone notifications** if any value falls below or goes above your set parameters.

### 2.3 Risks
TropiCare stores all sensor data and alarm settings on a website with a login and a database. If someone without permission gets access, they could change the alarm ranges so the notifications never go off. The plants would then die without anyone noticing, which is exactly the problem TropiCare is meant to solve. An attacker could also see or steal data about VerdeTrópico and its customers.

One of the most common ways to break into a web login is **injection** (for example SQL injection), which is part of the **OWASP Top 10**, the standard list of the most important web security risks. Because of this, the login and database of TropiCare must be protected against these common attacks.

---
## 3. Scope
### 3.1 In scope
- A web app with login and a database
- The app will measure the following parameters:
  - Soil Moisture
  - Enviromental humidity
  - Watering needs.
  - Ambient temperature
- Clients can adjust each value as needed.
- All sensor data will be sent to a secure website with login access and a database.
- Clients will receive phone notifications.
- The login and database are protected against common web attacks from the OWASP Top 10, such as SQL injection.
- The security of the website is tested in an isolated test network (Netlab) before it is delivered to the client.
### 3.2 Out of scope
-  **The app will not come preloaded** with the ideal values for each tropical plant to save time and effort.
- The version 0.1 will not control and change the values automatically.
- Security tests will not be done on the client's real system or live data, only in the isolated test network.













## Just some extra test dont count is just the history of the client and some extra stuff ( i am gonna deleted it)
Looking ahead, light will also become a major issue because the Netherlands gets quite dark, and these plants require a lot of sunlight. The  app will eventually automate and control all of these factors. However, to start,  the best approach is to "measure and alert," implementing automated control later on. Since I have my own garden and plants, I can use my setup as a testing ground while framing the project around a fictional company or client.

- Company: **VerdeTrópico B.V.**
- **Company Type:** A **boutique tropical plant nursery and e-commerce business** based in the Netherlands. They specialize in importing rare, high-value tropical seeds and cuttings (such as exotic _Monstera_, _Philodendron_, and _Anthurium_ varieties, _Passiflora ligularis_, etc.), germinating them locally, and selling them to premium plant collectors across Europe.
- **Why do they care about this problem?**  
    **VerdeTrópico B.V.** urgently needs to solve these environmental challenges for three critical business reasons:
    - **High Financial Losses from Dead Seeds:** Rare tropical seeds are extremely expensive and difficult to source. Every seed lost to root rot (overwatering) or mold growth directly damages their profit margins and reduces available stock.
    - **Lack of 24/7 Expert Staff:** As a growing boutique business, they cannot afford a full-time horticultural team to constantly check soil moisture and room temperature. They need the environment itself to "alert" them before a disaster happens.
    - **The Dutch Winter Halts Scalability:** The severe lack of natural sunlight and cold temperatures during the Dutch autumn and winter completely paralyze their growth cycle. Without precise climate monitoring, their business stalls for six months of the year.
### 2.2 The project challenge

**The Project Idea**  
	The goal is to create an app that **measures soil moisture, environmental humidity** (to avoid mold), and **watering needs** while **tracking ambient temperature**. **The app comes preloaded** with the ideal values for each tropical plant to save time and effort. You just have to set up the hardware, choose your plant type, **or fully customize every value**. **You will receive phone notifications** if, for example, "the temperature surpasses 30°C or the humidity drops below X%."

Light **is not an issue during the germination stage**. However, as the tropical plants grow, they will need a larger and higher-quality light source, **so this feature is out of scope for version 0.1**.

---