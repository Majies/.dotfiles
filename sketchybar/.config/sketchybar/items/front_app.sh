#!/bin/bash

front_app=(
    icon.color=$TEXT_SOLID
    icon.font="$FONT_FACE:Bold:18.0"
    label.color=$OVERLAY2_SOLID
    label.font="$FONT_FACE:Bold:14.0"
    label.padding_left=5
    script="$PLUGIN_DIR/front_app.sh"
)

sketchybar --add item front_app center       \
  --set front_app "${front_app[@]}"        \
  --subscribe front_app front_app_switched \

