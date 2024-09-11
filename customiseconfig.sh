#!/bin/bash

# Set the config file path
config_file="config_gpo.json"

# Prompt the user for an IP address
read -p "Please enter an IP address of the Tally Arbiter Server: " ip_address

# Prompt the user for a name
read -p "Please enter a name for this listener e.g. tally01: " name

# Validate the IP address format using regex (basic check)
if echo "$ip_address" | grep -Eq '^([0-9]{1,3}\.){3}[0-9]{1,3}$'; then
    echo "IP address is valid."

    # Check if the config file contains 127.0.0.1
    if grep -q "127.0.0.1" "$config_file"; then
        # Replace occurrences of 127.0.0.1 with the new IP address
        sed -i "s/127.0.0.1/$ip_address/g" "$config_file"
        echo "127.0.0.1 has been replaced with $ip_address in $config_file."
    else
        # Append the IP address if 127.0.0.1 is not found
        echo "127.0.0.1 not found in $config_file."
        echo "ip_address=$ip_address" >> "$config_file"
        echo "New IP address has been added to $config_file."
    fi

    # Check if the config file contains ed34bacd
    if grep -q "ed34bacd" "$config_file"; then
        # Replace occurrences of ed34bacd with the new name
        sed -i "s/ed34bacd/$name/g" "$config_file"
        echo "ed34bacd has been replaced with $name in $config_file."
    else
        echo "ed34bacd not found in $config_file."
        echo "name=$name" >> "$config_file"
        echo "New name has been added to $config_file."
    fi
else
    echo "Invalid IP address format. Please enter a valid IP address."
fi
