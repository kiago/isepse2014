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
		curl -s www.lefigaro.fr/rss/figaro_sport.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > Sport.txt

		Text="Sport"
		;;
	"2")
		curl -s www.lefigaro.fr/rss/figaro_football.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > Football.txt
		
		Text="Football"
		;;
	"3")
		curl -s www.lefigaro.fr/rss/figaro_rugby.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > Rugby.txt

		Text="Rugby"
		;;
	"4")
		curl -s www.lefigaro.fr/rss/figaro_tennis.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > Tennis.txt

		Text="Tennis"
		;;
	"5")
		curl -s www.lefigaro.fr/rss/figaro_cinema.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > Cinema.txt

		Text="Cinema"
		;;
	"6")
		curl -s www.lefigaro.fr/rss/figaro_musique.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > Musique.txt

		Text="Musique"
		;;
	"7")
		curl -s www.lefigaro.fr/rss/figaro_livres.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > Livres.txt

		Text="Livres"
		;;
	"8")
		curl -s www.lefigaro.fr/rss/figaro_theatre.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > Theatre.txt

		Text="Theatre"
		;;
	"9")
		curl -s www.lefigaro.fr/rss/figaro_culture.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > Culture.txt

		Text="Culture"
		;;
	"10")
		curl -s www.lefigaro.fr/rss/figaro_economie.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > Economie.txt

		Text="Economie"
		;;
	"11")
		curl -s www.lefigaro.fr/rss/figaro_emploi.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > Emploi.txt

		Text="Emploi"
		;;
	"12")
		curl -s www.lefigaro.fr/rss/figaro_conso.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > Consomation.txt

		Text="Consomation"
		;;
	"13")
		curl -s www.lefigaro.fr/rss/figaro_impots.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > Impots.txt

		Text="Impots"
		;;
	"14")
		curl -s www.lefigaro.fr/rss/figaro_placement.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > Placement.txt

		Text="Placement"
		;;
	"15")
		curl -s www.lefigaro.fr/rss/figaro_immobilier.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > Immobilier.txt

		Text="Immobilier"
		;;
	"16")
		curl -s www.lefigaro.fr/rss/figaro_medias.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > Media.txt

		Text="Media"
		;;
	"17")
		curl -s www.lefigaro.fr/rss/figaro_politique.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > Politique.txt

		Text="Politique"
		;;
	"18")
		curl -s www.lefigaro.fr/rss/figaro_voyages.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > Voyages.txt

		Text="Voyages"
		;;
	"19")
		curl -s www.lefigaro.fr/rss/figaro_actualite-france.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > France.txt

		Text="France"
		;;
	"20")
		curl -s www.lefigaro.fr/rss/figaro_hightech.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > WebEtTech.txt

		Text="WebEtTech"
		;;
	"21")
		curl -s www.lefigaro.fr/rss/figaro_sciences.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > Science.txt

		Text="Science"
		;;
	"22")
		curl -s www.lefigaro.fr/rss/figaro_sante.xml | grep "\[CDATA\[" |sed -e 's/<title><!\[CDATA\[//g' |sed -e 's/\]\]><\/title>//g' |sed -e 's/<!\[CDATA\[/  /g' | sed '/\]\]/G'|sed -e 's/\]\]>//g' > Santer.txt

		Text="Santer"
		;;
	*)
		echo "Merci de prendre une categorie disponible"
		;;
esac

echo "Votre fichier contenant les dernieres infos de la categorie $Text à été cré"

read -p 'Voulez vous que celui ci vous soit envoyer par mail ? (Y,N)
' boolmail

if [ $boolmail = "Y" ]
then
	read -p 'quel est votre adresse mail ?
' maile
mail -s "Flux RSS" $maile < $Text.txt

elif [ $boolmail = "N" ]
then 
	echo "Ok le fichier $Text.txt contenant les dernieres infos est présent dans votre répertoire"
else
	"Le fichier ne vous sera pas renvoyer par mail il fallait repondre Y pour cela"

fi



