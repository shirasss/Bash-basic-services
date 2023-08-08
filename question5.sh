  GNU nano 6.2                                        exe5.sh *                                               
#! /bin/bash


declare -A matrix


function generate_random_number {
        echo $(( (RANDOM % 100) + 1 ))
}


for ((i=0; i<matrix_size; i++)); do
        for ((j=0; j<matrix_size; j++)); do
                matrix[$i,$j]=$(generate_random_number)
        done
done


for ((i=0; i<matrix_size; i++)); do
        for ((j=0; j<matrix_size; j++)); do
                printf "%3d" ${matrix[$i,$j]}
        done
        echo
done

