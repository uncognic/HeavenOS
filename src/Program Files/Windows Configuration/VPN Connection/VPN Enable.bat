@echo off
setlocal ENABLEDELAYEDEXPANSION

:: CHECK FOR ADMIN PRIVILEGES
dism >nul 2>&1 || ( echo This script must be Run as Administrator. && pause && exit /b 1 )

:: ENABLE VPN DRIVERS
sc config PptpMiniport start=demand >nul 2>&1
sc config RasAgileVpn start=demand >nul 2>&1
sc config Rasl2tp start=demand >nul 2>&1
sc config RasSstp start=demand >nul 2>&1
sc config RasPppoe start=demand >nul 2>&1

:: ENABLE VPN SERVICES
sc config RasMan start=auto >nul 2>&1

:: ENABLE WAN DEVICES
DevManView /enable "WAN Miniport (IKEv2)" >nul 2>&1
DevManView /enable "WAN Miniport (IP)" >nul 2>&1
DevManView /enable "WAN Miniport (IPv6)" >nul 2>&1
DevManView /enable "WAN Miniport (L2TP)" >nul 2>&1
DevManView /enable "WAN Miniport (Network Monitor)" >nul 2>&1
DevManView /enable "WAN Miniport (PPPOE)" >nul 2>&1
DevManView /enable "WAN Miniport (PPTP)" >nul 2>&1
DevManView /enable "WAN Miniport (SSTP)" >nul 2>&1

echo VPN support has been enabled. Please restart your computer.
pause

exit /b 0
