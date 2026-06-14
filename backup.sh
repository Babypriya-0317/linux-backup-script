#!/bin/bash

# ---- CONFIGURATION ----
SOURCE_FOLDERS=("/home/babypriyaa/backup_project/source_folder")
BACKUP_DIR="/home/babypriyaa/backup_project/backups"
LOG_FILE="/home/babypriyaa/backup_project/logs/backup.log"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
KEEP_DAYS=7

# ---- START BACKUP ----
echo "===============================" >> $LOG_FILE
echo "[$DATE] Backup Started" >> $LOG_FILE

# ---- BACKUP MULTIPLE FOLDERS ----
for SOURCE in "${SOURCE_FOLDERS[@]}"; do
    FOLDER_NAME=$(basename $SOURCE)
    BACKUP_NAME="$BACKUP_DIR/${FOLDER_NAME}_backup_$DATE.tar.gz"

    # Create compressed backup
    tar -czf $BACKUP_NAME $SOURCE 2>> $LOG_FILE

    # Check if backup success
    if [ $? -eq 0 ]; then
        SIZE=$(du -sh $BACKUP_NAME | cut -f1)
        echo "[$DATE] SUCCESS - $FOLDER_NAME backed up" >> $LOG_FILE
        echo "[$DATE] Backup Size: $SIZE" >> $LOG_FILE
        echo "[$DATE] Saved as: $BACKUP_NAME" >> $LOG_FILE
    else
        echo "[$DATE] FAILED - $FOLDER_NAME backup failed!" >> $LOG_FILE
    fi
done

# ---- AUTO DELETE OLD BACKUPS ----
echo "[$DATE] Cleaning backups older than $KEEP_DAYS days..." >> $LOG_FILE
find $BACKUP_DIR -name "*.tar.gz" -mtime +$KEEP_DAYS -delete
echo "[$DATE] Cleanup Complete" >> $LOG_FILE

echo "[$DATE] All Backups Finished" >> $LOG_FILE
echo "===============================" >> $LOG_FILE
