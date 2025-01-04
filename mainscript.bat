@echo off
echo Welcome to Python Dependency Downloader. Happy new year!
goto :CheckPython

:CheckPython
echo Checking for Python installation...
for %%i in (python python3) do (
    where %%i >nul 2>nul
    if not errorlevel 1 (
        goto :PythonInstalled
    )
)

goto :InstallPython

:InstallPython
cls
echo Python isn't detected.
echo 1) Microsoft Version.
echo 2) Python Website version.
choice /c 12 /n /m "Choose your number:"
if errorlevel 2 goto :Pyth
if errorlevel 1 goto :Micro
pause
goto :CheckPython

:Micro
start "" "https://apps.microsoft.com/detail/9NRWMJP3717K?hl=en-US&gl=US"
echo When you are done installing, press any key to check again!
pause
goto :CheckPython

:Pyth
start "" "https://www.python.org/downloads/"
echo When you are done installing, press any key to check again!
pause
goto :CheckPython

:PythonInstalled
cls
echo Python is installed.
echo 1) Install a dependency
echo 2) Uninstall a dependency
echo 3) Exit
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
goto :PythonInstalled

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
goto :PythonInstalled

:ExitScript
echo Exiting script. Goodbye!
exit /b 0
