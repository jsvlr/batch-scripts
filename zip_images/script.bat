@echo off
setlocal enabledelayedexpansion

:: Show directories in the user's profile folder
dir "%USERPROFILE%"

:start
set /p "target_folder=Enter the name of the folder to zip (use 'e' to exit): "

if /i "%target_folder%" == "e" goto end

set "target_dir=%USERPROFILE%\%target_folder%"

:: Create a timestamp
for /f "tokens=2 delims==" %%t in ('wmic os get localdatetime /value') do set datetime=%%t
set datetime=!datetime:~0,4!-!datetime:~4,2!-!datetime:~6,2!-!datetime:~8,4!

:: Clean filename (replace spaces in username with underscore)
set "zip_file_name=%USERNAME: =_%_%target_folder%-!datetime!.zip"

:: Remove previous zip file (optional)
if exist "%CD%\%zip_file_name%" del /q "%zip_file_name%"

if not exist "%target_dir%" (
   echo Folder path does not exist %target_dir%
   goto start
)

echo Zipping files from %target_dir% please wait...

:: Zip all images on that folder
powershell -nologo -noprofile -command ^
powershell "Compress-Archive -Path (Get-ChildItem -Path '%target_dir%' -Include *.png, *.jpeg, *.jpg, *.jfif -Recurse | Select-Object -ExpandProperty Fullname) -DestinationPath '%CD%\%zip_file_name%'"

:: Log the operation
echo !datetime! Zipped files from %target_dir% >> log.txt

:end
echo You exit the script
pause
exit