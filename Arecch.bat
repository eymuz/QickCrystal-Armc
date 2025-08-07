@echo off
chcp 65001 >nul
color 0A
setlocal enabledelayedexpansion
 
set dangerlevel=0
set /p "scanfilesdirectory=Enter Scan Directory : "
if "%scanfilesdirectory%"=="" set "scanfilesdirectory=C:\"
set "danger=.exe .vbs .scr .js .com .vbe .ps1 .bat .autoplay .dll .reg"
set "scanfilelist=scanfiles.log"
set "dangerlist=danger.log"
if exist "%scanfilelist%" del "%scanfilelist%"
if exist "%dangerlist%" del "%dangerlist%"

echo Scanning: %scanfilesdirectory%
echo Please Wait...

:: Dosyaları topla
for /R "%scanfilesdirectory%" %%f in (*) do (
    echo %%f>> "%scanfilelist%"
)

:: Tarama sonucu
for /f "usebackq delims=" %%a in ("%scanfilelist%") do (
    set "filepath=%%a"
    set "ext=%%~xa"
    for %%d in (%danger%) do (
        if /i "!ext!"=="%%d" (
            echo !filepath!>> "%dangerlist%"
        )
    )
)

echo.
echo Scan Process Succesfully Finished!
echo Danger Files List: 
for /f "delims=" %%i in (%dangerlist%) do (
set /a dangerlevel+=1
    echo %%i !dangerlevel!
)
pause
