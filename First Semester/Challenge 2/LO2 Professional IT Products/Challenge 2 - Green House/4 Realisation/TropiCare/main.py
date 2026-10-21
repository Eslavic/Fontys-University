import dht
import machine
import time
from machine import ADC

moisture = ADC(34, atten=ADC.ATTN_11DB)  # Create an ADC object on pin 0

d = dht.DHT22(machine.Pin(5))
time.sleep(2)
d.measure()
print(d.temperature())# eg. 23.6 (°C)
print(d.humidity())# eg. 41.3 (% RH)bb

moisture_value = moisture.read_u16()  # Read the analog value from the moisture sensor
print(moisture_value)  # Print the moisture value