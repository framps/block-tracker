#!/usr/bin/env python3


# Merge index_template.html and body.md to index.html
import sys
import requests

URL = "https://api.github.com/markdown/raw"
HEADERS={"Content-Type":"text/x-markdown"}
DATA=None

with open("body.md") as f:
    DATA = f.read()

r = requests.post(URL, headers=HEADERS, data=DATA)
if r.status_code != 200:
    print("Something went wrong!")
    print("Status-Code: {}".format(r.status_code))
    print("Response: {}".format(r.text))
    sys.exit()

body = r.text

with open("index_template.html") as f:
    index_template = f.read()

index = index_template.replace("{% content %}", body)

with open("index.html", "w") as f:
    f.write(index)
