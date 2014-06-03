#!/bin/bash
#Please create a file named file1.txt and place the script at the same location
#and change the chmod of this script.sh file to execute it
echo "Beginning of the script"
find . -name file2.txt
find . -name file1.txt
chmod 600 file1.txt
echo "Change chmod to 600 for file1.txt"
mv file1.txt empty.txt
echo "Rename file1.txt to empty.txt"
find . -name "file1*"
find . -name "*.txt"
chmod 777 empty.txt
echo "Change chmod to 777 for empty.txt"
echo "End of the script"