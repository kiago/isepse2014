#!/bin/bash

#VERSION 1 SCRIPT BASH

#ATTENTION CE SCRIPT NECESSITE PREALABLEMENT D AVOIR INSTALLE LA BIBLIOTHEQUE 
#QUI FACILITE LA CONNEXION A L API TWITTER
#l'ensemble est disponible ici : http://mike.verdone.ca/twitter/

message='bienvenue sur mon script : tenez vous au courant des dernieres actualitees TWITTER de votre compte par mail'

echo $message

#on recupere les 20 derniers tweets au format JSON de son compte TWITTER
$(twitter -f json > twitterResponse.txt);

#on recherche avec grep les messages des tweets : champs "text"
$(grep -Pon '"truncated": false, "text":.*?[^\\]",' twitterResponse.txt > textTweet.txt);
#on supprime le debut de champs "truncated": false, "text":" inutile 
$(sed 's/"truncated": false, "text"://g' textTweet.txt > clearedTextTweet.txt);

#on recherche les auteurs tjrs avec grep
$(grep -Po '"favourites_count":.*?[^\\]",' twitterResponse.txt > authorTweet.txt);
#on supprime le debut de champs inutile 
$(sed 's/"favourites_count": [0-9]*, "name"://g' authorTweet.txt > clearedAuthorTweet.txt);



#on concatene text du tweet et auteur
i=0
j=0
cat clearedTextTweet.txt | while read lineText
do
j=0
cat clearedAuthorTweet.txt | while read lineAuthor
do
if [ $i -eq $j ]
then
concatChain=" BY "
echo "$lineText$concatChain$lineAuthor" >> resultToSend.txt
fi
j=`expr $j + 1`
done	
i=`expr $i + 1`
done

echo "donnez moi un mail SVP :"
read email

result=$(cat resultToSend.txt);
echo "$result";

#si l utilisateur ne rentre pas d adresse mail
if [[ -z "$result" ]]
then
echo "tant pis pour toi !!!!!"
else 
echo "ACTUALITE TWITTER BY MAIL :
voici les 20 derniers tweets de 
votre compte twitter:
$result  " | mail -s "ACTUALITE TWITTER" $email
echo "Merci l envoie a ete effectué !!! Aurevoir"
fi

#on supprime les fichiers de stockage utilise precedemment

rm clearedTextTweet.txt;
rm clearedAuthorTweet.txt;
rm textTweet.txt;
rm authorTweet.txt;
rm twitterResponse.txt;
rm resultToSend.txt;

exit
