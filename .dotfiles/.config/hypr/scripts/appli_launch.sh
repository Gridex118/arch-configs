#!/bin/bash

if [[ "$2" != "--no-reset-submap" ]]; then
    echo "Hello"
    hyprctl dispatch submap reset
fi

# Run the application
$1
