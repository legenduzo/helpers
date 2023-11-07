#!/bin/bash

files=("$1"*)
main=""

echo "====== files ====="

for file in "${files[@]}"; do
    echo "$file"
    if [[ ! $file == *main* ]]; then
        pycodestyle "$file"
    else
	    main="$file"
    fi
    chmod +x "$file"
done

echo -e "\n\n\n\n\n"

echo "===== now executable ====="

echo -e "\n\n\n\n\n"

echo "===== function output ====="

if [[ -x $main ]]; then
    ./"$main"
fi
