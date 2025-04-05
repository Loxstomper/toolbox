#!/bin/bash

# Load config if it exists
CONFIG_FILE="$HOME/.config/tabgroup/config"

# Set defaults
sleep_duration=2
tabgroup_dir="$HOME/.tabgroup"

if [[ -f "$CONFIG_FILE" ]]; then
  # Source config (quotes preserved to allow paths with spaces)
  source "$CONFIG_FILE"
fi

# === Arguments ===
GROUP_NAME="$1"
shift

if [[ -z "$GROUP_NAME" ]]; then
  echo "Usage: $0 <tabgroup-name> [args...]"
  exit 1
fi

URLS_FILE="$tabgroup_dir/$GROUP_NAME"

if [[ ! -f "$URLS_FILE" ]]; then
  echo "Tab group '$GROUP_NAME' not found at $URLS_FILE"
  exit 1
fi

args=("$@")
mapfile -t raw_urls < "$URLS_FILE"
urls=()

# Replace placeholders {0}, {1}, etc.
for raw in "${raw_urls[@]}"; do
  url="$raw"
  for i in "${!args[@]}"; do
    placeholder="{$i}"
    replacement="${args[$i]}"
    url="${url//${placeholder}/${replacement}}"
  done
  urls+=("$url")
done

# Open first URL in new Firefox window
firefox --new-window "${urls[0]}" &

# Wait for Firefox to initialize
sleep "$sleep_duration"

# Open remaining URLs as tabs
for url in "${urls[@]:1}"; do
  firefox --new-tab "$url"
done
