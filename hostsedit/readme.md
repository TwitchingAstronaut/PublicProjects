# Hosts Edit

Editing the /etc/hosts file, useful for CTF's

# Usage
-h or no flag shows this help file <br>
```./hostsedit.sh``` -h or ```./hostsedit.sh``` <br>
-a Appends an entry to the Hosts file <br>
```./hostsedit.sh -a 127.0.0.1 localhost.local``` <br>
-d Removes an entry from the Hosts file  (only matches on IP address)<br>
```./hostsedit.sh -d 127.0.0.1 localhost.local``` <br>
-p Prints the Hosts file<br>
```./hostsedit.sh -p```

# What it Does

See above

# TODO
- [ ] More Testing
- [ ] actually edit /etc/hosts
- [ ] find an alternative to sudo (not implemented yet, still testing)