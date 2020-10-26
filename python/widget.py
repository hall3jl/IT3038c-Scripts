import json
import requests

r = requests.get("http://localhost:3000")
data=r.json()
for i in data:
    print("%s is %s." % (i["name"], i["color"]))