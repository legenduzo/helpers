mv /mnt/c/Users/dell/Videos/Captures/input.mp4 .
ffmpeg -i input.mp4 -vcodec libx264 -crf 24 -preset veryfast -movflags +faststart -profile:v main -g 48 -keyint_min 48 -sc_threshold 0 -bf 3 -b_strategy 2 -ar 48000 -ac 2 -acodec aac -b:a 128k output.mp4
mv output.mp4 /mnt/c/Users/dell/Downloads/
