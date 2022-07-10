@echo off
setlocal ENABLEDELAYEDEXPANSION

:: CHECK FOR ADMIN PRIVILEGES
dism >nul 2>&1 || ( echo This script must be Run as Administrator. && pause && exit /b 1 )

:: ENABLE CLIPBOARD HISTORY
sc config cbdhsvc start=demand >nul 2>&1
sc config DsSvc start=auto >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Clipboard" /v "EnableClipboardHistory" /t REG_DWORD /d "1" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "AllowClipboardHistory" /f >nul 2>&1

echo Clipboard history has been enabled. Please restart your computer.
pause

exit /b 0
