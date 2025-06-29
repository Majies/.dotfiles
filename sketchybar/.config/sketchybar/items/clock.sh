#!/bin/bash

clock=(
    icon=􀉉
    icon.color=$PEACH_SOLID
    icon.font=$FONT_BOLD_LG
    icon.padding_right=10

    label.font=$FONT_BOLD_SM
    label.color=$SURFACE2_SOLID

    background.padding_left=20

    update_freq=10 
    script="$PLUGIN_DIR/clock.sh"
)

sketchybar --add item clock right    \
           --set clock "${clock[@]}" \

