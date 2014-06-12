#!/bin/bash

echo "Récupération des films..."

wget -O allMovies.html  http://www.allocine.fr/boxoffice/france/

sleep 1

tr -d '\n' < allMovies.html | grep -o -E '<h3><a class="fs12 bold" href="([^"#]+)"' | grep href | sed 's/^.*href="\([^"]*\)".*$/\1/' | sed "s/^/http:\/\/www.allocine.fr/g" > movies.html

echo -e  "\nFin de Récupération des films"
echo "Récupération des descriptions..."

echo '<!DOCTYPE HTML><html lang="fr"><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta name="viewport" content="width=device-width, initial-scale=1.0" /><title>Films du box-office</title><style type="text/css">img {width: 280px;}</style>
</head><body><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td><table align="center" width="800px" cellspacing="0" cellpadding="0" border="0" style="background-color:#2c3e50;color:#ecf0f1;font-family:'Century Gothic',arial,serif;margin:0px auto !important;"><tr><td style="background-color: rgb(231, 76, 60); height: 110px; width: 100%; vertical-align: middle; text-align: center;"><h1 style="color:#FFFFFF;font-weight: lighter;text-align: center;font-size: 30px;">Les films du Box-Office : Projet IOSA</h1></td></tr>' > boxOffice.html

for movie in $(cat movies.html)
do
echo "lien : $movie"
wget -O pageMovie.html $movie

title=`tr -d '\n' < pageMovie.html | grep -o -E '<meta property="og:title" content="([^"]+)" />' | sed 's/^.*content="\([^"]*\)".*$/\1/' | sed "s/&#39;/'/g" | sed 's/&quot;/"/g'`
description=`tr -d '\n' < pageMovie.html | grep -o -E '<meta property="og:description" content="([^"]+)" />' | sed 's/^.*content="\([^"]*\)".*$/\1/' | sed "s/&#39;/'/g" | sed 's/&quot;/"/g'`
image=`tr -d '\n' < pageMovie.html | grep -o -E '<meta property="og:image" content="([^"]+)" />' | sed 's/^.*content="\([^"]*\)".*$/\1/'`

echo "<tr><td style=\"vertical-align: top\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"height:40px;\"></td></tr><tr><td style=\"width:20px;\"></td><td style=\"with:200px;\"><img src=\"$image\" alt=\"image\" style=\"display:block;border:0px;\" /></td><td style=\"width:20px;\"></td><td style=\"vertical-align: top;\"><div style=\"font-size: 34px; height: 102px;\">$title</div><div style=\"height: 210px;\">$description</div></td><td style=\"width:20px;\"></td></tr></table></td></tr>" >> boxOffice.html

rm pageMovie.html

done

echo "</table></td></tr></table></body></html>" >> boxOffice.html

mailx -a "Content-Type: text/html" -s "Films du Box-office : Projet IOSA" nass_5902@hotmail.fr < boxOffice.html