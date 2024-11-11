search_dir="/path/to/dir/" # end on / 

# iterate over all files in `search_dir`
for entry in "$search_dir"*.mp4 # with ending .mp4
do
  echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
  echo "$entry" # print full filepath + filename
  basename=$(basename -- "$entry") # get filename with ending
  basename=${basename%.mp4} # remove ending `.mp4`
  compression="100/100" #
  if [ "$(mediainfo "$entry" | grep "Codec ID/Info" | grep "High Efficiency Video Coding" -o)" = "High Efficiency Video Coding" ] # check if format is HEVC
    then
      compression="30/100"
  elif [ "$(mediainfo "$entry" | grep "Codec ID/Info"  | grep "Advanced Video Coding" -o)" = "Advanced Video Coding" ] # check if format is AVC
    then
    compression="55/100"
  else
    echo "Uknown Format"
    return null
  fi
 echo ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  extension="_av1_2.mkv"
  new=$basename$extension
  fullnew=$search_dir$new

  echo "$(mediainfo "$entry" | grep "Overall bit rate  " | grep --extended-regexp -oh "Mb/s")"
  if [ "$(mediainfo "$entry" | grep 'Overall bit rate  ' | grep 'Mb/s' -o)"  = "Mb/s" ]; then 
      test=$(mediainfo "$entry" | grep "Overall bit rate  " | grep --extended-regexp -oh "[0-9]+\." | sed 's/\.//g')
      echo "compression $compression; test $test; final $(($test * $compression))M"
      echo ffmpeg -hwaccel vaapi -extra_hw_frames 10 -i "$entry" -c:v av1_amf -usage 5 -quality 0 -latency 3 -rc 3 -b:v "$(($test * $compression))"M "$fullnew"
      echo ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
      $(ffmpeg -hwaccel vaapi -extra_hw_frames 10 -i "$entry" -c:v av1_amf -usage 5 -quality 0 -latency 3 -rc 3 -b:v "$(($test * $compression))"M "$fullnew")
      #$(ffmpeg -hwaccel vaapi -hwaccel_device /dev/dri/renderD128 -hwaccel_output_format vaapi -i "$entry" -vf 'format=nv12,hwupload' av1_amf -usage 5 -quality 0 -preset 0 -latency 3 -b:v "$test"M "$fullnew")
  elif [ "$(mediainfo "$entry" | grep 'Overall bit rate  ' | grep 'kb/s' -o)" = "kb/s" ]; then 
      test=$(mediainfo "$entry" | grep "Overall bit rate  " | grep --extended-regexp -oh "([0-9]+[[:blank:]])*" | sed 's/ //g')
      echo "compression $compression; test $test; final $(($test * $compression))k"
      echo ffmpeg -hwaccel vaapi -extra_hw_frames 10 -i "$entry" -c:v av1_amf -usage 5 -quality 0 -latency 3 -rc 3 -b:v "$(($test * $compression))"k "$fullnew"
      echo ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
      $(ffmpeg -hwaccel vaapi -extra_hw_frames 10 -i "$entry" -c:v av1_amf -usage 5 -quality 0 -latency 3 -rc 3 -b:v "$(($test * $compression))"k "$fullnew")
      #$(ffmpeg -hwaccel vaapi -hwaccel_device /dev/dri/renderD128 -hwaccel_output_format vaapi -i "$entry" -vf 'format=nv12,hwupload' av1_amf -usage 5 -quality 0 -preset 0 -latency 3 -b:v "$test"k "$fullnew")
  else
    echo Error
    return null
  fi
 echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
 echo
 echo
 echo
done
