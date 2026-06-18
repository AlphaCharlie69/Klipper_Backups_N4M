#!/bin/bash

# Force the system to find your Google Rclone credentials
export RCLONE_CONFIG=/home/mks/.config/rclone/rclone.conf

# Ensure the logs directory exists so the log file can be generated
mkdir -p /home/mks/printer_data/logs

# Find the newest completed video file inside your timelapse folder
LATEST_VIDEO=$(ls -t /home/mks/printer_data/timelapse/*.mp4 | head -n 1)

# If a video is found, move it straight to your Google Drive folder with progress logging
if [ ! -z "$LATEST_VIDEO" ]; then
    /usr/bin/rclone move "$LATEST_VIDEO" gdrive:3D_Prints/ --log-file=/home/mks/printer_data/logs/rclone.log -v --progress
fi