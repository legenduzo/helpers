#!/bin/bash

# Ensure the script received an argument.
if [ -z "$1" ]; then
  echo "Usage: $0 /path/to/video"
  exit 1
fi

# Accept the video path as an argument.
VIDEOPATH="$1"
VIDEONAME=$(basename "$VIDEOPATH")
FOLDERPATH=$(dirname "$VIDEOPATH")
OUTPUTPATH="${FOLDERPATH}/${VIDEONAME%.*}_cmprsd.mp4"

# Perform the video compression with ffmpeg.
ffmpeg -i "$VIDEOPATH" -vcodec libx264 -crf 24 -preset veryfast -movflags +faststart -profile:v main -g 48 -keyint_min 48 -sc_threshold 0 -bf 3 -b_strategy 2 -ar 48000 -ac 2 -acodec aac -b:a 128k "$OUTPUTPATH"

# Check if ffmpeg command was successful.
if [ $? -ne 0 ]; then
  echo "Error compressing the video."
  exit 1
fi

echo "Compression successful. Compressed video saved as $OUTPUTPATH."
exit 0