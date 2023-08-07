#!/bin/bash
if [ $# -lt 2 ];then
    echo "Invalid format of input"
    exit 1
fi
directory="$1"
if [ ! -d "$directory" ]; then
    echo "Directory not found: $directory"
    exit 1
fi

for url in "$@"; do
    if wget -q -P "$target_dir" "$url"; then
       current_date="$(date +"%Y%m%d_%H%M%S")"
       output_file="$directory/$(basename "$url")_${current_date}.jpg"
       curl -o "$output_file" -s "$url"
       if [ $? -eq 0 ]; then
          echo "Downloaded: $url"
       else
          echo "Failed to download: $url"
       fi
    fi
done
archive_filename="${directory}_$(date +"%Y%m%d_%H%M%S").zip"
zip -q -j "$archive_filename" "$directory"/*

echo "All images downloaded and archived as: $archive_filename"

