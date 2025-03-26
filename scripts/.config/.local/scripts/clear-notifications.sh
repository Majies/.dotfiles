#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Clear Notifications
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.description  Clears macos native notifications
# @raycast.author matt_law
# @raycast.authorURL https://raycast.com/matt_law
X_OFFSET=357

WIDTH=$(system_profiler SPDisplaysDataType | grep 'UI Looks like' | awk '{print $4}')
NEW_X=$((WIDTH - X_OFFSET))

cliclick -r m:$NEW_X,23 c:.
