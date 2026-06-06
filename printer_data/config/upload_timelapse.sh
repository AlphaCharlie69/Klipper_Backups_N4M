#!/bin/bash

# Updated directory matching OpenNept4une's installation path
LOCAL_DIR="/home/mks/printer_data/timelapse/"

# Use rclone to safely copy files over to a '3D_Prints_Timelapse' folder on Google Drive
rclone copy "$LOCAL_DIR" gdrive:3D_Prints_Timelapse --include "*.mp4"

echo "OpenNept4une Video Sync: Upload to Google Drive complete."