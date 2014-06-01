# Paramètres de sauvegarde
serverDirectory="www/isep/FTP-bashproject"
localDirectory="/Users/juniorisep/Desktop/backupSite"

# Paramètres serveur
sshAuth="orthoeur@ftp.ortho-europe78.fr"
serverBase="/home/orthoeur/"
scriptLocation=$serverBase/"www/isep/backupPlus.sh"

# SQL database to backup
user="orthoeurscinfo"
password="waJPtbG2"
host="mysql51-31.bdb"
dbname="orthoeurscinfo"

# Name of the SQL backup file
date=$(date +"%d-%m-%Y-%Hh%M")
sqldumpname=$dbname-$date

# FTP folder to backup
source="/home/orthoeur/www/isep/FTP-bashproject"

#Création du fichier scriptServeur.sh qui sera exécuté sur le serveur

touch scriptServer.sh
chmod +x scriptServer.sh

echo '#!/bin/bash' >> scriptServer.sh

echo '# Destination' >> scriptServer.sh
echo 'mkdir -p '$source'/backups' >> scriptServer.sh
echo 'mkdir -m 705 '$source'/backups/backup-'$date >> scriptServer.sh

echo '# Permissions' >> scriptServer.sh
echo 'umask 177 # Owner only has access in reading and writing' >> scriptServer.sh

echo '# FTP backup script' >> scriptServer.sh
echo 'rsync -arv --exclude "backups" '$source' '$source'/backups/backup-'$date >> scriptServer.sh

echo '#basic dump of the database including all tables' >> scriptServer.sh
echo 'mysqldump --user='$user'  --password='$password'  --host='$host' '$dbname' > '$source'/backups/backup-'$date'/'$sqldumpname.sql >> scriptServer.sh

# Envoie du fichier scriptServer.sh sur le serveur puis suppression en local
scp scriptServer.sh $sshAuth:$serverDirectory/

# Connexion au serveur et execution du script de backup
ssh $sshAuth $serverBase/$serverDirectory/scriptServer.sh

# Recupération du backup du serveur vers le dossier local
rsync -arv $sshAuth:$serverDirectory  $localDirectory

# Suppression des fichiers scriptServer.sh en local et sur le serveur
rm scriptServer.sh
