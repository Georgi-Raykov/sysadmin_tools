#!/bin/bash
treshold=1
df -h | tail -n +2 | while read fs size used avail percent mount
do
  usage=${percent%\%}
  if [ "$usage" -ge "$treshold" ]; then

    echo "$DATE WARNING: Disk $mount is full at $usage%"
  fi
done
