#!/bin/bash

clock=(
    icon=􀉉
    icon.color=$RED_SOLID 
    icon.font=$FONT_BOLD_LG
    icon.padding_right=10

    label.font=$FONT_BOLD_SM
    label.color=$TEXT_SOLID

    background.padding_left=20

    update_freq=10 
    script="$PLUGIN_DIR/clock.sh"
)

sketchybar --add item clock right    \
           --set clock "${clock[@]}" \

