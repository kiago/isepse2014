#!/bin/bash

#curl -s http://www.opensubtitles.org/fr/search2/sublanguageid-fre/moviename-bates.motel.s01e02 | sed -n '/<a href=\"/fr/subtitleserve/sub/.*/,/<\/a>/p' > test.txt

#curl -s http://www.opensubtitles.org/fr/search/imdbid-3361956/sublanguageid-fre/moviename-bates%20motel | sed -n '/<a href=\"\/fr\/subtitleserve\/sub\/5580050\".*/,/<\/a>/p' > test.txt

#curl -s http://www.opensubtitles.org/fr/search/imdbid-3361956/sublanguageid-fre/moviename-bates%20motel | sed -n '/<a class=\"bnone".*/,/<\/a>/p' > test.txt

#download link
#curl -o test.zip http://dl.opensubtitles.org/fr/download/sub/5089217

# episode season + episode
# episode=${file##*.};
# echo $episode

# #season number
# season=$(echo "$episode" | cut -c2-3);
# echo $season;

# #episode number
# ep=$(echo "$episode" | cut -c5-6);
# echo $ep;

# #episode=${file}
# #echo “filename: ${file%.*}”
# #echo “extension: ${file##*.}”

##This url requires to extract season number and episode 
# #page=$(curl -s "http://www.opensubtitles.org/fr/search/sublanguageid-${lang}/season-${season}/episode-${ep}/moviename-${file}");

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
	
	#Look for (avi, mkv, mpeg, m4v, mp4) files in $PWD
	# -o : OR operator
	#for file in $(find . -name "*.avi" -o -name "*.mkv" -o -name "*.mpeg" -o -name "*.m4v" -o -name "*.mp4")

	do
		#TVshow complete name + ep + season
		
		file=${file##*/}; #extract the name + extension
		file=${file%.*}; #extract just the name + without extension
		#file=${file// /.}; #replace spaces by "." in the name of the file

		echo "Looking for $file subtitles..."

		#Check if subtitle file (srt) for this video already exists
		if [ -e ${file}.srt ]; then

			echo "------------------------------"
			echo "| --> Subtitles for ${file} already exists"
			echo "------------------------------"
	   	
	   	else
	   		#This link doesn't need to extract episode number and season
			page=$(curl -s "http://www.opensubtitles.org/fr/search/sublanguageid-${lang}/moviename-${file}");

			sub_link=$(echo "$page" | grep -o '<a href="/fr/subtitleserve/sub/[^"]*' | sed 's/<a href="\/fr\/subtitleserve\///;s/"$//');
			#sed substitute <a href="\/fr\/subtitleserve\/ with nothing + substitute  " at the end of the line with nothing

			echo $sub_link; 
			curl -o $PWD/${file}.zip "http://dl.opensubtitles.org/fr/download/${sub_link}";

			#Extract .srt from zip and delete .zip (move in trash)
		   	unzip $PWD/${file}.zip "*.srt" -d $PWD/${file} && mv $PWD/${file}.zip ~/.Trash/${file}.zip;

		   	#move the srt file next to the videos
		   	mv $PWD/${file}/*.srt $PWD/${file}.srt;

		   	#delete (move in trash) the old folder containing the subtitles
		   	mv $PWD/${file} ~/.Trash/${file};

		   	echo "$file subtitles have been downloaded and extrated successfully."
	   	fi;


	done
}

#Default language
lang="fre"

# verify if script has a parameter
# $# : Le nombre de paramètres passés au script
# $@ : L'ensemble des arguments, un argument par paramètre
# $1 : Le premier argument
if [[ $# != 0 ]] ; then
	# We show the help if required
	if [[ $# == 1 ]] ; then 
		if [[ $1 == '-h' || $1 == '--help' ]] ; then
		    help_function
		else
			lang=$(echo "$1" | cut -c1-3);
			download_subtitles
		fi
	else download_subtitles
	fi
else download_subtitles
fi