**Sep 28**

- The Challenge starts today! My first goal was just to choose a project. I ended up picking a **Greenhouse management system**, but with a focus on security: making a login and database vulnerable to a **SQL Injection** attack. I also made up a fictional client to have a clear problem to solve.

**Sep 29 - Sep 30**

- Decided on the platform type: it’s going to be a **mobile-friendly website** instead of a downloadable app. The big issue here is the security flaw: the login screen is vulnerable, meaning **anyone can hack into it just by typing text-based tricks into the boxes**.

**Sep 1 - Oct 4**

- Working on the first drafts for the Analysis phase. I had to cut some features for now: keeping track of the ideal values for each specific plant type is out of scope for **v0.1**.

**Oct 5**

- Got some feedback from Frank about my Analysis document.

**Oct 5 - Oct 6**

- Put together my first hardware list: planning to use a Pico W, an SHT31 sensor, and some capacitive moisture sensors.

**Oct 6 - Oct 13**

- Took a break. Zero progress this week, I had some family problems.

**Oct 13**

- Went to Fontys and got some gear: a Pi Zero W, water level sensors (which turned out to be useless for me), and a DHT11. I swapped those for a better **DHT22** and two analog **DFRobot SEN0114** sensors.
- **The issue:** The Pi can’t read analog signals. I didn't have any ADC chips handy (no ADS1115, MCP3008, or PCF8591), and my Grove Hat and Pico W were stuck in Tilburg.
- **The fix:** TQ saved the day and lent me an **ESP32**, which handles analog pins just fine.

**Oct 18**

- Time to cut down the scope again to make it manageable. No push notifications and no Netlab. The SQL injection part will just run locally on my laptop. Also, I decided to go with **MicroPython** using **Thonny** as my code editor.

**Oct 20**

- Finally got the laptop to recognize the ESP32 (running on COM6 with the CP210x chip). Trying to install MicroPython was a bit annoying at first because I accidentally selected the wrong version (M5Stack). Once I switched it to the correct **Espressif WROOM** firmware, everything clicked. Got my first script up and running!

```
import dht
import machine
import time

d = dht.DHT22(machine.Pin(5))
time.sleep(2)
d.measure()
print(d.temperature())# eg. 23.6 (°C)
print(d.humidity())# eg. 41.3 (% RH)

```
>Output: 
>MPY: soft reboot
	23.0
	72.4

**Oct 21**
- **Today, I started using VS Code with `mpremote`** instead of Thonny. **I made this decision** because I can **have everything in the same environment** (web, ESP32...), and the DHT22 is still working.
- I had a lot of problems figuring out the best way to connect everything on the breadboard because the ESP32 is too big to fit on a standard protoboard. The solution was to keep the ESP32 off the breadboard: each row on the board acts as a specific rail (e.g., Row 1 for 3V3, Row 5 for GND), while the other rows connect to the pins where data is received.

- For the **soil moisture sensor**, I realized that **the blue wire carries the signal**, not the middle one. **That was my mistake and my learning.** I also noted that **VIN provides 5V, which is why the sensor must be powered via the 3V3 pin**. After correcting the wiring, **I successfully set up a loop that reads data every second**, yielding the following calibration values: **Air: 0, Plant: 34,984, and Water: 36,889**.

	- **Learned:** Always double-check the sensor's pinout and specific wire colors instead of assuming the middle pin is the signal. Also, ensure the correct operating voltage (3V3) when VIN delivers 5V to protect the sensor logic.
	- **Next:** Integrate **WiFi connectivity** to transmit the real-time data. 