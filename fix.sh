#!/bin/bash

# Loop through all symlinks in the current directory and subdirectories
find . -type l | while read symlink; do
    # Get the target of the symlink
    target=$(readlink "$symlink")

    # Check if the target exists
    if [ -e "$target" ]; then
        # Copy the target to the location of the symlink
        cp -r "$target" "$(dirname "$symlink")/"
        # Remove the symlink
        rm "$symlink"
    else
        echo "Target for symlink $symlink does not exist: $target"
    fi
done
