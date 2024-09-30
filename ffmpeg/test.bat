ffmpeg -hwaccel vaapi -hwaccel_device /dev/dri/renderD128 -hwaccel_output_format vaapi -i "%%a" -c:v av1_vaapi -profile:a 2 -tier 1 -b:v 10.0M -maxrate 10.5M "%%~da%%~pa%%~na_av1.mkv"
