#!/bin/sh

for candidate in "$RIEMANN_CONFIG_FILE" riemann.config main.clj; do
    config_file="$HOME/$candidate"
    if [ -f "$config_file" ]; then
        echo "$config_file"
        exit 0
    fi
done

echo "Cannot find suitable config file" >&2
echo "Please set RIEMANN_CONFIG_FILE" >&2
exit 1
