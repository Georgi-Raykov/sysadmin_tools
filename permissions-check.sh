#!/bin/bash

DIR=${1:-$HOME}
logfile="$HOME/permission-check.log"
date=$(date "+%Y-%m-%d %H:%M:%S")

echo "=== $date | Permissionscheck in &DIR ===" >> "$logfile"

echo "Files and permissions:" >> "$logfile"
ls -l "$DIR" >> "$logfile"

echo "World writeable files:" >> "$logfile"
find "$DIR" -type f -perm -o=w >> "$logfile"

echo "World writeable directories:" >> "$logfile"
find "$DIR" -type d -perm -o=w >> "$logfile"

echo "Permission check done for $DIR. Results saved in $logfile"
