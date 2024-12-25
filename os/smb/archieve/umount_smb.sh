#!/usr/bin/bash

path="/root/szl1160710"

# Get all IP addresses of the local machine
ip_addresses=$(hostname -I)

# Check if the IP addresses contain 172.27.8.146
if [[ $ip_addresses =~ (^| )172\.27\.8\.146($| ) ]]; then
    echo "Error: Execution on this machine is not allowed."
    exit 1
else
    echo "IP address check passed, other operations can be executed."
    # Add your other operations here
fi

# Prompt the user to confirm the execution
read -p "Are you sure to Umount ${path}? (y/n): " confirm

# Decide whether to execute based on user input
if [ "$confirm" == "y" ] || [ "$confirm" == "Y" ]; then
    echo "Starting execution"
    # Add the commands or scripts you want to execute here
    umount -f ${path}
    rm -rf ${path}
else
    echo "Execution cancelled"
    exit 1
fi
