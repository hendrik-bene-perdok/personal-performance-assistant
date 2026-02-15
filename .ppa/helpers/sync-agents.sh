#!/bin/bash
set -euo pipefail

# Determine script directory to allow running from anywhere
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
SOURCE_DIR_RAW="$SCRIPT_DIR/../../.github/agents"
DEST_DIR_RAW="$SCRIPT_DIR/../../.agent/workflows"

# Ensure destination directory exists
mkdir -p "$DEST_DIR_RAW"

# Resolve absolute paths
SOURCE_DIR="$(cd "$SOURCE_DIR_RAW" && pwd)"
DEST_DIR="$(cd "$DEST_DIR_RAW" && pwd)"

echo "Syncing agent definitions from '$SOURCE_DIR' to '$DEST_DIR'..."

# Synced flag
SYNCED_COUNT=0

# Copy files from source to destination
for file in "$SOURCE_DIR"/*.agent.md; do
    if [ -f "$file" ]; then
        if cp "$file" "$DEST_DIR/"; then
             # echo "Synced: $(basename "$file")"
             SYNCED_COUNT=$((SYNCED_COUNT + 1))
        else
             echo "Error: Failed to copy $(basename "$file")" >&2
             exit 1
        fi
    else
        echo "No .agent.md files found in '$SOURCE_DIR'."
        break
    fi
done

# Prune files in destination that are not in source
for file in "$DEST_DIR"/*.agent.md; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        source_path="$SOURCE_DIR/$filename"
        if [ ! -f "$source_path" ]; then
            if rm "$file"; then
                echo "Pruned: $filename (not in source)"
            else
                echo "Error: Failed to delete $filename" >&2
            fi
        fi
    fi
done

if [ "$SYNCED_COUNT" -eq 0 ]; then
    echo "Warning: No files were synced."
else
    echo "Sync complete. $SYNCED_COUNT files processed."
fi
