#!/bin/bash

EXCLUDE_FILE=$(dirname ${BASH_SOURCE})/deskbak-exclude.txt
MOUNT_POINT="/mnt/"
LOG_FILE="/mnt/bak.log"
BACKUP_DEV="/dev/sda5"
BACKUP_DIR="/mnt/bak/"

mount $BACKUP_DEV $MOUNT_POINT

rsync -aHAXvP --delete --exclude-from=$EXCLUDE_FILE /* $BACKUP_DIR

echo $(date +"%Y-%m-%d %H:%M") >> $LOG_FILE

umount $MOUNT_POINT
