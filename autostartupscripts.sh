#!/bin/bash
#set -x

# Get the script path using Rofi
SCRIPT_PATH=$(rofi -dmenu -p "Enter the path to your script:")

# Check if the script path is not empty
if [ -z "$SCRIPT_PATH" ]; then
    echo "No script path provided. Exiting."
    exit 1
fi

# Check if the script exists
if [ ! -f "$SCRIPT_PATH" ]; then
    echo "Script $SCRIPT_PATH does not exist. Please check the path."
    exit 1
fi

# Check if the script is executable
if [ -x "$SCRIPT_PATH" ]; then
    # Run the script
    "$SCRIPT_PATH"
else
    echo "Script $SCRIPT_PATH is not executable. Please check the permissions."
    exit 1
fi
