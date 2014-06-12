function fonctionTest(){
local varPage1
local varPage2
varpage1=$1
varpage2=$2
mot=$3
echo *********************************************************
echo           Programme de recherche sur Allociné
echo *********************************************************
for varpage in `seq $varpage1 $varpage2`
do
title=$(curl http://www.allocine.fr/film/fichefilm_gen_cfilm=$varpage.html | sed -n '/<div id=\"title\"/,/<\/div>/p'  > fichierdessynopsys.txt)
echo j\'ai recupéré le titre film film qui a pour ID $title
curl http://www.allocine.fr/film/fichefilm_gen_cfilm=$varpage.html | sed -n '/<p itemprop=\"description\">/,/<\/p>/p' >> fichierdessynopsys.txt 
var=$(grep -c $mot fichierdessynopsys.txt) 
echo j\'ai recupéré le film qui a pour ID $varpage
echo j\'ai trouvé $var fois $mot le mot dans le synopsys
done
return 5
}

function recherchefilm(){
local mot
mot=$1
curl http://www.allocine.fr/recherche/?q=batman | sed -n '/<a href=\"\/film\/fichefilm_gen_cfilm=\/,/html/p' > id.txt
}
fonctionTest 186124 186124 populaire
#recherchefilm batman
