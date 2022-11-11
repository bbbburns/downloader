import json

speedList = []
print("Started Reading JSON file which contains multiple JSON document")
with open('json_obj_download.txt') as f:
    for jsonObj in f:
        speedDict = json.loads(jsonObj)
        speedList.append(speedDict)

print("Printing each JSON Decoded Object")
for speed in speedList:
    print(speed["speed_download"], ',', speed["time_total"], ',', speed["size_download"], ',', speed["url_effective"])
