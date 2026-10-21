import dht
import machine
import time
from machine import ADC

d = dht.DHT22(machine.Pin(5))
moisture = ADC(34, atten=ADC.ATTN_11DB)

while True:
    time.sleep(2)
    d.measure()
    print(d.temperature())
    print(d.humidity()) 
    moisture_value = moisture.read_u16()
    print(moisture_value) 
    time.sleep(2)