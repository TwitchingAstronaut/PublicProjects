# NewBox.sh

Bash script for creating a directory structure and Notes File for CTF Boxes (Currently only [TryHackMe](https://tryhackme.com/))

## Usage
./newBox.sh "Box Name"  ```./newBox.sh "Advent of Cyber 3"``` <br>
./newBox.sh Roomname    ```./newBox.sh road```

## What it Does

./newbox.sh < room code >
1. Creates a new directory with lowercase and spaces removed.
2. Curls the TryhackMe API and downloads the json for the room & saves it with name "room".json.
3. Extracts the: 
    - Room Image URL.
    - Room Type.
    - Room Dificulty.
    - Room Description.
    - Room Tags.

4. Selects the correct Badges based on the json room data.
5. Copies notes_template.md to the "Room" directory and renames it to "room"_Notes.md
6. Replaces the Tags in the Template file with the data from step 3.

## TODO
 [see TODO file](todo)
## Acknowledgments 

- [TryHackMe](https://tryhackme.com/)
- [Google](http://www.google.com)
- [sheilds.io](http://www.shields.io)
