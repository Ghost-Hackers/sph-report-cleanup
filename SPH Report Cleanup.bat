@echo off
REM Launch the initial welcome/info screen (index.hta) and exit this batch file
start "" "%~dp0src\scripts\index.hta"
exit /b