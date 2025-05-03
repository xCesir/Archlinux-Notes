#!/bin/bash
# find . -name '*.mp4' -exec sh test.sh "{}" \;
echo "First arg: $1"
echo "Second arg ${1%.*}_av1_2.mkv"
  if [ "$(mediainfo "$1" | grep "Codec ID/Info" | grep "High Efficiency Video Coding" -o)" = "High Efficiency Video Coding" ] # check if format is HEVC
    then
      compression="70/100"
  elif [ "$(mediainfo "$1" | grep "Codec ID/Info"  | grep "Advanced Video Coding" -o)" = "Advanced Video Coding" ] # check if format is AVC
    then
    compression="55/100"
  elif [ "$(mediainfo "$1" | grep "Codec ID/Info"  | grep "Advanced Video Coding" -o)" = "Audio Codec Low Complexity" ] # check if format is AVC
    then
    compression="55/100"
  else
    echo "Unknown format"
    return null
  fi
 echo ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  echo "$(mediainfo "$1" | grep "Overall bit rate  " | grep --extended-regexp -oh "Mb/s")"
  if [ "$(mediainfo "$1" | grep 'Overall bit rate  ' | grep 'Mb/s' -o)"  = "Mb/s" ]; then 
      test=$(mediainfo "$1" | grep "Overall bit rate  " | grep --extended-regexp -oh "[0-9]+\." | sed 's/\.//g')
      echo "compression $compression; test $test; final $(($test * $compression))M"
      echo ffmpeg -hwaccel vaapi -hwaccel_device /dev/dri/renderD129 -extra_hw_frames 10 -i "$1" -c:v av1_qsv -preset 1 -b:v "$(($test * $compression))"M "${1%.*}_av1_2.mkv"
      echo ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
      $(ffmpeg -hwaccel vaapi -hwaccel_device /dev/dri/renderD129 -extra_hw_frames 10 -i "$1" -c:v av1_qsv -preset 1 -b:v "$(($test * $compression))"M "${1%.*}_av1_2.mkv")
      #$(ffmpeg -hwaccel vaapi -hwaccel_device /dev/dri/renderD128 -hwaccel_output_format vaapi -i "$1" -vf 'format=nv12,hwupload' av1_amf -usage 5 -quality 0 -preset 0 -latency 3 -b:v "$test"M "${1%.*}_av1_2.mkv")
  elif [ "$(mediainfo "$1" | grep 'Overall bit rate  ' | grep 'kb/s' -o)" = "kb/s" ]; then 
      test=$(mediainfo "$1" | grep "Overall bit rate  " | grep --extended-regexp -oh "([0-9]+[[:blank:]])*" | sed 's/ //g')
      echo "compression $compression; test $test; final $(($test * $compression))k"
      echo ffmpeg -hwaccel vaapi -hwaccel_device /dev/dri/renderD129 -extra_hw_frames 10 -i "$1" -c:v av1_qsv -preset 1 -b:v "$(($test * $compression))"k "${1%.*}_av1_2.mkv"
      echo ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
      $(ffmpeg -hwaccel vaapi -hwaccel_device /dev/dri/renderD129 -extra_hw_frames 10 -i "$1" -c:v av1_qsv -preset 1 -b:v "$(($test * $compression))"k "${1%.*}_av1_2.mkv")
      #$(ffmpeg -hwaccel vaapi -hwaccel_device /dev/dri/renderD128 -hwaccel_output_format vaapi -i "$1" -vf 'format=nv12,hwupload' av1_amf -usage 5 -quality 0 -preset 0 -latency 3 -b:v "$test"k "${1%.*}_av1_2.mkv")
  else
    echo Error
    return null
  fi

