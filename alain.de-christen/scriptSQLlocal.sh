# Base de données
 user="root"
 password="root"
 host="localhost"
 db_name="projetbash"
 mysqldump="/Applications/MAMP/Library/bin/mysqldump"

# Options
 backup_path="/Users/juniorisep/Documents/gitrepository/isepse2014/alain.de-christen/03-LocalSyncFolder/SQL-bashproject/"
 date=$(date +"%d-%b-%Y")

# Permissions d'écriture et de lecture pour le propriétaire uniquement
 umask 177

# Dump de la base en un fichier SQL
 $mysqldump --user=$user --password=$password --host=$host $db_name > $backup_path/$db_name-$date.sql

echo "La sauvegarde SQL a eu lieu avec succès".
