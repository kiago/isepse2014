#!/bin/bash

# FTP folder to backup
source="FTP-bashproject"
# SQL database to backup
user="orthoeurscinfo"
password="waJPtbG2"
host="mysql51-31.bdb"
dbname="orthoeurscinfo"

# Destination for the backup
backup="backups"
# Name of the SQL backup file
sqldumpname=$dbname-$(date +"%d-%m-%Y-%Hh%M")

# Permissions
umask 177 # Owner has access in reading and writing

# FTP backup script
rsync -arv $source $backup

# SQL backup script
mysqldump --user=$user  --password=$password --host=$host $dbname > $backup/$sqldumpname.sql

# Save the logs to a external file when executing the script
backup.sh &>logBackup.txt

