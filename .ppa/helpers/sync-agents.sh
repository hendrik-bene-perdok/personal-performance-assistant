#!/bin/bash

# Determine script directory to allow running from anywhere
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
SOURCE_DIR="$SCRIPT_DIR/../../.github/agents"
DEST_DIR="$SCRIPT_DIR/../../.agent/workflows"

# Ensure destination directory exists
mkdir -p "$DEST_DIR"

echo "Syncing agent definitions from '$SOURCE_DIR' to '$DEST_DIR'..."

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory '$SOURCE_DIR' does not exist."
    exit 1
fi

# Copy files
count=0
for file in "$SOURCE_DIR"/*.agent.md; do
    if [ -f "$file" ]; then
        if cp "$file" "$DEST_DIR/"; then
            echo "Synced: $(basename "$file")"
            ((count++))
        else
            echo "Error: Failed to copy $(basename "$file")"
        fi
    else
        echo "No .agent.md files found in '$SOURCE_DIR'."
    fi
done

echo "Sync complete. $count files synced."
