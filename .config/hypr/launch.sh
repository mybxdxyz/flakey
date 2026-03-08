#!/usr/bin/env bash
DIR="$HOME/Pictures/wal"
IMG=$(find "$DIR" -type f | shuf -n 1)
awww img "$IMG" --transition-type random
wallust run "$IMG"
pkill waybar
waybar &
swaync-client -rs
