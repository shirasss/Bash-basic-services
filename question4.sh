#!/bin/bash
# Associative array to map letters to their decimal values
sum=0
Summary_of_letters(){
letters=$@
  for letter in $letters; do
  for ((i = 0; i < ${#letter}; i++)); do
    	char="${letter:i:1}"
        if [[ $(printf "%d" "'$char") ]]; then
            echo "$char = $(printf "%d" "'$char")"
             ((sum += $(printf "%d" "'$char")))
        else
            echo "Invalid letter: $letter"
        fi
	done
    done
}
if [[ $# -gt 0 ]]; then
    # User provided letters as command-line arguments
    Summary_of_letters "$@"
else
    # Read letters interactively
    echo "Enter alphabetical letters (separated by spaces):"
    read -r letters
    Summary_of_letters "$letters"
  
fi
echo "Sum of decimal values: $sum"
