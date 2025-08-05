@echo off
set "service=%~d0\ArtunStudios\Services"
set "services=%~d0\kernel16\services.exe"
set /p srv=Service? :
start "" "%services%" "%service%\%srv%.service"

 echo Service Started Succesfully %srv%
