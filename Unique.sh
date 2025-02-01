#!/bin/bash

# Usage function
usage() {
    echo "Usage: $0 input_file output_file [-v]"
    echo "Filter unique lines from a text file."
    echo "-v  Enable verbose mode to see processing details."
    exit 1
}

# Check arguments
if [ $# -lt 2 ]; then
    usage
fi

INPUT_FILE="$1"
OUTPUT_FILE="$2"
VERBOSE=false

# Enable verbose mode if -v flag is present
if [ "$3" == "-v" ]; then
    VERBOSE=true
fi

# Check if input file exists
if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: Input file '$INPUT_FILE' not found!"
    exit 1
fi

# Filter unique lines
if $VERBOSE; then
    echo "[*] Filtering unique lines from '$INPUT_FILE'..."
fi

# Use sort and uniq to filter duplicates
sort "$INPUT_FILE" | uniq > "$OUTPUT_FILE"

if $VERBOSE; then
    echo "[*] Unique lines saved to '$OUTPUT_FILE'."
    echo "---- Extracted Unique Lines ----"
    cat "$OUTPUT_FILE"
    echo "-------------------------------"
fi

echo "Filtering complete."
