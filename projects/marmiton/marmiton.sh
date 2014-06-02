#!/bin/bash

rm /tmp/raw
touch /tmp/raw
for i in {0..50..10}
do
	curl -s http://www.marmiton.org/recettes/recherche.aspx?aqt=$1\&start=$i >> /tmp/raw
done
# Extract data from the HTML page
sed -n -f total.sed /tmp/raw | sort --field-separator=';' -rn --key=$2 |column -t -s ";" 
