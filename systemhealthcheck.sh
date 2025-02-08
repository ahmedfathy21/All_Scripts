#!/bin/bash
#set -x

output=$(cat <<EOF
=== Disk Usage ===
$(df -h | grep -v tmpfs)

=== Memory Usage ===
$(free -h)

=== Top Processes ===
$(ps aux --sort=-%mem | head -n 5)
EOF
)

echo "$output" | rofi -dmenu -i -p "System Health Check"