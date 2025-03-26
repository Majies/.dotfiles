#!/bin/bash

volume_slider=(
  script="$PLUGIN_DIR/volume.sh"
  updates=on
  label.drawing=off
  icon.drawing=off
  slider.highlight_color=$TEXT_SOLID
  slider.background.height=4
  slider.background.corner_radius=3
  slider.background.y_offset=-1
  slider.background.color=0x44$TEXT
  background.color=0x00000000
  slider.knob.drawing=off
  slider.width=100
)

volume_icon=(
    click_script="$PLUGIN_DIR/volume_click.sh"

    label.color=$SAPPHIRE_SOLID 
    label.font="$FONT_FACE:Bold:18.0"
    label.padding_right=10

    background.padding_left=20
)


sketchybar --add slider volume right             \
           --set volume "${volume_slider[@]}"    \
                                                 \
           --add item volume_icon right          \
           --set volume_icon "${volume_icon[@]}" \
                                                 \
           --subscribe volume volume_change      \
                              mouse.clicked      \
