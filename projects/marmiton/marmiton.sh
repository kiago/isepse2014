#!/bin/bash

rm /tmp/raw
touch /tmp/raw

echo "What recipe are you searching for? :"
read recipe

for i in {0..50..10}
do
	curl -s http://www.marmiton.org/recettes/recherche.aspx?aqt=$recipe\&start=$i >> /tmp/raw
done

echo "Enter a number corresponding to the thing you want to sort by : 
- 1) title
- 2) votes
- 3) type
- 4) preparation time
- 5) cooking time
- 6) number for which the recipe is done"

read num
case $num in
	1)
		sed -n -f total.sed /tmp/raw | sort --field-separator=';' --key=1 |column -t -s ";"
		;;
	2)
		sed -n -f total.sed /tmp/raw | sort --field-separator=';' -rn --key=2 |column -t -s ";"
		;;
	3)
		sed -n -f total.sed /tmp/raw | sort --field-separator=';' --key=3 |column -t -s ";"
		;;
	4)
		sed -n -f total.sed /tmp/raw | sort --field-separator=';' -rn --key=4 |column -t -s ";"
		;;
	5)
		sed -n -f total.sed /tmp/raw | sort --field-separator=';' -rn --key=5 |column -t -s ";"
		;;
	6)
		sed -n -f total.sed /tmp/raw | sort --field-separator=';' -rn --key=6 |column -t -s ";"
		;;
esac
# Extract data from the HTML page, sorted by the column chosen.
