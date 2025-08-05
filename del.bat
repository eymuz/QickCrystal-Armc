@echo off
set "disk=%~d0\Disc"
set /p dlt=del? :
echo %dlt% | find /I "%disk%" >nul
if errorlevel 1 (
    echo  echo Acess Denied: This is a System File.
    exit
) else (
    del %dlt%
    echo Delete Process Succesfuly Finished
)
