#!/bin/bash

# A script to automate git commits
# Prints all authors apart from committer

message="$1"

username="$(git config user.name)"
useremail="$(git config user.email)"

authors=$(git log --format='%aN <%aE>' | grep -v -F "$username <$useremail>" | sort -u)

coauthors=""

for author in $authors; do
    if [ "$author" != "$username <$useremail>" ]; then
        coauthors="${coauthors}Co-authored-by: $author"$'\n'
    fi
done

if [ -n "$coauthors" ]; then
    coauthors=$(echo "$coauthors" | sed '$d')
fi
git add .
git commit -m "$message" -m "" -m "" -m "$coauthors"
git push
