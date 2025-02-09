#!/bin/bash

# Function to install a package if it is not installed
install_if_not_present() {
    PACKAGE=$1
    if ! command -v "$PACKAGE" &> /dev/null
    then
        echo "$PACKAGE could not be found, installing it now..."
        sudo snap update
        sudo snap install -y "$PACKAGE"
    fi
}

# Check and install youtube-dl if not present
install_if_not_present youtube-dl

# Check and install rofi if not present
install_if_not_present rofi

# Get URL using rofi
URL=$(rofi -dmenu -p "Enter YouTube URL:")

# Check if URL is provided
if [ -z "$URL" ]
then
    echo "No URL provided."
    exit
fi

# Get download location using rofi
DOWNLOAD_LOCATION=$(rofi -dmenu -p "Enter download location:")

# Check if download location is provided
if [ -z "$DOWNLOAD_LOCATION" ]
then
    echo "No download location provided."
    exit
fi

# Download the video to the specified location
youtube-dl -o "$DOWNLOAD_LOCATION/%(title)s.%(ext)s" "$URL"

echo "Download completed."