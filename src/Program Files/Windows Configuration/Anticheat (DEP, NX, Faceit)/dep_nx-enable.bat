@echo off
setlocal ENABLEDELAYEDEXPANSION

:: CHECK FOR ADMIN PRIVILEGES
dism >nul 2>&1 || ( echo This script must be Run as Administrator. && pause && exit /b 1 )

:: ENABLE DEP
bcdedit /set nx OptIn

echo DEP has been enabled. Please restart your computer.
pause

exit /b 0