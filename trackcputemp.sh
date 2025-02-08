#!/bin/bash
#set -x

# Function to install a package if not already installed
install_if_not_found() {
    if ! command -v $1 &> /dev/null; then
        echo "$1 command not found. Installing $2 package..."
        sudo apt-get update && sudo apt-get install -y $2
    fi
}

# Check and install sensors command
install_if_not_found sensors lm-sensors

# Check and install play command
install_if_not_found play sox

# Get the temperature of Core 0
TEMP=$(sensors | grep 'Core 0' | awk '{print $3}' | cut -c2-3)

# Check if TEMP is a valid number
if ! [[ $TEMP =~ ^[0-9]+$ ]]; then
    echo "Failed to get CPU temperature."
    exit 1
fi

# Check if temperature exceeds threshold
if [ $TEMP -gt 80 ]; then
    notify-send "🔥 CPU Overheat: ${TEMP}°C"
    
    # Play alarm sound
    play alarm.wav
fi