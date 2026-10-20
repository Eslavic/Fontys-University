import dht
import machine
import time

d = dht.DHT22(machine.Pin(5))
time.sleep(2)
d.measure()
print(d.temperature())# eg. 23.6 (°C)
print(d.humidity())# eg. 41.3 (% RH)