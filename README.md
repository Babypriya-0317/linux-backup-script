# Automated Backup System

## Description
A bash script that automatically backs up folders with 
date & time stamping, logging, and cron scheduling.

## Features
- Automatic folder backup with compression (tar.gz)
- Multiple folder backup support
- Date & time stamped backup files
- Backup size logging
- Auto delete backups older than 7 days
- Activity logging with timestamp
- Automated scheduling using cron

## Technologies Used
- Linux (Ubuntu)
- Bash Scripting
- rsync
- cron

## Project Structure
backup_project/
├── backup.sh        # Main backup script
├── README.md        # Project documentation
├── source_folder/   # Folder to backup
├── backups/         # Backup destination
└── logs/            # Log files

## How to Run
# Clone the repo
git clone https://github.com/Babypriya-0317/linux-backup-script
# Give permission
chmod +x backup.sh

# Run the script
./backup.sh

## Automate With Cron
# Open crontab
crontab -e
# Add this line to run every day at midnight
0 0 * * * /home/username/backup_project/backup.sh
