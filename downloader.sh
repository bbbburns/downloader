#!/bin/sh
# Download a set of files and log the download speed
# Discard the files downloaded
# Repeat

LOG="/var/log/download.txt"
FILES=(
    "https://cloud.centos.org/centos/8/x86_64/images/CentOS-8-Container-8.1.1911-20200113.3-layer.x86_64.tar.xz"
    "https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud-20141129_01.qcow2"
    "https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud-1508.qcow2c" )

FORMAT="%{json}\n"

for FILE in ${FILES[@]}; do
  echo "`date '+%F %T'`: Starting download with 1200 sec timeout" >> $LOG
  curl -s --show-error --max-time 1200 -o /dev/null -w "$FORMAT" $FILE >> $LOG 2>&1
  echo "`date '+%F %T'`: Exited from download\n" >> $LOG
  sleep 3
done

