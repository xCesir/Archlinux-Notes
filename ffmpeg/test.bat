@echo off

pushd "Z:\"
(
  for /r %%a in (*.mov) do (
  START /W ffmpeg -i "%%a" -c:v av1_qsv -preset 1 -look_ahead_depth 100 "%%~da%%~pa%%~na_av1.mkv"  
  )
)
P

pushd "Z:\"
(
  for /r %%a in (*.mp4) do (
  START /W ffmpeg -i "%%a" -c:v av1_qsv -preset 1 -look_ahead_depth 100 "%%~da%%~pa%%~na_av1.mkv"  
  )
)
PAUSE
