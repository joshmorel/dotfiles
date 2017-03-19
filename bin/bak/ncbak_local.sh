#!/bin/bash

# local daily back-up script to be run as cron-job
SQL_BACKUP_FILE="/var/backups/nextcloud/nextcloud-sqlbkp.bak"
SOURCE_DIR="/var/www/nextcloud/"
BACKUP_DIR="/var/backups/nextcloud/nextcloud-dirbkp"

mysqldump --lock-tables -h localhost -u root nextcloud > $SQL_BACKUP_FILE

# rsync flags
# -A: preserve ACLs
# -r: copy directories recursively
# -l: copy symlinks as symlinks
# -t: preserve timestamps
# -D: preserve device files & preserve special files
# --delete: delete files in destination not in source
# not preserving permisions/owner/group as these would be set with restore script
rsync -ArltxD --delete $SOURCE_DIR $BACKUP_DIR
