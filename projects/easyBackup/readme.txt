Ce document est destiné à vous aider à configurer les paramètres de votre fichier easyBackup.

— Variable « serverDirectory » :
Inscrire le chemin du dossier FTP à sauvegarder sur le serveur. Ne pas inclure le chemin de base « ~/ ». Exemple : « serverDirectory="www/monSite" »

— Variable « localDirectory » :
Inscrire le chemin du dossier en local dans lequel vous souhaitez enregistrer les backups.
Exemple (Mac) : « localDirectory="/Users/juniorisep/Desktop/mesBackups" »

— Variable « sshAuth » :
Inscrire l’adresse de connexion ssh au serveur distant de la forme « username@ftp.domaine.ext ».
Il est nécessaire d’avoir préalablement inscrit sa clé publique dans un fichier « authorized_keys » qui doit se trouver dans un dossier « .ssh » à la racine de votre serveur FTP.
Exemple : « pseudo@ftp.mondomaine.fr »

— Connexion à la base de données :
Renseigner les valeurs des 4 variables « user », « password », « host » et « dbname » correspondant à votre base de données. Chez certains prestataires (ex. OVH avec un hébergement mutualisé Pro), la base de données n’est accessible que depuis leurs propres serveurs, c’est à dire qu’il faut renseigner l’adresse du type « mysqlXX-XX.xxx » fournie par OVH (X <=> chiffre, x <=> lettre).
Exemple : « 
user="nomUtilisateur" 
password="motDePasse" 
host="mysql38-42.pro"
dbname="nomMaBase"
»

Une fois ces quelques variables définies, il ne vous reste plus qu’à lancer le script depuis votre console de la façon suivante : « ./easyBackup.sh ».

L’équipe easyBackup,
easybackup@dechristen.fr