import json
import requests

print('Please enter your zip code:')
zip = input()

r = requests.get("http://api.openweathermap.org/data/2.5/weather?zip=%s,us&appid=53e1bc5dfd41a0e45fb214c821a6f602" % zip)
data=r.json()
print(data['weather'][0]['description'])