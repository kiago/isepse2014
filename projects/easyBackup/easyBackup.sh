# Backup folders
serverDirectory="www/isep/FTP-bashproject"
localDirectory="/Users/juniorisep/Desktop/backupData"

# Server information
sshAuth="orthoeur@ftp.ortho-europe78.fr"

# Database information
user="orthoeurscinfo"
password="waJPtbG2"
host="mysql51-31.bdb"
dbname="orthoeurscinfo"

# Define SQL file name
date=$(date +"%d-%m-%Y-%Hh%M")
sqldumpname=$dbname-$date

# Build the file scriptServer.sh to be executed on the server
touch scriptServer.sh
chmod +x scriptServer.sh

echo '#!/bin/bash' >> scriptServer.sh

echo '# Destination' >> scriptServer.sh
echo 'mkdir -p ~/'$serverDirectory'/backups' >> scriptServer.sh
echo 'mkdir -p -m 705 ~/'$serverDirectory'/backups/backup-'$date >> scriptServer.sh

echo '# Permissions' >> scriptServer.sh
echo 'umask 177 # Owner only has access in reading and writing' >> scriptServer.sh

echo '# FTP backup script' >> scriptServer.sh
echo 'rsync -arv --exclude "backups" ~/'$serverDirectory' ~/'$serverDirectory'/backups/backup-'$date >> scriptServer.sh

echo '# SQL dump of the database including all tables' >> scriptServer.sh
echo 'mysqldump --user='$user'  --password='$password'  --host='$host' '$dbname' > ~/'$serverDirectory'/backups/backup-'$date'/'$sqldumpname.sql >> scriptServer.sh

# Send the file scriptServer.sh to the server
scp scriptServer.sh $sshAuth:$serverDirectory

# Run the script on the server
ssh $sshAuth "~/"$serverDirectory/scriptServer.sh

# Transfer localy the backup files
rsync -arv $sshAuth:$serverDirectory/backups  $localDirectory

# Delete the file scriptServer.sh
rm scriptServer.sh
rm $localDirectory/backups/backup-$date/FTP-bashproject/scriptServer.sh