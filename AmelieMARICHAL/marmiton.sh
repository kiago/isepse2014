#!/bin/bash

rm /tmp/raw
touch /tmp/raw

#asking for the recipe
echo "What recipe are you searching for? :"
read recipe

#retrieving the HTML content from the six first pages and putting it into a temp file
for i in {0..50..10}
do
	curl -s http://www.marmiton.org/recettes/recherche.aspx?aqt=$recipe\&start=$i >> /tmp/raw
done

#2nd question
echo "Enter a number corresponding to the thing you want to sort by : 
- 1) title
- 2) votes
- 3) type
- 4) preparation time
- 5) cooking time
- 6) number for which the recipe is done"

read num

#introducing the variable re, in order to specify the range possible (1 to 6). It's then used into a regex to prevent errors (wrong element entered by the user). 
re='^[1-6]$'
while ! [[ $num =~ $re ]]; do
	echo "You didn't enter the right command, please try again!";
	read num;
done

#Depending on the number entered, the user accesses the results sorted by the colomn chosen. 
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

# the result : extracted data from the HTML page, sorted by the column chosen.
