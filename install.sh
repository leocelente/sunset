#!/usr/bin/env bash

function check_dependency(){
  if command -v $1 &> /dev/null; then
    echo "Found $1";
  else
    echo "$1 Not Installed";
    exit 1;
  fi
}
check_dependency "at"
check_dependency "fswebcam"

chmod +x timelapse.sh
dir=`pwd`

(crontab -l ; echo "@daily at `python3 ${dir}/sunset.py -1` -f ${dir}/timelapse.sh")| crontab -
