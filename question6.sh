#!/bin/bash

declare -A users_matrix


# Read system users file
i=0;

num_columns=7 
while IFS= read -r line; do
    IFS=':' read -a user <<< "$line"
    for ((j=0;j<=num_columns;j++)) do
	
        users_matrix[$i,$j]=${user[$j]}
     done
    ((i++))
done < /etc/passwd

echo "after for"
echo $user_matrix
for((k=0; k<i; k++)); do
	for((j=0; j<num_columns; j++)); do
		printf "%15s\t" ${users_matrix[$k,$j]}
	done 
	echo
done



