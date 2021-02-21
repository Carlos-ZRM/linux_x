#!/bin/bash

# Check if log file exist 
if [ ! -f "/var/log/dig_cron.log" ]; then
  touch /var/log/dig_cron.log
fi
# Check if host db exist
if [ ! -f "/etc/dig_cron/hosts.db" ]; then 
  echo "Error " | awk  '{ printf("%s %s File /etc/dig_cron/hosts.db not exist",  systime() , $1 )}' >> /var/log/dig_cron.log 
  exit 1
fi
dig -f /etc/dig_cron/hosts.db ANY +noall +answer +timeout=10  |awk -F ' ' '{printf("%s INFO %s %s %s %s %s\n", systime() , $1, $2, $3 , $4, $5) }'  >>  /var/log/dig_cron.log
