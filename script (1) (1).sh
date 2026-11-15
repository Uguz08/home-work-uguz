#!/bin/bash

# 1. Check if exactly one argument is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: ./leap.sh <year>"
    exit 1
fi

year="$1"

# 2. Check if year is 0 or less
if [ "$year" -le 0 ]; then
    echo "Year must be positive"
    exit 2
fi

# 3. Leap year condition: divisible by 400, or (divisible by 4 AND not divisible by 100)
if [ $((year % 400)) -eq 0 ] || { [ $((year % 4)) -eq 0 ] && [ $((year % 100)) -ne 0 ]; }; then
    echo "$year is a leap year (366 days)"
else
    echo "$year is not a leap year (365 days)"
after idle script