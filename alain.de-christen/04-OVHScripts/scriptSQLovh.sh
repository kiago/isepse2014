#!/bin/bash

# Base de données
user="orthoeurscinfo"
password="waJPtbG2"
host="mysql51-31.bdb"
db_name="orthoeurscinfo"

# Options
backup_path="backups/"
date=$(date +"%d-%b-%Y")

# Permissions de lecture et écriture pour le priopriétaire uniquement
umask 177

# Dump de la base en un fichier SQL
mysqldump --user=$user  --password=$password --host=$host $db_name > $backup_path/$db_name-$date.sql

scriptSQLovh.sh &>logSQL.txt

