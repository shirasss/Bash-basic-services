#!/bin/bash
if [ $# -lt 2 ]; then
    echo "Invalid format of input"
    exit 1
fi

directory="$1"
echo $1
if [ ! -d "$directory" ]; then
    echo "Directory not found: $directory"
    exit 1
fi
for url in "${@:2}"; do
    if curl -o "${directory}/$(basename "$url")_$(date +"%Y%m%d_%H%M%S").jpg" -s -L "$url"; then
        echo "Downloaded: $url"
    else
        echo "Failed to download: $url"
    fi
done

archive_filename="${directory}_$(date +"%Y%m%d_%H%M%S").zip"

zip -q -j "$archive_filename" "$directory"
