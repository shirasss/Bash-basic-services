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
  for digit in $(echo "$num" | grep -o .); do
    if [[ "$digit" =~ ^[1-9]$|^10$ ]]; then
      if [[ -n "${count_map[$digit]}" ]]; then
        count_map[$digit]=$((count_map[$digit] + 1))
      else
        count_map[$digit]=1
      fi
    else
      echo "Invalid input: $digit (Ignoring)"
    fi
  done
done

echo "Number statistics:"

for num in "${!count_map[@]}"; do
  word="${num_map[$num]}"
  count="${count_map[$num]}"
  echo "$word appeared $count times"
done
