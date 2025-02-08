#!/bin/bash
# password_check.sh

# Prompt for password using rofi
PASS=$(rofi -dmenu -password -p "Enter password: ")

# Check password complexity
if echo "$PASS" | grep -qP '^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$'; then
    RESULT="Strong"
else
    RESULT="Weak"
fi

# Encrypt the password
ENCRYPTED_PASS=$(echo -n "$PASS" | openssl enc -aes-256-cbc -a -salt -pass pass:somepassword)

# Display the result and encrypted password using rofi
echo -e "Password complexity: $RESULT\nEncrypted password: $ENCRYPTED_PASS" | rofi -dmenu -p "Result"