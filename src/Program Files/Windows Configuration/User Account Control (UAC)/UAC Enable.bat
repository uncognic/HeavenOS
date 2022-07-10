@echo off
setlocal ENABLEDELAYEDEXPANSION

:: CHECK FOR ADMIN PRIVILEGES
dism >nul 2>&1 || ( echo This script must be Run as Administrator. && pause && exit /b 1 )

:: ENABLE UAC
for %%i in (EnableLUA EnableInstallerDetection ConsentPromptBehaviorAdmin PromptOnSecureDesktop FilterAdministratorToken) do (
    reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "%%i" /t REG_DWORD /d "1" /f >nul 2>&1
)

echo UAC has been enabled. Please restart your computer.
pause

exit /b 0
