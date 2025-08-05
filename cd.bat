@echo off
setlocal
set "disk=%~d0\Disc"
set /p cd=Cd? : 
echo %cd% | findstr /I /C:"%disk%" >nul
if errorlevel 1 (
    echo Acess Denied: This is a System Directory.
)else (
    cd %cd%
    echo Cd Process Succcessfully Finished.
)
