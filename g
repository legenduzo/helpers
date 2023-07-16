#!/bin/bash

# A script to automate git commits

# Extract the message from the standard input
message="$1"

git add .
git commit -m "$message"
git push
