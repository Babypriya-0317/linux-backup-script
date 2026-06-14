#!/bin/bash

# ---- CONFIGURATION ----
SOURCE="/home/babypriyaa/backup_project/source_folder"
BACKUP_DIR="/home/babypriyaa/backup_project/backups"
LOG_FILE="/home/babypriyaa/backup_project/logs/backup.log"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_NAME="backup_$DATE"

# ---- START BACKUP ----
echo "[$DATE] Backup started..." >> $LOG_FILE

# Create backup
rsync -av --progress $SOURCE $BACKUP_DIR/$BACKUP_NAME >> $LOG_FILE 2>&1

# ---- CHECK IF BACKUP SUCCESS ----
if [ $? -eq 0 ]; then
    echo "[$DATE] Backup SUCCESS - Saved as $BACKUP_NAME" >> $LOG_FILE
else
    echo "[$DATE] Backup FAILED" >> $LOG_FILE
fi

echo "-------------------------------" >> $LOG_FILE
