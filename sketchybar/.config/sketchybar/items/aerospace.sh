#!/bin/bash 

sketchybar --add event aerospace_workspace_change

space=(
        background.color=$LAVENDER_SOLID
        background.padding_left=5
        background.padding_right=5
        background.height=24
        icon.color=$TEXT_SOLID
        icon.font=$FONT_BOLD_MD
        label="|"
        background.drawing=off
        label.padding_right=4
        label.padding_left=10
        label.font=$FONT_BOLD_SM
        label.color=$SURFACE0_SOLID
)

for sid in $(aerospace list-workspaces --all); do
    sketchybar --add item space.$sid left \
        --subscribe space.$sid aerospace_workspace_change \
        --set space.$sid \
        "${space[@]}" \
        icon="$sid" \
        click_script="aerospace workspace $sid" \
        script="$PLUGIN_DIR/aerospace.sh $sid"
done
