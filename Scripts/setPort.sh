#!/bin/bash

# Prompt the user for the new SSH port
read -p "Enter the new SSH port: " new_port

# Validate the input
if ! [[ "$new_port" =~ ^[0-9]+$ ]] || [ "$new_port" -le 0 ] || [ "$new_port" -gt 65535 ]; then
    echo "Invalid port number. Please enter a number between 1 and 65535."
    exit 1
fi

# Update the SSH configuration file
sudo sed -i "s/^#Port 22/Port $new_port/" /etc/ssh/sshd_config

# Restart the SSH service to apply the changes
sudo systemctl restart sshd

echo "SSH port has been updated to $new_port."