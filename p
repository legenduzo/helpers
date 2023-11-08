#!/bin/bash

files=("$1"*)
main=""
err_col='\e[38;5;220m'
default_col='\e[0m'

echo "====== files ====="

for file in "${files[@]}"; do
	echo "$file"
	if [[ ! $file == *main* ]]; then
		output=$(pycodestyle "$file")
		if [[ -n $output ]]; then
			echo -e "${err_col}$output${default_col}"
		fi
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
else
	echo -e "${err_col}No main file${default_col}"

fi
