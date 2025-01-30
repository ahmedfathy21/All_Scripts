#!/bin/bash
#set -x
alias_name=$(rofi -dmenu -p "Enter alias name:")
command=$(rofi -dmenu -p "Enter command for alias:")

if [ -n "$alias_name" ] && [ -n "$command" ]; then
    if [ -n "$ZSH_VERSION" ]; then
        echo "alias $alias_name='$command'" >> ~/.zshrc
        source ~/.zshrc
    elif [ -n "$BASH_VERSION" ]; then
        echo "alias $alias_name='$command'" >> ~/.bashrc
        source ~/.bashrc
    else
        echo "Unsupported shell."
        exit 1
    fi
    echo "Alias '$alias_name' added successfully."
else
    echo "Alias name or command cannot be empty."
fi