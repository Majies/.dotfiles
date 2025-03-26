#!/bin/bash

apple_logo=(
    icon=
    icon.color=$PEACH_SOLID
    icon.font="$FONT_BOLD_XL"
    icon.padding_right=10
)

sketchybar --add item apple.logo left          \
           --set apple.logo "${apple_logo[@]}" \
