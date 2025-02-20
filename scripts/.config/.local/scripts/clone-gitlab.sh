#!/usr/bin/env bash

if [ -z "$1" ]; then
  echo "Usage: $0 <GitLab Repo URL>"
  exit 1
fi

GIT_URL="$1.git"

cd ~/dev

git clone "$GIT_URL"

echo "Repository cloned successfully into ~/dev"
