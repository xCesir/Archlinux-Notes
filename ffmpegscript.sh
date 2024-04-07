                                                                                        ffmpeg.sh                                                                                                                 
#!/bin/bash
# NOTE : Quote it else use array to avoid problems #
path="/run/media/sidney/HDD/unconverted/test/"
FILES="$path*"
for f in $FILES
do
  b=${f##*/}
  echo "Processing $f file..."
  # ffmpeg -vaapi_device /dev/dri/renderD128 -i "$f" -vf 'format=nv12,hwupload' -c:v av1_vaapi -q:v 1 -f matroska "$path${b%.*}_av1.mkv"
  # ffmpeg -vaapi_device /dev/dri/renderD128 -i "$f" -vf 'format=nv12,hwupload' -c:v av1_vaapi -b:v 1200K -f matroska "$path${b%.*}_av1.mkv"
  # ffmpeg -hwaccel vaapi -hwaccel_device /dev/dri/renderD128 -hwaccel_output_format vaapi -i "$f" -c:v av1_vaapi -b:v 1M -maxrate 2M "$path${b%.*}_av1.mkv"
  #ffmpeg -hwaccel qsv -qsv_device /dev/dri/renderD128 -c:v av1_qsv -i input.mp4 -c:v av1_qsv output.mp4
  ffmpeg -hwaccel vaapi -hwaccel_device /dev/dri/renderD128 -hwaccel_output_format vaapi -i "$f" -c:v av1_vaapi "$path${b%.*}_av1.mkv"
done
