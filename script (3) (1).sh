#!/bin/bash

# 1. Check if exactly two arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: ./convert.sh <number> <unit>"
    exit 1
fi

num="$1"
unit="$2"

# 2. Check if the number is negative
if [ "$num" -lt 0 ]; then
    echo "Number must be not be negative"
    exit 3
fi

# 3 & 4 & 5. Use case on the unit (supporting both lower and upper case)
case "$unit" in
    km|KM)
        res=$(( num * 1000 ))
        echo "$num km = $res m"
        ;;
    m|M)
        res=$(( num * 100 ))
        echo "$num m = $res cm"
        ;;
    h|H)
        res=$(( num * 60 ))
        echo "$num h = $res min"
        ;;
    min|MIN)
        res=$(( num * 60 ))
        echo "$num min = $res s"
        ;;
    kg|KG)
        res=$(( num * 1000 ))
        echo "$num kg = $res g"
        ;;
    *)
        echo "Unknown unit: $unit"
        echo "Units: km m h min kg"
        exit 2
        ;;
esac
