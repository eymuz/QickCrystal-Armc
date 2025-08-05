@echo off
set "disk=%~d0"
set /p st=Start In? :
echo %st% | findstr /I /C:"%disk%" >nul
if errorlevel 1 (
    echo Access Denied: You are outside the sandbox, outside the operating system.
)else (
    start "" "%st%"
    echo Started
)