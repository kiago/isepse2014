#!/bin/bash

# Base de données
 user="orthoeuroscinfo"
 password="waJPtbG2"
 host="mysql51-31.bdb"
 db_name="orthoeurscinfo"
 mysqldump="/Applications/MAMP/Library/bin/mysqldump"

# Options
 backup_path="/Users/juniorisep/Documents/gitrepository/isepse2014/alain.de-christen/03-LocalSyncFolder/SQL-bashproject/"
 date=$(date +"%d-%b-%Y")

# Permissions de lecture et écriture pour le priopriétaire uniquement
 umask 177

# Dump de la base en un fichier SQL
 $mysqldump --user=$user --password=$password --host=$host $db_name > $backup_path/$db_name-$date.sql

# Supprimer les sauvegardes de plus de 30 jours
# find $backup_path/* -mtime +30 -exec rm {} \;

echo "La sauvegarde SQL a eu lieu avec succès".
