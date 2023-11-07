#!/bin/bash

files=($1*)
main="$1"*main*

echo "====== files ====="

for file in "${files[@]}"; do
    echo "$file"
    if [[ ! $file == *main* ]]; then
        pycodestyle "$file"
    fi
    chmod +x "$file"
done

echo "                                          "
echo "                                          "
echo "                                          "
echo "                                          "
echo "                                          "

echo "===== now executable ====="

echo "                                          "
echo "                                          "
echo "                                          "
echo "                                          "
echo "                                          "

echo "===== function output ====="

if [[ -x $main ]]; then
    ./"$main"
fi
