#!/bin/bash

#curl -s http://www.opensubtitles.org/fr/search2/sublanguageid-fre/moviename-bates.motel.s01e02 | sed -n '/<a href=\"/fr/subtitleserve/sub/.*/,/<\/a>/p' > test.txt

#curl -s http://www.opensubtitles.org/fr/search/imdbid-3361956/sublanguageid-fre/moviename-bates%20motel | sed -n '/<a href=\"\/fr\/subtitleserve\/sub\/5580050\".*/,/<\/a>/p' > test.txt

#curl -s http://www.opensubtitles.org/fr/search/imdbid-3361956/sublanguageid-fre/moviename-bates%20motel | sed -n '/<a class=\"bnone".*/,/<\/a>/p' > test.txt

#download link
#curl -o test.zip http://dl.opensubtitles.org/fr/download/sub/5089217

# episode season + episode
# episode=${fichier##*.};
# echo $episode

# #season number
# season=$(echo "$episode" | cut -c2-3);
# echo $season;

# #episode number
# ep=$(echo "$episode" | cut -c5-6);
# echo $ep;

# #episode=${fichier}
# #echo “filename: ${fichier%.*}”
# #echo “extension: ${fichier##*.}”

##This url requires to extract season number and episode 
# #page=$(curl -s "http://www.opensubtitles.org/fr/search/sublanguageid-${lang}/season-${season}/episode-${ep}/moviename-${fichier}");

function help_function {
	echo -e "This application download all subtitles for the videos in a folder"
	echo -e "Utilisation : ./subtitle.sh [language] \n"
}

function ask_path {
	read -e -p "Enter the path where your videos are : " FILEPATH
	eval FILEPATH=$FILEPATH
	cd $FILEPATH
	#echo $PWD
}

function download_subtitles {
	echo "Subtitle language is --> $lang"

	ask_path
	
	#declare format=($PWD/*.avi | $PWD/*.mpeg | $PWD/*.mkv | $PWD/*.m4v | $PWD/*.mov)

	for fichier in $PWD/*.avi or $PWD/*.mkv or $PWD/*.mpeg
	#avi, mpeg, mkv, m4v , mov
	do
		#TVshow complete name + ep + season
		
		fichier=${fichier##*/}; #extract the name + extension
		fichier=${fichier%.*}; #extract just the name + without extension
		#fichier=${fichier// /.}; #replace spaces by "." in the name of the file

		echo $fichier

		#Check if subtitle file (srt) for this video already exists
		if [ -e ${fichier}.srt ]; then

			echo -e "srt for ${fichier} already exists"
	   	
	   	else
	   		#This link doesn't need to extract episode number and season
			page=$(curl -s "http://www.opensubtitles.org/fr/search/sublanguageid-${lang}/moviename-${fichier}");

			#sub_link=$(echo "$page" | grep -o '<a href="/fr/subtitleserve/sub/[^"]*"' | sed 's/<a href="\/fr\/subtitleserve\///;s/"$//');
			sub_link=$(echo "$page" | grep -o '<a href="/fr/subtitleserve/sub/[^"]*"' | sed 's/<a href="\/fr\/subtitleserve\///;s/"//');
			#sed substitute <a href="\/fr\/subtitleserve\/ with nothing + substitute  " with nothing

			echo $sub_link; 
			curl -o $PWD/${fichier}.zip "http://dl.opensubtitles.org/fr/download/${sub_link}";

			#Extract .srt from zip and delete .zip (move in trash)
		   	unzip $PWD/${fichier}.zip "*.srt" -d $PWD/${fichier} && mv $PWD/${fichier}.zip ~/.Trash/${fichier}.zip;

		   	#move the srt file next to the videos
		   	mv $PWD/${fichier}/*.srt $PWD/${fichier}.srt;

		   	#delete (move in trash) the old folder containing the subtitles
		   	mv $PWD/${fichier} ~/.Trash/${fichier};
	   	fi;


	done
}

#Default language
lang="fre"

# verify if script has a parameter
if [[ $# != 0 ]] ; then
	# We show the help if required
	if [[ $# == 1 ]] ; then 
		if [[ $1 == '-h' || $1 == '--help' ]] ; then
		    help_function
		else
			lang=$(echo "$@" | cut -c1-3);
			download_subtitles
		fi
	else download_subtitles
	fi
else download_subtitles
fi