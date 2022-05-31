#!/usr/bin/env bash
# WebCam Parameters
device=/dev/video2
resolution=640x480
delay=10

# Time between pictures (considering camera "warm up" delay)


# Function definitions

function take_photo() {
  current_date=`date +"%F"`
  current_time=`date +"%F-%H-%M-%S"`
  filename="${current_date}/${current_time}.jpg"

  if [[ ! -d "${current_date}" ]]; then
    mkdir -p "${current_date}";
  fi

  fswebcam -r ${resolution} -d ${device} --delay ${delay} ${filename}

}

pictures_in_2hours=$(( 7200 / $delay));

for i in $(seq 1 $pictures_in_2hours); do 
  take_photo
done

ffmpeg -framerate 24 -pattern_type glob -i "${current_date}/*.jpg" -s:v 640x480 -c:v libx264 -crf 17 -pix_fmt yuv420p ${current_date}.mp4
