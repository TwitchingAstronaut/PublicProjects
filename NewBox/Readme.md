# NewBox.sh

Bash script for creating a directory structure and Notes File for CTF Boxes (Currently only [TryHackMe](https://tryhackme.com/))

## Usage
./newbox.sh "Box Name"

## Specifics

./newbox.sh 
1. Creates a new directory with lowercase and spaces removed.
2. Curls the TryhackMe API and downloads the json for the room & saves it with name RoomName.json.
3. Extracts the Room Image URL, Room Type & Room Dificulty.
4. Selects the correct Badges from the json data.
5. Copies notes_template.md
6. Replaces the Tags in the Template file with the data from step 3.

## TODO

[ ] Error Checking

[ ] Static Images for Badges.

[ ]Custom Images for badges

[ ] Usable for HackTheBox

[ ] port to Python (maybe)

[ ] ???

[ ] profit?
