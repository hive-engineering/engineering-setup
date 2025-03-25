#!/usr/bin/env bash

# Common helper functions that can be used across all scripts

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to check if a file exists
file_exists() {
    [[ -f "$1" ]]
}

# Function to check if a directory exists
directory_exists() {
    [[ -d "$1" ]]
}

# Function to append to a file if the line doesn't exist
append_if_not_exists() {
    local file="$1"
    local line="$2"
    
    if ! grep -q "$line" "$file"; then
        echo "$line" >> "$file"
    fi
}

# Function to print a section header
print_section() {
    echo "----------------------------------------------------------------"
    echo "$1"
    echo "----------------------------------------------------------------"
} 