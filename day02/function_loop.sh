
#!/bin/bash

#this is a if else condition

#fuction loop copy

function name_change(){

read -p "$1 Enter the name: " name
read -p "$1 Enter how many loves you: " other

if [[ $name == "buboo" ]];
then
	echo "$1 your write anser"
elif [[ $other -ge 100 ]];
then
	echo "$1 second answer is correct"
else
	echo "$1 Your answer is wrong! plese try again"
fi

}
name_change "piyu"




