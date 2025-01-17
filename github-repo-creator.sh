#!/bin/bash

# GitHub Repository Creator Script (Secure Version)
# This script automates the process of creating GitHub repositories using the GitHub API.
# Author: Sahil Naik

# Load environment variables from .env file
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
fi

# Check if required variables are set
if [ -z "$GITHUB_USERNAME" ] || [ -z "$GITHUB_TOKEN" ]; then
    echo "Error: GITHUB_USERNAME or GITHUB_TOKEN is not set. Please add them to the .env file."
    exit 1
fi

# Function to create a repository
create_repo() {
    echo -n "Enter repository name: "
    read -r REPO_NAME

    echo -n "Make the repository private? (yes/no): "
    read -r PRIVATE_FLAG

    echo -n "Add a README? (yes/no): "
    read -r ADD_README

    # Convert user inputs to boolean values
    PRIVATE=false
    [ "$PRIVATE_FLAG" = "yes" ] && PRIVATE=true

    AUTO_INIT=false
    [ "$ADD_README" = "yes" ] && AUTO_INIT=true

    # Make the API call to create the repository
    RESPONSE=$(curl -s -w "%{http_code}" -o /tmp/repo_response.json \
        -u "$GITHUB_USERNAME:$GITHUB_TOKEN" \
        -X POST https://api.github.com/user/repos \
        -d "{ \"name\": \"$REPO_NAME\", \"private\": $PRIVATE, \"auto_init\": $AUTO_INIT }")

    HTTP_CODE=$(tail -n1 <<< "$RESPONSE")

    if [ "$HTTP_CODE" -eq 201 ]; then
        echo "Repository '$REPO_NAME' created successfully!"
        jq '.' /tmp/repo_response.json
    else
        echo "Error: Failed to create repository. HTTP status code: $HTTP_CODE"
        jq '.' /tmp/repo_response.json
    fi

    rm -f /tmp/repo_response.json
}

# Main
create_repo

