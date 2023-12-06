#!/bin/bash

# A script to automate git commits
# Prints all authors apart from committer

message="$1"

username="$(git config user.name)"
useremail="$(git config user.email)"

IFS=$'\n' # Set internal field separator to newline

authors=$(git log --format='%aN <%aE>' | grep -v -F "$username <$useremail>" | sort -u)

coauthors=""

echo "$authors" | while read -r author; do
    if [ "$author" != "$username <$useremail>" ]; then
        coauthors="${coauthors}Co-authored-by: $author"$'\n'
    fi
done

unset IFS # Reset IFS

coauthors=$(echo -n "$coauthors")

git add .
git commit -m "$message" -m "" -m "" -m "$coauthors"
git push
