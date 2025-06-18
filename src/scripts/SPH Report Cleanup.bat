@echo off
REM Launch the initial welcome/info screen (index.hta) and exit this batch file
start "" "%~dp0index.hta"
exit /b