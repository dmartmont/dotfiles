#!/bin/bash

# Specifying the icon(s) in the script
# This allows us to change its appearance conditionally

icon=""

pgrep -x redshift &> /dev/null
if [[ $? -eq 0 ]]; then
    temp=$(redshift -p 2>/dev/null | grep temp | cut -d' ' -f3)
    temp=${temp//K/}
fi

# OPTIONAL: Append ' ${temp}K' after $icon
if [[ -z $temp ]]; then
    echo "%{F#858585}$icon"       # Greyed out (not running)
else
    echo "%{F#ffcb6b}$icon"       # Orange
fi
