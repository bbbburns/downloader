#!/bin/bash
# Download a set of files and log the download speed
# Discard the files downloaded
# Repeat

LOG="/var/log/download.txt"
FILES=(
    "http://download.nutanix.com/calm/CentOS-7-x86_64-1810.qcow2"
    "https://storage.googleapis.com/ntnx-td-image-repo/UbuntuDesktop1604-1360.qcow2"
    "https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud-20141129_01.qcow2" )

FORMAT="%{json}\n"

for FILE in ${FILES[@]}; do
  echo "`date '+%F %T'`: Starting download with 1200 sec timeout" >> $LOG
  curl -s --show-error --max-time 1200 -o /dev/null -w "$FORMAT" $FILE >> $LOG 2>&1
  echo "`date '+%F %T'`: Exited from download\n" >> $LOG
  sleep 3
done

