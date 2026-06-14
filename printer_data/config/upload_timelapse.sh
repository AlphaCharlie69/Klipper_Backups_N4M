#!/bin/bash

# Explicitly load your Google Rclone authentication keys
export RCLONE_CONFIG=/home/mks/.config/rclone/rclone.conf

# Find the newest completed video file inside your timelapse folder
LATEST_VIDEO=$(ls -t /home/mks/printer_data/timelapse/*.mp4 | head -n 1)

# If a video is found, move it straight to your Google Drive folder
if [ ! -z "$LATEST_VIDEO" ]; then
    /usr/bin/rclone move "$LATEST_VIDEO" gdrive:3D_Prints/ --log-file=/home/mks/printer_data/logs/rclone.log -v
fi