#!/usr/bin/env bash
# WebCam Parameters
device=/dev/video2
resolution=640x480
delay=2

delta_time=10
# Time between pictures (considering camera "warm up" delay)
sleep_time=$(($delta_time - ${delay}));


# Function definitions

function take_photo() {
  current_date=`date +"%F"`
  current_time=`date +"%F-%H-%M-%S"`
  filename="${current_date}/${current_time}.jpg"

  if [[ ! -d "${current_date}" ]]; then
    mkdir -p "${current_date}";
  fi

  echo "Taking photo to file '${filename}'";
  sleep "${delay}";
  touch "${filename}";
}

pictures_in_2hours=$(( 7200 / $delta_time ));

for i in $(seq 1 $pictures_in_2hours); do 
  sleep 8 
  take_photo
done
