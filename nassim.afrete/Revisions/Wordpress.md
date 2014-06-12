TP Wordpress
============

## Créer une clef publique

Générer la clé à l'aide de la commande ssh-keygen.

	ssh-keygen -t rsa -C "your_email@example.com"
	# Creates a new ssh key, using the provided email as a label
	# Generating public/private rsa key pair.
	# Enter file in which to save the key (/c/Users/you/.ssh/id_rsa): [Press enter]

Les clés sont maintenant crées dans le dossier : `~/.ssh`

Ensuite on peut ajouter ou non une passphrase :

	Enter passphrase (empty for no passphrase): [Type a passphrase]
	# Enter same passphrase again: [Type passphrase again]

Enfin il faut ajouter la clé au ssh-agent :

	ssh-add ~/.ssh/id_rsa

## Cloner un dépot github

Pour cela on se place dans le dossier de son choix : `cd /home/username/tpWordpress`

	$ git clone https://github.com/nass59/tpWordpress.git
	ou
	$ git clone git@github.com:nass59/tpWordpress.git

Pour éditer, commiter et push un fichier sur github : 
	
	$ touch example.txt
	$ git add example.txt
	$ git commit -m "My first commit"
	$ git push

## Connexion en SSH à notre application Wordpress (OpenShift)

	$ ssh 123459098604a2yu76f35@votreDomaine.com

## Trouver les images (fichiers .jpg et .png)

	find -name "*.jpg" -type f
	and
	find -name "*.png" -type f

## Liste de tous les fichiers de moins d’une semaine

	find -mtime -7 -type f

## Les permissions de fichiers

Les permissions de fichiers pour les fichiers et répertoires se trouvant
dans ${HOME}.

	$ ls -al
	drwxr-x---.  15 root                     538309ed5973caf9f000013c  4096 May 26 05:31 .
	drwxr-x--x. 497 root                     root                     28672 Jun  7 14:31 ..
	drwxr-xr-x.   4 538309ed5973caf9f000013c 538309ed5973caf9f000013c  4096 May 26 05:32 app-deployments
	drwxr-xr-x.   5 root                     538309ed5973caf9f000013c  4096 May 26 05:31 app-root
	drwxr-x---.   2 538309ed5973caf9f000013c 538309ed5973caf9f000013c  4096 May 26 05:31 .auth
	drwxr-xr-x.   2 538309ed5973caf9f000013c 538309ed5973caf9f000013c  4096 May 26 05:31 .drush
	drwxr-x---.   3 root                     538309ed5973caf9f000013c  4096 May 26 05:31 .env
	drwxr-x---.   2 538309ed5973caf9f000013c 538309ed5973caf9f000013c  4096 May 26 05:31 .gem
	drwxr-xr-x.   3 root                     root                      4096 May 26 05:31 git
	-rw-r--r--.   1 root                     root                        57 May 26 05:31 .gitconfig
	drwxr-xr-x.  12 538309ed5973caf9f000013c 538309ed5973caf9f000013c  4096 May 26 05:31 mysql
	drwxr-x---.   2 538309ed5973caf9f000013c 538309ed5973caf9f000013c  4096 May 26 05:31 .openshift_ssh
	-rw-r--r--.   1 root                     538309ed5973caf9f000013c  1221 May 26 05:31 .pearrc
	drwxr-xr-x.  11 538309ed5973caf9f000013c 538309ed5973caf9f000013c  4096 Jun  4 19:25 php
	d---------.   3 root                     root                      4096 May 26 05:31 .sandbox
	drwxr-x---.   2 root                     538309ed5973caf9f000013c  4096 May 26 05:31 .ssh
	d---------.   3 root                     root                      4096 May 26 05:31 .tmp
	lrwxrwxrwx.   1 root                     root                        64 May 26 05:31 .vimrc -> pathOfTheLink

Et pour rappel :

- d (Directory) : indique si l'élément est un dossier.
- l (Link) : indique si l'élément est un lien (raccourci).
- r (Read) : indique si on peut lire l'élément.
- w (Write) : indique si on peut modifier l'élément.
- x (eXecute) : si c'est un fichier, « x » indique qu'on peut l'exécuter. Si c'est un dossier, « x » indique qu'on peut voir les sous-dossiers qu'il contient si on a le droit de lecture dessus.

	d        rwx       rwx   rwx 
	dossier utilisateur groupe autres

## Nombre d'utilisateurs

	$ grep "OpenShift guest" /etc/passwd | wc -l
	485

## Création d'un script qui liste les fichier se terminant en ".conf"

	$ cd $OPENSHIFT_DATA_DIR
	$ vim displayFileConf.sh
	
	#!/bin/bash

	# script qui liste tous les fichiers ".conf"
	pathArchDir=$OPENSHIFT_DATA_DIR/arch
	# création d'un sous-repertoire "arch"
	if [ ! -e $pathArchDir ] && [ ! -d $pathArchDir ]
	then
	        echo "Création du dossier arch"
	        mkdir $pathArchDir
	else
	        echo "Le dossier arch est déjà créé"
	fi
	# on liste les fichiers ".conf" qu'on écrit dans le dossier arch dans filesConf et les erreurs dans logFiles.txt
	echo "Programme en cours..."
	find / -name "*.conf" -type f > $pathArchDir/filesConf.txt 2> $pathArchDir/logFiles.txt
	chmod 444 $pathArchDir/filesConf.txt
	chmod 444 $pathArchDir/logFiles.txt
	echo "Programme terminé !"
