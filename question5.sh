#! /bin/bash



#declare the array
declare -A matrix

#return random number
function generate_random_number {
        echo $(( (RANDOM % 100) + 1 ))
}


matrix_size=$(generate_random_number)

#initail the array 
for ((i=0; i<matrix_size; i++)); do
        for ((j=0; j<matrix_size; j++)); do
                matrix[$i,$j]=$(generate_random_number)
        done
done

#print the arry
for ((i=0; i<matrix_size; i++)); do
        for ((j=0; j<matrix_size; j++)); do
#	print in 3d format               
 printf "%3d" ${matrix[$i,$j]}
        done
        echo
done

