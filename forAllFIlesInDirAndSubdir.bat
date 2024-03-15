@echo off
setlocal enabledelayedexpansion
pushd "path/to/folder"
(
  for /r %%a in (*.mp4) do (
  START /W ffmpeg -i "%%a" -c:v av1_qsv "%%~da%%~pa%%~na_av1.mkv"  
  )
)
PAUSE
