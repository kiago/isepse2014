#!/bin/bash

read -p 'Entrez le numero correspondant à la catégorie voulu 
			Sport : 1 
			Football : 2
			Rugby : 3
			Tennis : 4
			Cinema : 5
			Musique : 6
			Livres : 7
			Theatre : 8
			Culture : 9
			Economie : 10
			Emploi : 11
			Consomation : 12
			Impots : 13
			Placement : 14
			Immobilier : 15
			Media : 16
			Politique : 17
			Voyages : 18
			France : 19
			Web et Technologies : 20
			Science : 21
			Sante : 22
			' nom

case $nom in
	"1")
		curl -s www.lefigaro.fr/rss/figaro_sport.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > t.txt
		;;
	"2")
		curl -s www.lefigaro.fr/rss/figaro_football.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > t.txt
		;;
	"3")
		curl -s www.lefigaro.fr/rss/figaro_rugby.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > t.txt
		;;
	"4")
		curl -s www.lefigaro.fr/rss/figaro_tennis.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > t.txt
		;;
	"5")
		curl -s www.lefigaro.fr/rss/figaro_cinema.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > t.txt
		;;
	"6")
		curl -s www.lefigaro.fr/rss/figaro_musique.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > t.txt
		;;
	"7")
		curl -s www.lefigaro.fr/rss/figaro_livres.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > t.txt
		;;
	"8")
		curl -s www.lefigaro.fr/rss/figaro_theatre.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > t.txt
		;;
	"9")
		curl -s www.lefigaro.fr/rss/figaro_culture.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > t.txt
		;;
	"10")
		curl -s www.lefigaro.fr/rss/figaro_economie.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > t.txt
		;;
	"11")
		curl -s www.lefigaro.fr/rss/figaro_emploi.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > t.txt
		;;
	"12")
		curl -s www.lefigaro.fr/rss/figaro_conso.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > t.txt
		;;
	"13")
		curl -s www.lefigaro.fr/rss/figaro_impots.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > t.txt
		;;
	"14")
		curl -s www.lefigaro.fr/rss/figaro_placement.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > t.txt
		;;
	"15")
		curl -s www.lefigaro.fr/rss/figaro_immobilier.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > t.txt
		;;
	"16")
		curl -s www.lefigaro.fr/rss/figaro_medias.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > t.txt
		;;
	"17")
		curl -s www.lefigaro.fr/rss/figaro_politique.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > t.txt
		;;
	"18")
		curl -s www.lefigaro.fr/rss/figaro_voyages.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > t.txt
		;;
	"19")
		curl -s www.lefigaro.fr/rss/figaro_actualite-france.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > t.txt
		;;
	"20")
		curl -s www.lefigaro.fr/rss/figaro_hightech.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > t.txt
		;;
	"21")
		curl -s www.lefigaro.fr/rss/figaro_sciences.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > t.txt
		;;
	"22")
		curl -s www.lefigaro.fr/rss/figaro_sante.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > t.txt
		;;
	*)
		echo "Merci de prendre une categorie disponible"
		;;
esac
