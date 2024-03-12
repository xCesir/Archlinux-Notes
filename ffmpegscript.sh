  GNU nano 7.2                                                                                           sh.sh                                                                                           Modified  
#!/bin/bash
# NOTE : Quote it else use array to avoid problems #
path="/run/media/sidney/HDD/unconverted/test/"
FILES="$path*"
for f in $FILES
do
  b=${f##*/}
  echo "Processing $f file..."
  # take action on each file. $f store current file name
  # ffmpeg -vaapi_device /dev/dri/renderD128 -i "$f" -vf 'format=nv12,hwupload' -c:v av1_vaapi -rc_mode 1 -f matroska "$path${b%.*}_av1.mkv";
  ffmpeg -hwaccel vaapi -hwaccel_device /dev/dri/renderD128 -hwaccel_output_format vaapi -i "$f" -c:v av1_vaapi "$path${b%.*}_av1.mkv";

done


