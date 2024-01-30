#!/bin/bash

# Set the GitHub repository owner and name
OWNER="mwanikigachanja"
REPO="binary_trees"

# Fetch contributors from the GitHub API
CONTRIBUTORS=$(curl -s "https://api.github.com/repos/$OWNER/$REPO/contributors" | jq -r '.[].login')

# Create or overwrite AUTHORS file
echo "# Author of $REPO" > AUTHORS
echo >> AUTHORS

# Loop through contributors and fetch their full names
for CONTRIBUTOR in $CONTRIBUTORS; do
    FULL_NAME=$(curl -s "https://api.github.com/users/$CONTRIBUTOR" | jq -r '.name')
    echo "$FULL_NAME (@$CONTRIBUTOR)" >> AUTHORS
done

echo "Check Authors list generated and saved to AUTHORS file."
