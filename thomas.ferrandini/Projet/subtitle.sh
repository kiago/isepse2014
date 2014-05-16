#!/bin/bash

#curl -s http://www.opensubtitles.org/fr/search2/sublanguageid-fre/moviename-bates.motel.s01e02 | sed -n '/<a href=\"/fr/subtitleserve/sub/.*/,/<\/a>/p' > test.txt

#curl -s http://www.opensubtitles.org/fr/search/imdbid-3361956/sublanguageid-fre/moviename-bates%20motel | sed -n '/<a href=\"\/fr\/subtitleserve\/sub\/5580050\".*/,/<\/a>/p' > test.txt

#curl -s http://www.opensubtitles.org/fr/search/imdbid-3361956/sublanguageid-fre/moviename-bates%20motel | sed -n '/<a class=\"bnone".*/,/<\/a>/p' > test.txt

#download link
#curl -o test.zip http://dl.opensubtitles.org/fr/download/sub/5089217

for fichier in ~/Movies/test/*
do
	#TVshow complete name + ep + season
	fichier=${fichier##*/};
	fichier=${fichier%.*};
	echo $fichier

	#episode season + episode
	episode=${fichier##*.};
	echo $episode

	#season number
	season=$(echo "$episode" | cut -c2-3);
	echo $season;

	#episode number
	ep=$(echo "$episode" | cut -c5-6);
	echo $ep;

	#episode=${fichier}
	#echo “filename: ${fichier%.*}”
	#echo “extension: ${fichier##*.}”

	page=$(curl -s "http://www.opensubtitles.org/fr/search/sublanguageid-fre/season-${season}/episode-${ep}/moviename-${fichier}");

	sub_link=$(echo "$page" | grep -o '<a href="/fr/subtitleserve/sub/[^"]*"' | sed 's/<a href="\/fr\/subtitleserve\///;s/"$//');

	echo $sub_link; 
	curl -o ~/Movies/test/${fichier}.zip "http://dl.opensubtitles.org/fr/download/${sub_link}";

   unzip ~/Movies/test/${fichier}.zip -d ~/Movies/test/ && rm ~/Movies/test/${fichier}.zip;

done

#curl -s "http://www.opensubtitles.org/fr/search2/sublanguageid-fre/moviename-devious.maids.s02e03" | sed -n '/<a href=\"\/fr\/subtitleserve\/sub\/5649116\".*/,/<\/a>/p' > test.txt

#New url : we need to specify the episode and season number 
#http://www.opensubtitles.org/fr/search/sublanguageid-fre/season-2/episode-3/moviename-devious.maids.s02e02