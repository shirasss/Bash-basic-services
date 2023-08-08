#!/bin/bash

declare -A num_map=(
  [1]="one"
  [2]="two"
  [3]="three"
  [4]="four"
  [5]="five"
  [6]="six"
  [7]="seven"
  [8]="eight"
  [9]="nine"
  [10]="ten"
)

declare -A count_map

echo "Enter numbers between 1 and 10 (press Ctrl+D to finish):"

while read -r num; do
  if [[ "$num" =~ ^[1-9]$|^10$ ]]; then
    if [[ -n "${count_map[$num]}" ]]; then
      count_map[$num]=$((count_map[$num] + 1))
    else
      count_map[$num]=1
    fi
  else
    echo "Invalid input: $num (Ignoring)"
  fi
done

echo "Number statistics:"
for num in "${!count_map[@]}"; do
  word="${num_map[$num]}"
  count="${count_map[$num]}"
  echo "$word appeared $count times"
done
