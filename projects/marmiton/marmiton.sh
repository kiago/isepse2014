#!/bin/bash

# Get the page content
curl -o page -s http://www.marmiton.org/recettes/recherche.aspx?aqt=$1 
# Extract data from the HTML page
sed -n -f total.sed page
# Delete the page
rm page