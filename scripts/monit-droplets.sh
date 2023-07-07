#!/bin/bash
{ hostname ; date ; free -h ; docker ps -a ; last | head ; ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 8 ;} > ~/logs/docker-host2.txt
echo "CPU usage %" >> ~/logs/docker-host1.txt
top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}' >> ~/logs/docker-host1.txt
sudo certbot certificates | grep 'Expiry\|Domains'  >> ~/logs/docker-host1.txt
cd ~/logs 
/usr/bin/git pull 
/usr/bin/git add --all . 
/usr/bin/git commit -m "hourly crontab logs from docker host 1 `date`"
/usr/bin/git push origin master:master
