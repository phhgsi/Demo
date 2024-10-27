#!/bin/bash

# Loop through all symlinks in the current directory and subdirectories
find . -type l | while read symlink; do
    # Get the target of the symlink
    target=$(readlink -f "$symlink")  # Use -f to resolve to an absolute path

    # Check if the target exists
    if [ -e "$target" ]; then
        # Get the directory of the symlink
        symlink_dir=$(dirname "$symlink")
        # Copy the target to the symlink's directory
        cp -r "$target" "$symlink_dir/"
        # Remove the symlink
        rm "$symlink"
    else
        echo "Target for symlink $symlink does not exist: $target"
    fi
done
