#!/bin/bash


//nnnn

filename="$1"
delimiter="$2"

i=1
if [ ! -f "$filename" ]; then
    echo "File not found: $filename"
    exit 1
fi

while IFS="$delimiter" read -ra words; do
    for word in "${words[@]}"; do
         echo "field $i: $word"
        ((i=i+1))
    done
done < "$filename"



