#!/bin/bash

echo "Récupération des films..."

wget -O allMovies.html  http://www.allocine.fr/boxoffice/france/

sleep 1

tr -d '\n' < allMovies.html | grep -o -E '<h3><a class="fs12 bold" href="([^"#]+)"' | grep href | sed 's/^.*href="\([^"]*\)".*$/\1/' | sed "s/^/http:\/\/www.allocine.fr/g" > movies.html

echo -e  "\nFin de Récupération des films"
echo "Récupération des descriptions..."

echo '<!DOCTYPE HTML><html lang="fr"><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta name="viewport" content="width=device-width, initial-scale=1.0" /><title>Films du box-office</title>
<style type="text/css">body {text-align: center; padding-left: 100px; padding-right: 100px; padding-top: 20px; font-family: "Century Gothic",arial,serif;}div {border-bottom: 1px solid #E3E3E3;}div p:first-child {font-size: 20px;}div p:first-child + p {padding-left: 100px; padding-right: 100px;}h1 {text-align: center;font-size: 30px;}img {width: 280px;}</style>
</head><body><h1>Les films du Box-Office : Projet IOSA</h1>' > boxOffice.html

for movie in $(cat movies.html)
do
echo "lien : $movie"
wget -O pageMovie.html $movie

title=`tr -d '\n' < pageMovie.html | grep -o -E '<meta property="og:title" content="([^"]+)" />' | sed 's/^.*content="\([^"]*\)".*$/\1/' | sed "s/&#39;/'/g" | sed 's/&quot;/"/g'`
description=`tr -d '\n' < pageMovie.html | grep -o -E '<meta property="og:description" content="([^"]+)" />' | sed 's/^.*content="\([^"]*\)".*$/\1/' | sed "s/&#39;/'/g" | sed 's/&quot;/"/g'`
image=`tr -d '\n' < pageMovie.html | grep -o -E '<meta property="og:image" content="([^"]+)" />' | sed 's/^.*content="\([^"]*\)".*$/\1/'`

echo "<div><p>$title</p>" >> boxOffice.html
echo "<p>$description</p>" >> boxOffice.html
echo "<p><img src=\"$image\" alt=\"image\" /></div>" >> boxOffice.html
rm pageMovie.html

done

echo "</body></html>" >> boxOffice.html

mailx -a "Content-Type: text/html" -s "Films du Box-office : Projet IOSA" nass_5902@hotmail.fr daher860@hotmail.com baptcheg@gmail.com abtout.samy@gmail.com < boxOffice.html