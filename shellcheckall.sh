#!/bin/bash

correctcount=0
totalcount=0

if [[ $# -gt 1 ]]; then
    echo "ERROR: too many arguments." > /dev/stderr
    exit 1
fi

if [[ $# -eq 1 ]]; then
    while IFS= read -r -d $'\0' file; do 
        if shellcheck "$file"; then
            correctcount=$((correctcount+1))
        fi
        totalcount=$((totalcount+1))
    done < <(find "$1" -name '*.sh' -print0)
fi

if [[ $# -eq 0 ]]; then
    while IFS= read -r -d $'\0' file; do
        if shellcheck "$file"; then
            correctcount=$((correctcount+1))
        fi
        totalcount=$((totalcount+1))
    done < <(find "$(pwd)" -name '*.sh' -print0)
fi

echo "$correctcount out of $totalcount files passed shellcheck"