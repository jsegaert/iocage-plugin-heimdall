#!/bin/sh

BACKUP_DIR=/var/backups/heimdall-data

# Rename previous configuration backup directories
if [ -d $BACKUP_DIR ] ; then
  mv -v $BACKUP_DIR $BACKUP_DIR$(ls -d $BACKUP_DIR* | wc -l | sed 's/ //g')
fi

echo "Saving configuration..."
mkdir -p $BACKUP_DIR

cp -a /usr/local/www/heimdall/.env $BACKUP_DIR
cp -a /usr/local/www/heimdall/database/app.sqlite $BACKUP_DIR
cp -a /usr/local/www/heimdall/storage/app/public $BACKUP_DIR

