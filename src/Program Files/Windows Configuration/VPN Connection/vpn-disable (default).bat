@echo off
setlocal ENABLEDELAYEDEXPANSION

:: CHECK FOR ADMIN PRIVILEGES
dism >nul 2>&1 || ( echo This script must be Run as Administrator. && pause && exit /b 1 )

:: DISABLE VPN DRIVERS
sc config PptpMiniport start=disabled >nul 2>&1
sc config RasAgileVpn start=disabled >nul 2>&1
sc config Rasl2tp start=disabled >nul 2>&1
sc config RasSstp start=disabled >nul 2>&1
sc config RasPppoe start=disabled >nul 2>&1

:: DISABLE VPN SERVICES
sc config RasMan start=disabled >nul 2>&1

:: DISABLE WAN DEVICES
DevManView /disable "WAN Miniport (IKEv2)" >nul 2>&1
DevManView /disable "WAN Miniport (IP)" >nul 2>&1
DevManView /disable "WAN Miniport (IPv6)" >nul 2>&1
DevManView /disable "WAN Miniport (L2TP)" >nul 2>&1
DevManView /disable "WAN Miniport (Network Monitor)" >nul 2>&1
DevManView /disable "WAN Miniport (PPPOE)" >nul 2>&1
DevManView /disable "WAN Miniport (PPTP)" >nul 2>&1
DevManView /disable "WAN Miniport (SSTP)" >nul 2>&1

echo VPN support has been disabled. Please restart your computer.
pause

exit /b 0