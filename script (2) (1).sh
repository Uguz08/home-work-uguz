#!/bin/bash

# 1. Check if exactly one argument is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: ./backup.sh <file>"
    exit 1
fi

filename="$1"

# 2. Check file conditions (order matters based on hints/specifications)
if [ ! -e "$filename" ]; then
    echo "Not found: $filename"
    exit 2
fi

if [ -d "$filename" ]; then
    echo "$filename is a directory, not a file"
    exit 3
fi

if [ ! -r "$filename" ]; then
    echo "Cannot read: $filename"
    exit 4
fi

# 3. Save today's date in YYYY-MM-DD format
todays_date=$(date +%F)

# 4. Copy the file to <name>.<date>.bak
dest="${filename}.${todays_date}.bak"
cp "$filename" "$dest"

# 5. Compute size and print success message
size=$(wc -c < "$dest")
echo "Backup created: $dest ($size bytes)"
