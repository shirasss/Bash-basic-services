#!/bin/bash

filename="$1"
if [ $# -lt 1 ]; then
   echo "error-invalid input"
   exit 1
elif [ $# -lt 2 ]; then
   delimiter=" "
else
   delimiter="$2"
fi

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



