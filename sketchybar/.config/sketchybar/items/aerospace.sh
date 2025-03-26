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

# sketchybar --add event aerospace_workspace_change
#
# # This only works for single monitor configs!
# for sid in $(aerospace list-workspaces --monitor 1); do
#   #for sid in "${SPACE_IDS[@]}"; do
#   sketchybar --add item space.$sid left \
#     --subscribe space.$sid aerospace_workspace_change \
#     --set space.$sid \
#     drawing=off \
#     background.color=0x44ffffff \
#     background.corner_radius=5 \
#     background.drawing=on \
#     background.border_color=0xAAFFFFFF \
#     background.border_width=0 \
#     background.height=25 \
#     icon="$sid" \
#     icon.padding_left=10 \
#     icon.shadow.distance=4 \
#     icon.shadow.color=0xA0000000 \
#     label.padding_right=20 \
#     label.padding_left=0 \
#     label.y_offset=-1 \
#     label.shadow.drawing=off \
#     label.shadow.color=0xA0000000 \
#     label.shadow.distance=4 \
#     click_script="aerospace workspace $sid" \
#     script="$CONFIG_DIR/plugins/aerospace.sh $sid"
# done
#
# # Load Icons on startup
# for sid in $(aerospace list-workspaces --monitor 1 --empty no); do
#   apps=$(aerospace list-windows --workspace "$sid" | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')
#
#   sketchybar --set space.$sid drawing=on
#
#   icon_strip=" "
#   if [ "${apps}" != "" ]; then
#     while read -r app; do
#       icon_strip+=" $($CONFIG_DIR/plugins/icon_map.sh "$app")"
#     done <<<"${apps}"
#   else
#     icon_strip=""
#   fi
#   sketchybar --set space.$sid label="$icon_strip"
# done
#
# sketchybar --add item space_separator left \
#   --set space_separator icon="💩" \
#   icon.padding_left=4 \
#   label.drawing=off \
#   background.drawing=off \
#   script="$PLUGIN_DIR/space_windows.sh" \
#   --subscribe space_separator aerospace_workspace_change
