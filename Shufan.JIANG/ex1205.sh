#!/bin/bash
function hello_arg {
	echo 'hello $1'
	echo "hello \$1"
	echo "hello $1"
}

function show_args {
  echo shell is $0
  echo $# args 
}

#hello_arg paris

#show_args a1 a2 "a 3"
for i in a b c ;do
  echo $i
done;
for i in "a b c" ;do
  echo $i
done;
for i in $(seq 1 10); do
 echo $i
done;
#is there a limit to the number of arguments?
show_args $(seq 1 20); 
#the answer is?
getconf ARG_MAX
# XD # well, sadly it works :/
show_args $(seq 1 2097253); 

