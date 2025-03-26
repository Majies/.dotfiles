#!/bin/bash

music=(
    script="$PLUGIN_DIR/music.sh"

    icon=􀑪
    icon.color=$BLUE_SOLID
    icon.font=$FONT_BOLD_LG
    icon.padding_right=10

    label="Loading…"
    label.font=$FONT_BOLD_SM
    label.color=$TEXT_SOLID
    label.max_chars=13
    label.width=100
    label.align=center

    background.padding_left=20

    --subscribe music media_change system_woke
)

sketchybar \
  --add item music right \
  --set music "${music[@]}"
