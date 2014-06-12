The aim of this document is to help you configure EasyBackup file.

- Variable "ServerDirectory" 
Enter the path to the FTP folder to backup on the server. Do not include the base path "~ /"
Example : Ç serverDirectory="www/monSite" È

- Variable "LocalDirectory" 
Enter the path to the local folder where you want to save the backups.
Example (Mac) : " localDirectory="/Users/juniorisep/Desktop/mesBackups" "

- Variable "sshAuth" 
Enter the address of ssh connection to the remote server in the form "username@ftp.domaine.ext." 
It is necessary to have previously registered public key in a file "authorized_keys" to be located in a folder ". ssh" to the root of your FTP server.

- Connect to the database: 
Learn the values of the 4 variables "user", "password", "host" and "dbname" for your database. In some providers (eg OVH shared hosting with Pro), the database is accessible only from their own servers, ie it must inform the address type "mysqlXX-XX.xxx" provided by OVH (X <=> number, x <=> letter.)
Example : " 
user="nomUtilisateur" 
password="motDePasse" 
host="mysql38-42.pro"
dbname="nomMaBase"
"

Once these few variables defined, it'll just run the script from your console like this :
 "./easyBackup.sh"

The team EasyBackup,
easybackup@dechristen.fr