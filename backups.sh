#!/bin/bash

if [ $# -ne 2 ]; then

  echo "Usage: $0 <folder_name> <archive_name>"

  exit 1
fi

DIR_SOURCE="$1"
ARCHIVE="$2"

if [ ! -d "$DIR_SOURCE" ]; then

  echo "Error: Folder $DIR_SOURCE does not exist"

  exit 2
fi

tar -czf "$ARCHIVE" "$DIR_SOURCE"

if [ $? -eq 0 ]; then

  echo "The archive is  created successfully"
else
  echo "Error creating archive!"
