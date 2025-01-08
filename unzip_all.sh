#!/usr/bin/env bash

DIRECTORY="$1"


if [ ! -d "$DIRECTORY" ]; then
	echo "Error: Directory $DIRECTORY does not exist"
	exit 1
fi

if ! ls "$DIRECTORY"/*.zip >/dev/null 2>&1; then
	echo "No zip files found in $DIRECTORY."
	exit 0
fi 


for file in "$DIRECTORY"/*.zip; do	
	dir_name="{$DIRECTORY%.zip}"
	mkdir -p "$dir_name"
	unzip -q "$file" -d "$dir_name" 
	echo "Extracted $file to $dir_name/"
done	


