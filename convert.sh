#!/bin/bash
name="${1%.*}"

ffmpeg -y -i "$1" \
-vf "transpose=2,vflip,scale=128:160" \
-r 16 -pix_fmt yuvj420p -c:v mjpeg -q:v 4 \
-c:a pcm_s16le -ac 2 -ar 22050 \
"$name"-shenju18.avi

if [ $? -eq 0 ]; then
  echo "$name-shenju18.avi created"
else
  echo "Conversion failed"
fi
