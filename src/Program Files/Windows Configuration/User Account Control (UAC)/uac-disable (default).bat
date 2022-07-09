@echo off
setlocal ENABLEDELAYEDEXPANSION

:: CHECK FOR ADMIN PRIVILEGES
dism >nul 2>&1 || ( echo This script must be Run as Administrator. && pause && exit /b 1 )

:: DISABLE UAC
for %%i in (EnableLUA EnableInstallerDetection ConsentPromptBehaviorAdmin PromptOnSecureDesktop FilterAdministratorToken) do (
    reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "%%i" /t REG_DWORD /d "0" /f >nul 2>&1
)

echo UAC has been disabled. Please restart your computer.
pause

exit /b 0