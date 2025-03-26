#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"

if [ $SENDER = "aerospace_workspace_change" ]; then
  if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME icon.color=$PEACH_SOLID 
  else
    sketchybar --set $NAME icon.color=$SURFACE2_SOLID 
  fi
else
  CURRENT_WORKSPACE=$(aerospace list-workspaces --focused)
  if [ "$1" = "$CURRENT_WORKSPACE" ]; then
    sketchybar --set $NAME icon.color=$PEACH_SOLID 
  else
    sketchybar --set $NAME icon.color=$SURFACE2_SOLID 
  fi
fi
