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

    # Check if the config file contains 0.0.0.0
    if grep -q "0.0.0.0" "$config_file"; then
        # Replace occurrences of 0.0.0.0with the new IP address
        sed -i "s/0.0.0.0/$ip_address/g" "$config_file"
        echo "0.0.0.0 has been replaced with $ip_address in $config_file."
    else
        # Append the IP address if 0.0.0.0 is not found
        echo "0.0.0.0 not found in $config_file."
        echo "ip_address=$ip_address" >> "$config_file"
        echo "New IP address has been added to $config_file."
    fi

    # Check if the config file contains ed34bacd
    if grep -q "replaceme" "$config_file"; then
        # Replace occurrences of replaceme with the new name
        sed -i "s/replaceme/$name/g" "$config_file"
        echo "replaceme has been replaced with $name in $config_file."
    else
        echo "replaceme not found in $config_file."
        echo "name=$name" >> "$config_file"
        echo "New name has been added to $config_file."
    fi
else
    echo "Invalid IP address format. Please enter a valid IP address."
fi
