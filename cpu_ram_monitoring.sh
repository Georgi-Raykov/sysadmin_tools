#!/bin/bash
logfile="$HOME/cpu_ram_monitoring.log"
echo "****$(date '+%Y-%m-%d %H:%M:%S')****" >> $logfile
echo "Top 5 process by CPU" >> $logfile
ps aux --sort=-%cpu | head -n 6 >> $logfile
echo "Top process by RAM" >> $logfile
ps aux --sort=-%mem | head -n 6 >> $logfile
echo "----------------" >> $logfile

