import dht
import machine
d = dht.DHT22(machine.Pin(4))
d.measure()
print(measure())
d.temperature()
print(temperature())# eg. 23.6 (°C)
d.humidity()
print(humidity())# eg. 41.3 (% RH)

