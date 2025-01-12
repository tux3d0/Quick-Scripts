#!/bin/bash

# Function to display a message with a border
display_message() {
    local message=$1
    local border="==============================================================================="
    echo -e "\n$border\n$message\n$border\n"
}

# Function to import SSH key
import_ssh_key() {
    local key_path=$1
    if [ -f "$key_path" ]; then
        cat "$key_path" >> ~/.ssh/authorized_keys
        display_message "SSH key imported successfully!"
    else
        display_message "Error: File not found at $key_path"
    fi
}

# Function to generate a new SSH key
generate_ssh_key() {
    local email=$1
    ssh-keygen -t ed25519 -C "$email" -f ~/.ssh/id_ed25519
    display_message "New SSH key generated successfully!"
}

# Function to display the menu
display_menu() {
    echo "1. Import an existing SSH key"
    echo "2. Generate a new SSH key"
    echo "3. Exit"
}

# Main script
while true; do
    clear
    display_message "SSH Key Manager"
    display_menu
    read -p "Choose an option: " option

    case $option in
        1)
            read -p "Enter the path to your SSH key: " key_path
            import_ssh_key "$key_path"
            ;;
        2)
            read -p "Enter your email for the new SSH key: " email
            generate_ssh_key "$email"
            ;;
        3)
            display_message "Goodbye!"
            exit 0
            ;;
        *)
            display_message "Invalid option. Please try again."
            ;;
    esac

    read -p "Press Enter to continue..."
done