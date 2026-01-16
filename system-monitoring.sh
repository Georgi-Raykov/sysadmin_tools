#!/bin/bash

logfile="/var/log/system-monitoring.log"
date=$(date '+%Y-%m-%d %H:%M:%S')

CPU=$(top -bn1 | grep 'Cpu(s)' | awk '{print 100 - $8}')
RAM=$(free -m | grep 'Mem:' | awk '{printf "%.2f",$2/$3 * 100}')
DISK=$(df / | tail -n +2 | awk '{print $5}')
echo "$date | CPU: ${CPU}% | RAM: ${RAM}% | DISK: ${DISK}%" >> "$logfile"
