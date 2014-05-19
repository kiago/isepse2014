#!/bin/bash

echo "--------------------------------------------------"
echo "-----------------SHELL DICTIONARY-----------------"
echo "--------------------------------------------------"
echo "Welcome to Shell Dictionary. Please enter a word :"
read word
dictionaryUrl="http://www.oxforddictionaries.com/definition/english/"
wordUrl=$dictionaryUrl$word
curl $wordUrl > pagecode.txt

egrep -o '<span class="iteration">.*</span>' pagecode.txt > iterations.txt
egrep -o '<span class="definition">.*</span>' iterations.txt | sed -re 's/<span class="exampleGroup.*//g' -e 's/<div class="moreInformation">.*//g' -e 's/<span class="definition">//g' -e 's/.<\/span>//g' > definitions.txt

echo "--------------------------------------------------"
echo "----------------DEFINITIONS FOUND-----------------"
echo "--------------------------------------------------"
lineNumber=1
while read line
do
  echo -e "$lineNumber.\t $line\n"
  lineNumber=`expr $lineNumber + 1`
done < definitions.txt