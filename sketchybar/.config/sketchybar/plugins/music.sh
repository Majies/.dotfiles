#!/bin/bash

CURRENT_SONG="$(echo $INFO | jq -r '.title')"

if [[! -z $CURRENT_SONG ]]; then
    sketchybar --set $NAME label="Not playing" drawing=on
fi

sketchybar --set $NAME label="$CURRENT_SONG" drawing=on
