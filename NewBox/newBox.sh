#!/bin/bash
TMP_LOC="./templates/Notes_Template.md" #customise this to the location of your template
ROOM="$(echo $1 | tr -d ' ' | tr '[:upper:]' '[:lower:]')"
mkdir $ROOM
URL='https://tryhackme.com/room/'"$ROOM"
curl "https://tryhackme.com/api/room/details?codes="$ROOM -o ./$ROOM/$ROOM.json
RM_IMG="$(cat ./$ROOM/$ROOM.json | jq -r '.'$ROOM'.image')"
RM_DIFF="$(cat ./$ROOM/$ROOM.json | jq -r '.'$ROOM'.difficulty')"
RM_TYPE="$(cat ./$ROOM/$ROOM.json | jq -r '.'$ROOM'.type')"
RM_IMG_HTML="<img src='"$RM_IMG"' height="100" width="100">"
if [ "$RM_DIFF" == "info" ]; then RM_DIFF_BADGE="![](https://img.shields.io/badge/Difficulty-Info-blue?style=for-the-badge&logo=tryhackme)"
    elif [ "$RM_DIFF" == "easy" ]; then RM_DIFF_BADGE="![](https://img.shields.io/badge/Difficulty-Easy-green?style=for-the-badge&logo=tryhackme)"
    elif [ "$RM_DIFF" == "medium" ]; then RM_DIFF_BADGE="![](https://img.shields.io/badge/Difficulty-Medium-orange?style=for-the-badge&logo=tryhackme)"
    elif [ "$RM_DIFF" == "hard" ]; then RM_DIFF_BADGE="![](https://img.shields.io/badge/Difficulty-Hard-critical?style=for-the-badge&logo=tryhackme)"
    elif [ "$RM_DIFF" == "insane" ]; then RM_DIFF_BADGE="![](https://img.shields.io/badge/Difficulty-Insane-blueviolet?style=for-the-badge&logo=tryhackme)"
fi
if [ "$RM_TYPE" == "challenge" ]; then RM_TYPE_BADGE="![](https://img.shields.io/badge/Box_Type-%F0%9F%9A%A9Capture_The_Flag%F0%9F%9A%A9-blue?style=for-the-badge&logo=tryhackme)"
    elif [ "$RM_TYPE" == "walkthrough" ]; then RM_TYPE_BADGE="![](https://img.shields.io/badge/Box_Type-%F0%9F%9A%B6Walk--Through%F0%9F%9A%B6-success?style=for-the-badge&logo=tryhackme)"
fi
cp $TMP_LOC ./"$ROOM"/"$ROOM"_notes.md
cd "$ROOM"
sed "s/\[#MachineName]/$1/" "$ROOM"_notes.md -i
sed "s@\[#BoxLink]@$URL@" "$ROOM"_notes.md -i
sed "s@\[#BoxLogo]@$RM_IMG_HTML@" "$ROOM"_notes.md -i
sed "s@\[#DifficultyBadge]@$RM_DIFF_BADGE@" "$ROOM"_notes.md -i
sed "s@\[#RoomTypeBadge]@$RM_TYPE_BADGE@" "$ROOM"_notes.md -i
