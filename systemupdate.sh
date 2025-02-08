#!/bin/bash
# set -x

LOG_FILE="/var/log/update.log"
echo "$(date) - Starting system update" >> $LOG_FILE
apt update && apt upgrade -y >> $LOG_FILE
apt autoremove -y >> $LOG_FILE
echo "$(date) - Update completed" >> $LOG_FILE