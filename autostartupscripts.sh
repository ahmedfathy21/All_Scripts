#!/bin/bash
#set -x
# To set up the desired script to run at startup using systemd and take the path of the desired script with the Rofi tool, you can follow these steps:

# 1. Create a systemd service file:
# Create a new service file in `/etc/systemd/system/` directory. For example, create a file named `custom-startup.service`:

sudo nano /etc/systemd/system/custom-startup.service

# Add the following content to the file:

cat <<EOL | sudo tee /etc/systemd/system/custom-startup.service
[Unit]
Description=Custom Startup Script

[Service]
ExecStart=/home/kakashi/test/scripts/autostartupscripts.sh
Type=oneshot

[Install]
WantedBy=multi-user.target
EOL

# 2. Modify your script to take the path from Rofi:
# Update your `/home/kakashi/test/scripts/autostartupscripts.sh` script to use Rofi to get the script path:

cat <<'EOF' > /home/kakashi/test/scripts/autostartupscripts.sh
#!/bin/bash
#set -x

# Get the script path using Rofi
SCRIPT_PATH=$(rofi -dmenu -p "Enter the path to your script:")

# Check if the script is executable
if [ -x "$SCRIPT_PATH" ]; then
     # Run the script
     "$SCRIPT_PATH"
else
     echo "Script $SCRIPT_PATH is not executable. Please check the permissions."
fi
EOF

# 3. Enable and start the systemd service:
# Enable the service to run at startup and start it immediately:

sudo systemctl enable custom-startup.service
sudo systemctl start custom-startup.service

# This setup will prompt you to enter the path of the desired script using Rofi when the system starts, and then execute the script if it is executable.