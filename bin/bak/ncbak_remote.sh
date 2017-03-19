#!/bin/bash

# weekly back-up to desktop (limit transfer usage) with anacron
SSH_HOSTNAME=digoce
SOURCE_DIR="/var/backups/nextcloud/"
BACKUP_DIR="/var/backups/nextcloud/"

# rsync flags
# -A: preserve ACLs
# -r: copy directories recursively
# -l: copy symlinks as symlinks
# -t: preserve timestamps
# -D: preserve device files & preserve special files
# --delete: delete files in destination not in source
# -e ssh #specific remote shell to use
# not preserving permisions/owner/group as these would be set with restore script
rsync -ArltxD --delete -e ssh $SSH_HOSTNAME:$SOURCE_DIR* $BACKUP_DIR
