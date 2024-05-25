@echo off

pushd "Z:\"
(
  for /r %%a in (*.mov) do (
  START /W ffmpeg -i "%%a" -c:v av1_qsv "%%~da%%~pa%%~na_av1.mkv"  
  )
)

pushd "Z:\"
(
  for /r %%a in (*.mp4) do (
  START /W ffmpeg -i "%%a" -c:v av1_qsv "%%~da%%~pa%%~na_av1.mkv"  
  )
)
PAUSE
