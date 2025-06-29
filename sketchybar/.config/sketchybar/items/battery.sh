#!/bin/bash

battery=(
    icon=􀉉
    icon.color=$PEACH_SOLID
    icon.font=$FONT_BOLD_LG
    icon.padding_right=10

    label.font=$FONT_BOLD_SM
    label.color=$SURFACE0_SOLID

    background.padding_left=20

    update_freq=20 
    script="$PLUGIN_DIR/battery.sh"
)
sketchybar --add item battery right      \
           --set battery "${battery[@]}" \

