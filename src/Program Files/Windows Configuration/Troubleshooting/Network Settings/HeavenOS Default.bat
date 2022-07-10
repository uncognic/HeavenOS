@echo off
setlocal ENABLEDELAYEDEXPANSION

:: CHECK FOR ADMIN PRIVILEGES
dism >nul 2>&1 || ( echo This script must be Run as Administrator. && pause && exit /b 1 )

:: DISABLE NAGLE'S ALGORITHM
for /f %%i in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do (
  reg add "HKLM\System\CurrentControlSet\services\Tcpip\Parameters\Interfaces\%%i" /v "TcpAckFrequency" /t REG_DWORD /d "1" /f >nul 2>&1
  reg add "HKLM\System\CurrentControlSet\services\Tcpip\Parameters\Interfaces\%%i" /v "TcpDelAckTicks" /t REG_DWORD /d "0" /f >nul 2>&1
  reg add "HKLM\System\CurrentControlSet\services\Tcpip\Parameters\Interfaces\%%i" /v "TCPNoDelay" /t REG_DWORD /d "1" /f >nul 2>&1
)

:: QOS
reg add "HKLM\Software\Policies\Microsoft\Windows\Psched" /v "TimerResolution" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\QoS" /v "Do not use NLA" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows NT\DNSClient" /v "EnableMulticast" /t REG_DWORD /d "0" /f >nul 2>&1

:: DISABLE NETWORK ADAPTERS
powershell -NoProfile -Command "Disable-NetAdapterBinding -Name "*" -ComponentID ms_rspndr ms_lldp ms_lltdio ms_tcpip6, ms_msclient, ms_pacer, ms_server" >nul 2>&1

:: CONFIGURE NIC SETTINGS
for /f %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}" /v "*SpeedDuplex" /s ^| findstr  "HKEY"') do (
    for /f %%i in ('reg query "%%a" /v "*DeviceSleepOnDisconnect" ^| findstr "HKEY"') do (
        reg add "%%i" /v "*DeviceSleepOnDisconnect" /t REG_SZ /d "0" /f >nul 2>&1
    )
    for /f %%i in ('reg query "%%a" /v "*EEE" ^| findstr "HKEY"') do (
        reg add "%%i" /v "*EEE" /t REG_SZ /d "0" /f >nul 2>&1
    )
    for /f %%i in ('reg query "%%a" /v "*ModernStandbyWoLMagicPacket" ^| findstr "HKEY"') do (
        reg add "%%i" /v "*ModernStandbyWoLMagicPacket" /t REG_SZ /d "0" /f >nul 2>&1
    )
    for /f %%i in ('reg query "%%a" /v "*SelectiveSuspend" ^| findstr "HKEY"') do (
        reg add "%%i" /v "*SelectiveSuspend" /t REG_SZ /d "0" /f >nul 2>&1
    )
    for /f %%i in ('reg query "%%a" /v "*WakeOnMagicPacket" ^| findstr "HKEY"') do (
        reg add "%%i" /v "*WakeOnMagicPacket" /t REG_SZ /d "0" /f >nul 2>&1
    )
    for /f %%i in ('reg query "%%a" /v "*WakeOnPattern" ^| findstr "HKEY"') do (
        reg add "%%i" /v "*WakeOnPattern" /t REG_SZ /d "0" /f >nul 2>&1
    )
    for /f %%i in ('reg query "%%a" /v "AutoPowerSaveModeEnabled" ^| findstr "HKEY"') do (
        reg add "%%i" /v "AutoPowerSaveModeEnabled" /t REG_SZ /d "0" /f >nul 2>&1
    )
    for /f %%i in ('reg query "%%a" /v "EEELinkAdvertisement" ^| findstr "HKEY"') do (
        reg add "%%i" /v "EEELinkAdvertisement" /t REG_SZ /d "0" /f >nul 2>&1
    )
    for /f %%i in ('reg query "%%a" /v "EeePhyEnable" ^| findstr "HKEY"') do (
        reg add "%%i" /v "EeePhyEnable" /t REG_SZ /d "0" /f >nul 2>&1
    )
    for /f %%i in ('reg query "%%a" /v "EnableGreenEthernet" ^| findstr "HKEY"') do (
        reg add "%%i" /v "EnableGreenEthernet" /t REG_SZ /d "0" /f >nul 2>&1
    )
    for /f %%i in ('reg query "%%a" /v "EnableModernStandby" ^| findstr "HKEY"') do (
        reg add "%%i" /v "EnableModernStandby" /t REG_SZ /d "0" /f >nul 2>&1
    )
    for /f %%i in ('reg query "%%a" /v "GigaLite" ^| findstr "HKEY"') do (
        reg add "%%i" /v "GigaLite" /t REG_SZ /d "0" /f >nul 2>&1
    )
    for /f %%i in ('reg query "%%a" /v "PnPCapabilities" ^| findstr "HKEY"') do (
        reg add "%%i" /v "PnPCapabilities" /t REG_DWORD /d "24" /f >nul 2>&1
    )
    for /f %%i in ('reg query "%%a" /v "PowerDownPll" ^| findstr "HKEY"') do (
        reg add "%%i" /v "PowerDownPll" /t REG_SZ /d "0" /f >nul 2>&1
    )
    for /f %%i in ('reg query "%%a" /v "PowerSavingMode" ^| findstr "HKEY"') do (
        reg add "%%i" /v "PowerSavingMode" /t REG_SZ /d "0" /f >nul 2>&1
    )
    for /f %%i in ('reg query "%%a" /v "ReduceSpeedOnPowerDown" ^| findstr "HKEY"') do (
        reg add "%%i" /v "ReduceSpeedOnPowerDown" /t REG_SZ /d "0" /f >nul 2>&1
    )
    for /f %%i in ('reg query "%%a" /v "S5WakeOnLan" ^| findstr "HKEY"') do (
        reg add "%%i" /v "S5WakeOnLan" /t REG_SZ /d "0" /f >nul 2>&1
    )
    for /f %%i in ('reg query "%%a" /v "SavePowerNowEnabled" ^| findstr "HKEY"') do (
        reg add "%%i" /v "SavePowerNowEnabled" /t REG_SZ /d "0" /f >nul 2>&1
    )
    for /f %%i in ('reg query "%%a" /v "ULPMode" ^| findstr "HKEY"') do (
        reg add "%%i" /v "ULPMode" /t REG_SZ /d "0" /f >nul 2>&1
    )
    for /f %%i in ('reg query "%%a" /v "WakeOnLink" ^| findstr "HKEY"') do (
        reg add "%%i" /v "WakeOnLink" /t REG_SZ /d "0" /f >nul 2>&1
    )
    for /f %%i in ('reg query "%%a" /v "WakeOnSlot" ^| findstr "HKEY"') do (
        reg add "%%i" /v "WakeOnSlot" /t REG_SZ /d "0" /f >nul 2>&1
    )
    for /f %%i in ('reg query "%%a" /v "WakeUpModeCap" ^| findstr "HKEY"') do (
        reg add "%%i" /v "WakeUpModeCap" /t REG_SZ /d "0" /f >nul 2>&1
    )
) >nul 2>&1

echo Network settings have been restored to default Heaven ones. Please restart your computer.
pause

exit /b 0
