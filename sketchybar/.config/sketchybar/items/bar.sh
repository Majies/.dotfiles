#!/bin/bash

bar=(
    height=38 
    color="0xAA$MANTLE"
    shadow=on
    border_color=$BASE_SOLID
    border_width=2
    blur_radius=20
    margin=18 
    corner_radius=8
    sticky=on
    y_offset=8
    padding_left=18 
    padding_right=13 
    display=main
)

bar_ultrawide=(
    height=38 
    color="0xAA$MANTLE"
    shadow=on
    border_color=$BASE_SOLID
    border_width=2
    blur_radius=20
    margin=350 
    corner_radius=8
    sticky=on
    y_offset=8
    padding_left=18 
    padding_right=13 
    display=main
)

bar_laptop=(
    height=38 
    color="0xAA$MANTLE"
    shadow=on
    border_color=$BASE_SOLID
    border_width=2
    blur_radius=20
    sticky=on
    display=main
)

sketchybar --bar "${bar[@]}"


