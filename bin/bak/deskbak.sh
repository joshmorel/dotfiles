#!/bin/bash

EXCLUDE_FILE=$(dirname ${BASH_SOURCE})/deskbak-exclude.txt
MOUNT_POINT="/mnt/"
BACKUP_DEV="/dev/sda5"
BACKUP_DIR="/mnt/bak/"

mount $BACKUP_DEV $MOUNT_POINT

rsync -aHAXvP --delete --exclude-from=$EXCLUDE_FILE /* $BACKUP_DIR

umount $MOUNT_POINT
