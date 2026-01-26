#!/bin/bash

echo "******SYSTEM STATUS******"
echo ""

echo "Disk usage"
df -h /
echo ""

echo "Memory usage"
free -h
echo ""

echo "System load"
uptime
echo ""

load=$(uptime | awk -F 'load average:' '{ print $2 }' | cut -d',' -f1)
load=${load// /}
cpu_cores=$(nproc)
load_int=$(echo "$load * 100" | bc | cut -d'.' -f1)
cpu_int=$((cpu_cores * 100))

if [ "$load_int" -gt "$cpu_int" ]; then
    echo "⚠️ High Load! Load=$load, CPU cores=$cpu_cores"
else
  echo "✅ Load OK. Load=$load, CPU cores=$cpu_cores"
fi


