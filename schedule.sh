#!/usr/bin/env bash
dir=/home/leocelente/timelapse
sunset_time=`python3 ${dir}/sunset.py -1`
echo 'bash ${dir}/timelapse.sh' | at $sunset_time 
