#!/bin/bash

# Set the LC_CTYPE environment variable to avoid the locale warning
export LC_CTYPE="en_US.UTF-8"

# SSH password (replace 'your_password' with your actual password)
ssh_password=

# Define the SSH server and path
remote_server="hk5kp@rivanna.hpc.virginia.edu"
remote_path="/home/hk5kp/Desktop/NoahMP401_korea_1km/test_outputs/SURFACEMODEL/"
local_path="/Users/hyunglokkim/Downloads/SURFACEMODEL/"


# Log file to keep track of downloaded files
log_file="$local_path/download_log.txt"

# Function to download files using rsync
download_files() {
  rsync -avz --progress -e "sshpass -p $ssh_password ssh -o StrictHostKeyChecking=no" \
    "$remote_server:$remote_path" "$local_path" >> "$log_file" 2>&1
}

# Create the log file
touch "$log_file"

# Run the download function
download_files

echo "Download completed. Log file: $log_file"
