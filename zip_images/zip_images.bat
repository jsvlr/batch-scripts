@echo off
setlocal enabledelayedexpansion

:: Show all directories in the user's profile folder
dir /A /B "%USERPROFILE%"

:start
set /p "target_folder=Enter the name of the folder to zip (use 'e' to exit): "

if /i "%target_folder%" == "e" goto end

set "target_dir=%USERPROFILE%\%target_folder%"

:: Create a timestamp
for /f "tokens=2-4 delims=/ " %%a in ('date /t') do set date_part=%%c-%%a-%%b
for /f "tokens=1-2 delims=/: " %%a in ('time /t') do set time_part=%%a%%b
set datetime=!date_part!-!time_part!

:: Clean filename (replace spaces in username with underscore)
set "zip_file_name=%USERNAME: =_%-%target_folder%-%datetime%.zip"

:: Remove previous zip file (optional)
if exist "%CD%\%zip_file_name%" del /q "%zip_file_name%"

if not exist "%target_dir%" (
   echo Folder path does not exist %target_dir%
   goto start
)

echo Zipping files from %target_dir% to %CD%\%zip_file_name% please wait...

:: Zip all images on that folder
powershell -nologo -noprofile -command ^ "Get-ChildItem -Path '%target_dir%' -Include *.png,*.jpeg,*.jpg,*.jfif -Recurse | Compress-Archive -DestinationPath '%CD%\%zip_file_name%'"

:: Log the operation
echo !datetime! Zipped files from %target_dir% >> log.txt

:end
echo You exit the script
pause
:: exit