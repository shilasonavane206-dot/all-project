#!/bin/bash

create_directory() {
	mkdir demo
} 

if ! create_directory; then
	echo "The directory alrady exit"
	exit 1
fi
echo "this should not work beasuse code is iterrupted"
