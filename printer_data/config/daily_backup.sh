#!/bin/bash

# Define directories for your Neptune 4 Max OpenNept4une profiles
CONFIG_DIR="/home/mks/printer_data/config"
LAST_RUN_LOG="$CONFIG_DIR/.last_backup_date"

TODAY=$(date +%Y-%m-%d)
LAST_RUN=""

# Check if the timestamp tracking file exists
if [ -f "$LAST_RUN_LOG" ]; then
    LAST_RUN=$(cat "$LAST_RUN_LOG")
fi

# If the logged date matches today, exit cleanly without touching the cloud
if [ "$LAST_RUN" = "$TODAY" ]; then
    echo "OpenNept4une Backup: Already pushed to cloud today ($TODAY). Skipping."
    exit 0
fi

echo "OpenNept4une Backup: First boot of the day detected. Updating cloud files..."

# Jump directly into the repository folder so the script finds its .git files
cd /home/mks/klipper-backup/

# Trigger your official klipper-backup script locally
./script.sh

# If the script runs successfully, log today's date
if [ $? -eq 0 ]; then
    echo "$TODAY" > "$LAST_RUN_LOG"
    echo "OpenNept4une Backup: Dynamic update complete. Timestamp logged."
else
    echo "OpenNept4une Backup: Cloud push failed. Will retry next boot."
fi