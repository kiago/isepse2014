#!/bin/bash

curl -s http://www.opensubtitles.org/fr/search2/sublanguageid-fre/moviename-bates.motel.s01e02 | sed -n '/<a href=\"/fr/subtitleserve/sub/.*/,/<\/a>/p' > test.txt

curl -s http://www.opensubtitles.org/fr/search/imdbid-3361956/sublanguageid-fre/moviename-bates%20motel | sed -n '/<a href=\"\/fr\/subtitleserve\/sub\/5580050\".*/,/<\/a>/p' > test.txt

curl -s http://www.opensubtitles.org/fr/search/imdbid-3361956/sublanguageid-fre/moviename-bates%20motel | sed -n '/<a class=\"bnone".*/,/<\/a>/p' > test.txt

curl -o test.zip http://dl.opensubtitles.org/fr/download/sub/5089217
