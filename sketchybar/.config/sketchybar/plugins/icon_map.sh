#!/bin/bash

function icon_map() {
  case "$1" in
  "Alacritty")
    echo ""
    ;;
  "Microsoft Teams")
    echo "󰊻"
    ;;
  "Google Chrome")
    echo ""
    ;;
  "Slack")
    echo ""
    ;;
  "Microsoft Outlook")
    echo "󰇮"
    ;;
  "Discord")
    echo ""
    ;;
  "Safari")
    echo "󰀹"
    ;;
  "Notes")
    echo ""
    ;;
  "System Settings")
    echo ""
    ;;
  "Xcode")
    echo ""
    ;;
  *)
    echo ""
    ;;
  esac
}
