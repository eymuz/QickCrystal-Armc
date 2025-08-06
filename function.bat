@echo off
set "disk=%~d0\kernel16"
cd %disk%
set /p out=Command? : 
start cmd /k %out% 
goto :eof
