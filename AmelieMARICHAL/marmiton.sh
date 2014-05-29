#!/bin/bash

curl -o page -s http://www.marmiton.org/recettes/recherche.aspx?aqt=$1 
sed -n -f total.sed page