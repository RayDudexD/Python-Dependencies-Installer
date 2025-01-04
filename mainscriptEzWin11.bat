@echo off
Echo thank you for downloading EZ-Win11 Configurator.
pause
goto :mainmenu

:mainmenu
cls
echo Welcome to the Python Dependency Downloader.
echo 1) Install a dependency.
echo 2) Uninstall a dependency.
echo 3) Exit.
choice /c 123 /n /m "Choose your number:"

if errorlevel 3 goto :ExitScript
if errorlevel 2 goto :uninstall
if errorlevel 1 goto :install

:install
set /p input=Enter the dependency name: 
echo Installing %input%...
pip install %input%
if errorlevel 1 (
    echo Installation failed. Please check the dependency name and try again.
) else (
    echo %input% installed successfully.
)
pause
goto :mainmenu

:uninstall
set /p input=Enter the dependency name: 
echo Uninstalling %input%...
pip uninstall -y %input%
if errorlevel 1 (
    echo Uninstallation failed. Please check the dependency name and try again.
) else (
    echo %input% uninstalled successfully.
)
pause
goto :mainmenu

:ExitScript
echo Exiting the script. Goodbye!
exit /b 0
