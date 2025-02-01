#!/bin/bash

# Define the location of the notes file
NOTES_FILE="/home/kakashi/test/scripts/notes.txt"

# Function to add a note
add_note() {
    local note=$(rofi -dmenu -p "Add Note")
    if [ -n "$note" ]; then
        echo "$note" >> "$NOTES_FILE"
        notify-send "Note added" "$note"
    fi
}

# Function to search notes in realtime
search_notes() {
    local query=""
    while true; do
        query=$(echo "$query" | rofi -dmenu -p "Search Notes")
        if [ -z "$query" ]; then
            break
        fi
        local results=$(grep -i "$query" "$NOTES_FILE")
        if [ -n "$results" ]; then
            echo "$results" | rofi -dmenu -p "Search Results"
        else
            notify-send "No results found for" "$query"
        fi
    done
}

# Function to delete a note
delete_note() {
    local note=$(cat "$NOTES_FILE" | rofi -dmenu -p "Delete Note")
    if [ -n "$note" ]; then
        grep -vF "$note" "$NOTES_FILE" > "$NOTES_FILE.tmp" && mv "$NOTES_FILE.tmp" "$NOTES_FILE"
        notify-send "Note deleted" "$note"
    fi
}

# Main menu
action=$(echo -e "Add Note\nSearch Notes\nDelete Note" | rofi -dmenu -p "Select Action")

case "$action" in
    "Add Note")
        add_note
        ;;
    "Search Notes")
        search_notes
        ;;
    "Delete Note")
        delete_note
        ;;
    *)
        notify-send "Invalid action" "$action"
        ;;
esac