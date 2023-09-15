@echo off
setlocal enabledelayedexpansion

REM Check if the input parameter is provided
if "%~1"=="" (
    echo Usage: %~nx0 "Path_to_PDF_File.pdf"
    exit /b 1
)

set "filePath=%~1"
for %%i in ("%filePath%") do set "directory=%%~dpi"
for %%i in ("%filePath%") do set "fileNameNoExt=%%~nxi"

set "windows_path=%directory%"
set "linux_path=%windows_path:\=/%"

set BPath=%linux_path%%fileNameNoExt%

set s1=Z:
set s2=/file:/C:/users/%USERNAME%
set "BPath=!BPath:%s1%=!"
set "BPath=!BPath:%s2%=!

start /unix /usr/bin/okular %BPath%

exit /b 0
