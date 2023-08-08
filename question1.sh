#!/bin/bash
#ensures that there are at least 2 arguments
if [ $# -lt 2 ]; then
    echo "Invalid format of input: enter a dir's path,images url"
    exit 1
fi

directory="$1"
#ensures that the directory exists 
if [ ! -d "$directory" ]; then
    echo "Directory not found: $directory"
    exit 1
fi
#downloads the pictures to the given directory
for url in "${@:2}"; do
    if wget --no-check-certificate -P "$directory" "$url";then
    #if curl -o "${directory}/$(basename "$url")_$(date +"%Y%m%d_%H%M%S").jpg" -s -L "$url"; then
        echo "Downloaded"
    else
        echo "Failed to download"
    fi
done

#creating the zip directory
archive_filename="${directory}_$(date +"%Y%m%d_%H%M%S").zip"
zip -q -j "$archive_filename" "$directory"/*



