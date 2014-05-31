#!/bin/bash

curl -o page -s http://www.marmiton.org/recettes/recherche.aspx?aqt=$1 
sed -n -f titles.sed page
sed -n -f tps_cuisson.sed page
sed -n -f tps_preparation.sed page
sed -n -f type.sed page