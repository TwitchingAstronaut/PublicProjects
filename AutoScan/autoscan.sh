#!/bin/bash
# ./autoscan.sh <target ip>
workDir= pwd | sed 's:.*/::'
echo $workDir
mkdir ./scans
#nmap
nmap -vv -sV -A -oA ./scans/$workDir $1