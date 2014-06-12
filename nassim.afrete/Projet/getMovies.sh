#!/bin/bash

function getDescription(){
local pageLinks=$1

echo '<!DOCTYPE HTML><html lang="fr"><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta name="viewport" content="width=device-width, initial-scale=1.0" /><title>Films du box-office</title><style type="text/css">img {width: 280px;}</style>
</head><body><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td><table align="center" width="800px" cellspacing="0" cellpadding="0" border="0" style="background-color:#2c3e50;color:#ecf0f1;font-family:'Century Gothic',arial,serif;margin:0px auto !important;"><tr><td style="background-color: rgb(231, 76, 60); height: 110px; width: 100%; vertical-align: middle; text-align: center;"><h1 style="color:#FFFFFF;font-weight: lighter;text-align: center;font-size: 30px;">Les films du Box-Office : Projet IOSA</h1></td></tr>' > content.html

for movie in $(cat $pageLinks)
do
wget -O pageMovie.html $movie

title=`tr -d '\n' < pageMovie.html | grep -o -E '<meta property="og:title" content="([^"]+)" />' | sed 's/^.*content="\([^"]*\)".*$/\1/' | sed "s/&#39;/'/g" | sed 's/&quot;/"/g'`
description=`tr -d '\n' < pageMovie.html | grep -o -E '<meta property="og:description" content="([^"]+)" />' | sed 's/^.*content="\([^"]*\)".*$/\1/' | sed "s/&#39;/'/g" | sed 's/&quot;/"/g'`
image=`tr -d '\n' < pageMovie.html | grep -o -E '<meta property="og:image" content="([^"]+)" />' | sed 's/^.*content="\([^"]*\)".*$/\1/'`

echo "<tr><td style=\"vertical-align: top\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"height:40px;\"></td></tr><tr><td style=\"width:20px;\"></td><td style=\"with:200px;\"><img src=\"$image\" alt=\"image\" style=\"display:block;border:0px;\" /></td><td style=\"width:20px;\"></td><td style=\"vertical-align: top;\"><div style=\"font-size: 34px; height: 102px;\">$title</div><div style=\"height: 210px;\">$description</div></td><td style=\"width:20px;\"></td></tr></table></td></tr>" >> content.html

rm pageMovie.html

done

echo "</table></td></tr></table></body></html>" >> content.html
mailx -a "Content-Type: text/html" -s "Films du Box-office : Projet IOSA" nass_5902@hotmail.fr < content.html
return 1
}
 
echo -e "Make your choice\n 1) Get movies of Box-Office\n 2) Search a movie"

pageBoxOffice=boxOffice
pageLinksBO=movies.html
pageLinksSearch=moviesSearch.html

read choice
case $choice in
        1) 
echo "Récupération des films du Box-Office..."
wget -O allMovies.html  http://www.allocine.fr/boxoffice/france/

sleep 1

tr -d '\n' < allMovies.html | grep -o -E '<h3><a class="fs12 bold" href="([^"#]+)"' | grep href | sed 's/^.*href="\([^"]*\)".*$/\1/' | sed "s/^/http:\/\/www.allocine.fr/g" > $pageLinksBO

echo -e  "\nFin de Récupération des films du Box-Office"
echo "Récupération des descriptions..."
getDescription $pageLinksBO
;;
        2)
echo "Faire une recherche"
read -p "Entrez le mot clé pour faire la recherche : " recherche
echo $recherche > keyWords.txt
sed 's/ /\+/g' keyWords.txt

wget -O pageRecherche.html  http://www.allocine.fr/recherche/?q=$recherche

sleep 1

tr -d '\n' < pageRecherche.html | grep -o -E "<a href='/film/([^s]+)'" | grep html | sed 's/^.*href="\([^"]*\)".*$/\1/' | sed "s/'/\"/g" | sed 's/^.*href="\([^"]*\)".*$/\1/' | uniq | sed "s/^/http:\/\/www.allocine.fr/g" > $pageLinksSearch

numberOfResults=`cat $pageLinksBO | wc -l`
if [ $numberOfResults -gt 0 ]
then
    echo -e "\nFin de la récupération des films pour la recherche"
    echo "Récupération des descriptions..."
    getDescription $pageLinksSearch
else
    echo "OOups ! Aucun film ne correspond à votre recherche."
fi
;;
        *) echo "bad option";;
esac