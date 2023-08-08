#!/bin/bash
#changes
# Associative array to map letters to their decimal values
declare -A letter_values
letter_values=(
    [a]=97 [b]=98 [c]=99 [d]=100 [e]=101 [f]=102 [g]=103 [h]=104
    [i]=105 [j]=106 [k]=107 [l]=108 [m]=109 [n]=110 [o]=111 [p]=112
    [q]=113 [r]=114 [s]=115 [t]=116 [u]=117 [v]=118 [w]=119 [x]=120
    [y]=121 [z]=122
)
sum=0
Summary_of_letters(){
letters=$@
  for letter in $letters; do
        if [[ ${letter_values[$letter]+_} ]]; then
            echo "$letter = ${letter_values[$letter]}"
             ((sum += ${letter_values[$letter]}))
        else
            echo "Invalid letter: $letter"
        fi
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
