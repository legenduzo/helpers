#!/bin/bash

# Function to print script usage
usage() {
  echo "Usage: $0 /path/to/video [-s or --speed <speed e.g 2>]"
  exit 1
}

# Ensure the script received at least one argument.
if [ $# -lt 1 ]; then
  usage
fi

# Default speed
SPEED=1

# Parse the arguments
while [[ $# -gt 0 ]]; do
  key="$1"
  case $key in
    -s|--speed)
      SPEED="$2"
      shift # past argument
      shift # past value
      ;;
    *)    # Assume it's the video path
      VIDEOPATH="$1"
      shift # past argument
      ;;
  esac
done

# Ensure video path is provided
if [ -z "$VIDEOPATH" ]; then
  usage
fi

# Extract video name and folder path
VIDEONAME=$(basename "$VIDEOPATH")
FOLDERPATH=$(dirname "$VIDEOPATH")
OUTPUTPATH="${FOLDERPATH}/${VIDEONAME%.*}_cmprsd.mp4"

# Compress and adjust speed of the video with ffmpeg
ffmpeg -i "$VIDEOPATH" \
  -filter_complex "[0:v]setpts=PTS/${SPEED}[v];[0:a]atempo=${SPEED}[a]" \
  -map "[v]" -map "[a]" \
  -vcodec libx264 -crf 24 -preset veryfast \
  -movflags +faststart -profile:v main \
  -g 48 -keyint_min 48 -sc_threshold 0 -bf 3 -b_strategy 2 \
  -ar 48000 -ac 2 -acodec aac -b:a 128k "$OUTPUTPATH"

# Check if ffmpeg command was successful.
if [ $? -ne 0 ]; then
  echo "Error compressing the video."
  exit 1
fi

echo "Compression successful. Compressed video saved as $OUTPUTPATH with speed ${SPEED}x."
exit 0