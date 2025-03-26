#!/bin/bash

source "$HOME/.config/sketchybar/plugins/icon_map.sh"

if [ "$SENDER" = "front_app_switched" ]; then
  icon_value=$(icon_map "$INFO")
  sketchybar --set "$NAME" label=$INFO icon=$icon_value
fi
