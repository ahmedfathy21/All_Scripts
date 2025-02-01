#!/bin/bash
#set -x
# Get the directory to save the CPU info using rofi
output_dir=$(rofi -dmenu -p "Choose directory to save CPU info:")

# Check if the directory exists
if [ -d "$output_dir" ]; then
    # Get CPU info and save it to a file in the chosen directory
    lscpu > "$output_dir/cpuinfo.txt"
    echo "CPU info saved to $output_dir/cpuinfo.txt"
else
    echo "Directory does not exist."
fi
