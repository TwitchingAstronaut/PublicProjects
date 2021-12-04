#!/bin/bash

#global Vars
RED='\033[1;4;31m'
NC='\033[0m' # No Color


GET_RM_INFO()
{
    ROOM="$(echo $1 | tr -d ' ' | tr '[:upper:]' '[:lower:]')"
    curl "https://tryhackme.com/api/room/details?codes="$ROOM -o ./$ROOM.json
    RM_EXIST="$(cat ./$ROOM.json | jq -r '.'$ROOM'.success')"
}

RM_CHECK()
{
    if [ "$RM_EXIST" == "true" ]; then echo "room found"; NOTE_MAKER
        elif [ "$RM_EXIST" == "false" ]; then echo "room NOT found"; rm ./$ROOM.json
        echo "Please enter the correct room name:"; read NEW_RM_NAME; GET_RM_INFO $NEW_RM_NAME
    fi
}

USAGE_INFO()
{    
    echo "Usage info:"
    echo "-h shows this help file"
    echo -e "$0 <room name>/<\"Room Name\">"
    echo -e "<room name> = the last part of the TryHackMe url (https://tryhackme.com/room/${RED}road${NC})"
}

NOTE_MAKER()
{    
    mkdir $ROOM
    mkdir $ROOM/assets
    mv $ROOM.json ./$ROOM/$ROOM.json
    RM_IMG="$(cat ./$ROOM/$ROOM.json | jq -r '.'$ROOM'.image')"
    RM_DIFF="$(cat ./$ROOM/$ROOM.json | jq -r '.'$ROOM'.difficulty')"
    RM_TYPE="$(cat ./$ROOM/$ROOM.json | jq -r '.'$ROOM'.type')"
    RM_DESC="$(cat ./$ROOM/$ROOM.json | jq -r '.'$ROOM'.description')"
    curl $RM_IMG -o ./$ROOM/assets/$ROOM.png
    RM_IMG_HTML="<img src='"./assets/$ROOM.png"' height="100" width="100">"
    cp ~/PenTesting/Templates/Notes_Template.md ./"$ROOM"/"$ROOM"_notes.md
    cd "$ROOM"
    if [ "$RM_DIFF" == "info" ]; then cp ../../Templates/Difficulty-Info-blue.png ./assets/Difficulty-Info-blue.png; RM_DIFF_BADGE="![](./assets/Difficulty-Info-blue.png)"
        elif [ "$RM_DIFF" == "easy" ]; then cp ../../Templates/Difficulty-Easy-green.png ./assets/Difficulty-Easy-green.png; RM_DIFF_BADGE="![](./assets/Difficulty-Easy-green.png)"
        elif [ "$RM_DIFF" == "medium" ]; then cp ../../Templates/Difficulty-Medium-orange.png ./assets/Difficulty-Medium-orange.png; RM_DIFF_BADGE="![](./assets/Difficulty-Medium-orange.png)"
        elif [ "$RM_DIFF" == "hard" ]; then cp ../../Templates/Difficulty-Hard-red.png ./assets/Difficulty-Hard-red.png; RM_DIFF_BADGE="![](./assets/Difficulty-Hard-red.png)"
        elif [ "$RM_DIFF" == "insane" ]; then cp ../../Templates/Difficulty-Insane-purple.png ./assets/Difficulty-Insane-purple.png; RM_DIFF_BADGE="![](./assets/Difficulty-Insane-purple.png)"
    fi
    if [ "$RM_TYPE" == "challenge" ]; then cp ../../Templates/Box_Type-Capture_The_Flag-blue.png ./assets/Box_Type-Capture_The_Flag-blue.png; RM_TYPE_BADGE="![](./assets/Box_Type-Capture_The_Flag-blue.png)"
        elif [ "$RM_TYPE" == "walkthrough" ]; then cp ../../Templates/Box_Type-Walk--Through-success.png ./assets/Box_Type-Walk--Through-success.png; RM_TYPE_BADGE="![](./assets/Box_Type-Walk--Through-success.png)"
    fi
    sed "s/\[#MachineName]/$1/" "$ROOM"_notes.md -i
    sed "s@\[#BoxLink]@https://tryhackme.com/room/"$ROOM"@" "$ROOM"_notes.md -i
    sed "s@\[#BoxLogo]@$RM_IMG_HTML@" "$ROOM"_notes.md -i
    sed "s@\[#DifficultyBadge]@$RM_DIFF_BADGE@" "$ROOM"_notes.md -i
    sed "s@\[#RoomTypeBadge]@$RM_TYPE_BADGE@" "$ROOM"_notes.md -i
    sed "s@\[#Description]@$RM_DESC@" "$ROOM"_notes.md -i
}

if [[ $1 == "-h" || $1 == "" ]]; then USAGE_INFO
    elif [[ $1 != "-h" ]]; then GET_RM_INFO $1; RM_CHECK
fi
