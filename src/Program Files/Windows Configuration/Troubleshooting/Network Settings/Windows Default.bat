@echo off
setlocal ENABLEDELAYEDEXPANSION

:: CHECK FOR ADMIN PRIVILEGES
dism >nul 2>&1 || ( echo This script must be Run as Administrator. && pause && exit /b 1 )

:: RESTORE DEFAULT WINDOWS SETTINGS
netsh int ip reset
netsh winsock reset
for /f "tokens=3* delims=: " %%i in ('pnputil /enum-devices /class Net /connected^| findstr "Device Description:"') do (
	DevManView.exe /uninstall "%%i %%j"
)
pnputil /scan-devices

echo Network settings have been restored to default. Please restart your computer.
pause

exit /b 0
