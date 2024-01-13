@echo off
setlocal enabledelayedexpansion
color 0a
echo Background color changed to black and text color changed to green.
powershell -command "[console]::WindowWidth=200; [console]::WindowHeight=80; [console]::BufferWidth=[console]::WindowWidth"
echo Window size changed to 200x80.

echo.
echo Checking for and obtaining temporary admin permissions...
echo ====================================================================================================
timeout /t 4 >nul
:: Check for admin rights and request them if not
REM --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\\system32\\cacls.exe" "%SYSTEMROOT%\\system32\\config\\system"
REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\\getadmin.vbs"
    echo UAC.ShellExecute "cmd.exe", "/c %~s0", "", "runas", 1 >> "%temp%\\getadmin.vbs"
    "%temp%\\getadmin.vbs"
    del "%temp%\\getadmin.vbs"
    exit /B
:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
echo Done.

setlocal
REM Check if DisplayInfo.hta exists
if not exist "DisplayInfo.hta" (
    echo Error: DisplayInfo.hta not found.
    echo Please make sure the file exists in the correct directory.
    goto :eof
)
REM Open the HTA file to display information about the script
start mshta "DisplayInfo.hta"
:end
endlocal

echo.
echo Setting focus to the Command Prompt window...
echo Set objShell = WScript.CreateObject("WScript.Shell") > focus.vbs
echo objShell.AppActivate "Command Prompt" >> focus.vbs
start cmd /k
timeout /nobreak /t 1 >nul
cscript //nologo focus.vbs
del focus.vbs
echo Command Prompt window focused. It is now in the foreground.

:: Check for updates to the script and run them
title Ensuring latest versions are installed...
echo.
echo Checking for updates to the script and dependencies:
echo ====================================================================================================
:: Set the maximum value of the progress bar
set /a max=4

:: Loop through the commands
for /l %%i in (1,1,%max%) do (
    :: Run the command
    if %%i==1 (
        :: Set the installation directory
        set "INSTALL_DIR=C:\Program Files\"
        echo Checking for latest version of winget...
        powershell -Command "Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe"
        echo You are registered with the latest winget!
        echo.
    ) else if %%i==2 (
        :: Install and update Git
        echo.
        echo.
        echo Checking for latest version of git...
        git --version
        cd "C:\Program Files\Git"
        if exist .git (
            echo Updating Git...
            git pull origin master
        ) else (
            echo Installing Git...
            winget install --id Git.Git -e --source winget
        )
        echo You have the latest Git!
        echo.
    ) else if %%i==3 (
        :: Install and update PowerShell
        echo.
        echo.
        echo Checking for latest version of PowerShell...
        where /q powershell
        if not %errorlevel% == 0 (
            echo PowerShell is not installed. Installing...
            winget install Microsoft.PowerShell -e --source winget
        ) else (
            echo PowerShell is already installed.
        )
        echo You have the latest PowerShell!
        echo.
    ) else if %%i==4 (
        :: Check if the repository exists and clone or pull updates
        echo.
        echo.
        echo Checking for latest version of SPH Cleanup...
        cd C:\Program Files\SPH Cleanup
        if exist .git (
            echo Repository exists. Updating...
            git pull
        ) else (
            echo Repository does not exist. Cloning...
            git clone https://github.com/Ghost-Hackers/sph-file-cleanup.git "C:\\Program Files\\SPH Cleanup"
        )
        echo You have the latest SPH Cleanup!
        echo.
    )
    :: Update the progress bar
    set /a percent=%%i*100/%max%
    set /a bars=%%i*10/%max%
    set /a spaces=10-bars
    set "progress=["
    for /l %%j in (1,1,!bars!) do set "progress=!progress!■"
    for /l %%j in (!bars!,1,9) do set "progress=!progress! "
    set "progress=!progress!] !percent!%%"
    set /p "=!progress!" <nul
    timeout /t 1 >nul
)
echo.
echo.
echo Dependencies are up to date! Continuing with the script...
timeout /t 2 >nul

Title Generate the VBScript for creating the desktop shortcut
echo.
echo Creating the desktop shortcut:
echo ====================================================================================================
echo Generating the VBScript for creating the shortcut...
(
    echo Call Shortcut^("C:\Program Files\SPH Cleanup\SPH Report Cleanup.bat", "SPH Report Cleanup"^)
    echo Sub Shortcut^(TargetPath, Name^)
    echo     Dim objShell, DesktopPath, objShortCut
    echo     Set objShell = CreateObject^("WScript.Shell"^)
    echo     DesktopPath = objShell.SpecialFolders("Desktop"^)
    echo     Set objShortCut = objShell.CreateShortcut(DesktopPath ^& "\" ^& Name ^& ".lnk"^)
    echo     objShortCut.TargetPath = DblQuote^(TargetPath^)
    echo     objShortCut.IconLocation = "C:\Windows\System32\shell32.dll,0"
    echo     objShortCut.Save
    echo End Sub
    echo Function DblQuote^(Str^)
    echo     DblQuote = Chr^(34^) ^& Str ^& Chr^(34^)
    echo End Function
) > Shortcutme.vbs

echo Executing the VBScript to create the shortcut on the desktop...
cscript.exe /nologo Shortcutme.vbs
echo Cleaning up...
del Shortcutme.vbs
echo Done
echo.

:: Run PowerShell script from the repository
echo Initializing cleanup:
echo ====================================================================================================
PowerShell -ExecutionPolicy Bypass -File "c:\Program Files\SPH Cleanup\CleanupDownloads-SPH.ps1"