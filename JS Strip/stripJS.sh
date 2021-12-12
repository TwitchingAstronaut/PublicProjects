#!/bin/bash

# bash script to strip Comments, Urls, API Endpoints, Params/words from .js files based on twitter comment 
# https://twitter.com/intigriti/status/1469648166303809536/photo/1

cat $1 | grep '//' > $1.comments.txt
cat $1 | grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*" > $1.urls.txt
cat $1 | grep '/api' > $1.api.txt
cat $1 | grep -Eo '[a-z]{3,100}' | sort | uniq > $1.params.txt