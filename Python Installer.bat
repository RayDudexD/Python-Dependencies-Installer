@echo off
echo Welcome to Python Dependency Downloader for Python 3.11
goto :CheckPython

:CheckPython
echo Checking Python 3.11
if exist "C:\Users\%username%\AppData\Local\Microsoft\WindowsApps\python3.11.exe" (
    goto :PythonInstalled
) else if exist "C:\Users\%username%\AppData\Local\Programs\Python\Python311" (
    goto :PythonInstalled
) else (
    goto :InstallPython
)

:InstallPython
cls
echo Python 3.11 isn't detected. 
echo 1) Microsoft Version.
echo 2) Python Website version.
choice /c 12 /n /m "Choose your number:"
if %errorlevel% 1 goto :Micro
if %errorlevel% 2 goto :Pyth
pause
goto :CheckPython

:Micro
start "" https://apps.microsoft.com/detail/9NRWMJP3717K?hl=en-US&gl=US
echo When you are done installing, press any key to check again!
pause
goto :CheckPython

:Pyth
start "" https://www.python.org/downloads/release/python-3110/
echo When you are done installing, press any key to check again!
pause
goto :CheckPython

:PythonInstalled
cls
echo 1) Install
echo 2) Uninstall
echo 3) Exit
choice /c 123 /n /m "Choose your number:" 

if errorlevel 3 goto :ExitScript
if errorlevel 2 goto :uninstall
if errorlevel 1 goto :install

:install
set /p input=Enter the dependency name: 

:installs
echo Installing %input%...
pip install %input%
if errorlevel 1 (
    echo Installation failed. Please check the dependency name and try again.
) else (
    echo %input% installed successfully.
)
goto :PythonInstalled

:uninstall
set /p input=Enter the dependency name:

:uninstalls
echo Uninstalling %input%...
pip uninstall %input%
if errorlevel 1 (
    echo Uninstallation failed. Please check the dependency name and try again.
) else (
    echo %input% uninstalled successfully.
)
goto :PythonInstalled

:ExitScript
echo Exiting script. Goodbye!
exit /b 0
