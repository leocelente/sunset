#!/usr/bin/env bash
dir=/home/leocelente/timelapse/
sunset_time=`python3 ${dir}sunset.py -1`
at $sunset_time -f ${dir}timelapse.sh
