#!/bin/bash

# A script to automate git commits
# Prints all authors apart from committer

message="$1"
username="$(git config user.name)"
authors="$(git log --format='%aN <%aE>' | sort -u)"

if [ "$(echo "$authors" | wc -l)" -eq 1 ]; then
	commit_message="$message"
else
	commit_message="$message\n\n\nCo-authored-by: "

	for author in $authors; do
		if [ "$author" != "$username" ]; then
			commit_message="$commit_message$author\n"
		fi
	done
fi


git add .
git commit -m "$commit_message"
git push
