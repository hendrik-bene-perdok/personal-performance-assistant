#!/bin/bash
set -euo pipefail

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

# Synced flag
SYNCED_COUNT=0

# Copy files
for file in "$SOURCE_DIR"/*.agent.md; do
    if [ -f "$file" ]; then
        if cp "$file" "$DEST_DIR/"; then
             echo "Synced: $(basename "$file")"
             ((SYNCED_COUNT++))
        else
             echo "Error: Failed to copy $(basename "$file")" >&2
             exit 1
        fi
    else
        echo "No .agent.md files found in '$SOURCE_DIR'."
        break
    fi
done

if [ "$SYNCED_COUNT" -eq 0 ]; then
    echo "Warning: No files were synced."
else
    echo "Sync complete. $SYNCED_COUNT files processed."
fi
