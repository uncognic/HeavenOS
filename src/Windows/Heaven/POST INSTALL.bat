:: Vojtass#0001 | dsc.gg/heavenos
:: HeavenOS is a custom windows 10 based on 1803 & 20H2
:: POST INSTALLATION SCRIPT

@echo off
TITLE HeavenOS POST-INSTALL v0.1
SETLOCAL EnableDelayedExpansion

:: kill explorer
taskkill /F /IM explorer.exe >nul 2>&1

call:CONFIG >nul 2>&1

:: INFO
echo NOTE: DO NOT CLICK ANYTHING WITH MOUSE OR YOUR KEYBOARD!

:: INSTALL DIRECTX
call %SYSTEMROOT%\Heaven\DirectX\dxsetup.exe /silent

:: INSTALL VCREDIST
call %SYSTEMROOT%\Heaven\vcredist.exe /aiV /gm2

:: INSTALL AND SETUP OPEN-SHELL
call %SYSTEMROOT%\Heaven\openshell.exe /qn ADDLOCAL=StartMenu

reg add "HKCU\SOFTWARE\OpenShell" /t REG_SZ "" /f >nul 2>&1
reg add "HKCU\SOFTWARE\OpenShell\OpenShell" /t REG_SZ "" /f >nul 2>&1
reg add "HKCU\SOFTWARE\OpenShell\OpenShell\Settings" /t REG_SZ "" /f >nul 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu" /t REG_SZ "" /f >nul 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu" /v "ShowedStyle2" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu" /v "CSettingsDlg" /t REG_BINARY /d "c80100001a0100000000000000000000360d00000100000000000000" /f >nul 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu" /v "OldItems" /t REG_BINARY "" /f >nul 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu" /v "ItemRanks" /t REG_BINARY /d "0" /f >nul 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu\Settings" /t REG_SZ "" /f >nul 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu\Settings" /v "Version" /t REG_DWORD /d "04040098" /f >nul 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu\Settings" /v "AllProgramsMetro" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu\Settings" /v "RecentMetroApps" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu\Settings" /v "StartScreenShortcut" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu\Settings" /v "SearchInternet" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu\Settings" /v "GlassOverride" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu\Settings" /v "GlassColor" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu\Settings" /v "SkinW7" /t REG_SZ /d "Midnight" /f >nul 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu\Settings" /v "SkinVariationW7" /t REG_SZ "" /f >nul 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu\Settings" /v "SkinOptionsW7" /t REG_MULTI_SZ /d "USER_IMAGE=1"\0"SMALL_ICONS=0"\0"LARGE_FONT=0"\0"DISABLE_MASK=0"\0"OPAQUE=0"\0"TRANSPARENT_LESS=0"\0"TRANSPARENT_MORE=1"\0"WHITE_SUBMENUS2=0" /f >nul 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu\Settings" /v "SkipMetro" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu\Settings" /v "MenuItems7" /t REG_MULTI_SZ /d "Item1.Command=user_files"\0"Item1.Settings=NOEXPAND"\0"Item2.Command=user_documents"\0"Item2.Settings=NOEXPAND"\0"Item3.Command=user_pictures"\0"Item3.Settings=NOEXPAND"\0"Item4.Command=user_music"\0"Item4.Settings=NOEXPAND"\0"Item5.Command=user_videos"\0"Item5.Settings=NOEXPAND"\0"Item6.Command=downloads"\0"Item6.Settings=NOEXPAND"\0"Item7.Command=homegroup"\0"Item7.Settings=ITEM_DISABLED"\0"Item8.Command=separator"\0"Item9.Command=games"\0"Item9.Settings=TRACK_RECENT|NOEXPAND|ITEM_DISABLED"\0"Item10.Command=favorites"\0"Item10.Settings=ITEM_DISABLED"\0"Item11.Command=recent_documents"\0"Item12.Command=computer"\0"Item12.Settings=NOEXPAND"\0"Item13.Command=network"\0"Item13.Settings=ITEM_DISABLED"\0"Item14.Command=network_connections"\0"Item14.Settings=ITEM_DISABLED"\0"Item15.Command=separator"\0"Item16.Command=control_panel"\0"Item16.Settings=TRACK_RECENT"\0"Item17.Command=pc_settings"\0"Item17.Settings=TRACK_RECENT"\0"Item18.Command=admin"\0"Item18.Settings=TRACK_RECENT|ITEM_DISABLED"\0"Item19.Command=devices"\0"Item19.Settings=ITEM_DISABLED"\0"Item20.Command=defaults"\0"Item20.Settings=ITEM_DISABLED"\0"Item21.Command=help"\0"Item21.Settings=ITEM_DISABLED"\0"Item22.Command=run"\0"Item23.Command=apps"\0"Item23.Settings=ITEM_DISABLED"\0"Item24.Command=windows_security"\0"Item24.Settings=ITEM_DISABLED" /f >nul 2>&1

attrib +h "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Administrative Tools\Component Services.lnk" >nul 2>&1
attrib +h "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Administrative Tools\ODBC Data Sources (32-bit).lnk" >nul 2>&1
attrib +h "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Administrative Tools\ODBC Data Sources (64-bit).lnk" >nul 2>&1
attrib +h "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Windows PowerShell" >nul 2>&1
attrib +h "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Maintenance" >nul 2>&1
attrib +h "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\StartUp" >nul 2>&1
attrib +h "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Maintenance" >nul 2>&1
attrib +h "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup" >nul 2>&1

:: INSTALL 7-ZIP
call %SYSTEMROOT%\Heaven\7zip.msi /quiet /norestart
rd /s /q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\7-Zip"

reg add "HKCU\Software\7-Zip\Options" /v "ContextMenu" /t REG_DWORD /d "2147488038" /f >nul 2>&1
reg add "HKCU\Software\7-Zip\Options" /v "ElimDupExtract" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\Software\Classes\.001" /ve /t REG_SZ /d "7-Zip.001" /f >nul 2>&1
reg add "HKLM\Software\Classes\.7z" /ve /t REG_SZ /d "7-Zip.7z" /f >nul 2>&1
reg add "HKLM\Software\Classes\.arj" /ve /t REG_SZ /d "7-Zip.arj" /f >nul 2>&1
reg add "HKLM\Software\Classes\.bz2" /ve /t REG_SZ /d "7-Zip.bz2" /f >nul 2>&1
reg add "HKLM\Software\Classes\.bzip2" /ve /t REG_SZ /d "7-Zip.bzip2" /f >nul 2>&1
reg add "HKLM\Software\Classes\.cab" /ve /t REG_SZ /d "7-Zip.cab" /f >nul 2>&1
reg add "HKLM\Software\Classes\.cpio" /ve /t REG_SZ /d "7-Zip.cpio" /f >nul 2>&1
reg add "HKLM\Software\Classes\.deb" /ve /t REG_SZ /d "7-Zip.deb" /f >nul 2>&1
reg add "HKLM\Software\Classes\.dmg" /ve /t REG_SZ /d "7-Zip.dmg" /f >nul 2>&1
reg add "HKLM\Software\Classes\.esd" /ve /t REG_SZ /d "7-Zip.esd" /f >nul 2>&1
reg add "HKLM\Software\Classes\.fat" /ve /t REG_SZ /d "7-Zip.fat" /f >nul 2>&1
reg add "HKLM\Software\Classes\.gz" /ve /t REG_SZ /d "7-Zip.gz" /f >nul 2>&1
reg add "HKLM\Software\Classes\.gzip" /ve /t REG_SZ /d "7-Zip.gzip" /f >nul 2>&1
reg add "HKLM\Software\Classes\.hfs" /ve /t REG_SZ /d "7-Zip.hfs" /f >nul 2>&1
reg add "HKLM\Software\Classes\.iso" /ve /t REG_SZ /d "7-Zip.iso" /f >nul 2>&1
reg add "HKLM\Software\Classes\.lha" /ve /t REG_SZ /d "7-Zip.lha" /f >nul 2>&1
reg add "HKLM\Software\Classes\.lzh" /ve /t REG_SZ /d "7-Zip.lzh" /f >nul 2>&1
reg add "HKLM\Software\Classes\.lzma" /ve /t REG_SZ /d "7-Zip.lzma" /f >nul 2>&1
reg add "HKLM\Software\Classes\.ntfs" /ve /t REG_SZ /d "7-Zip.ntfs" /f >nul 2>&1
reg add "HKLM\Software\Classes\.rar" /ve /t REG_SZ /d "7-Zip.rar" /f >nul 2>&1
reg add "HKLM\Software\Classes\.rpm" /ve /t REG_SZ /d "7-Zip.rpm" /f >nul 2>&1
reg add "HKLM\Software\Classes\.squashfs" /ve /t REG_SZ /d "7-Zip.squashfs" /f >nul 2>&1
reg add "HKLM\Software\Classes\.swm" /ve /t REG_SZ /d "7-Zip.swm" /f >nul 2>&1
reg add "HKLM\Software\Classes\.tar" /ve /t REG_SZ /d "7-Zip.tar" /f >nul 2>&1
reg add "HKLM\Software\Classes\.taz" /ve /t REG_SZ /d "7-Zip.taz" /f >nul 2>&1
reg add "HKLM\Software\Classes\.tbz" /ve /t REG_SZ /d "7-Zip.tbz" /f >nul 2>&1
reg add "HKLM\Software\Classes\.tbz2" /ve /t REG_SZ /d "7-Zip.tbz2" /f >nul 2>&1
reg add "HKLM\Software\Classes\.tgz" /ve /t REG_SZ /d "7-Zip.tgz" /f >nul 2>&1
reg add "HKLM\Software\Classes\.tpz" /ve /t REG_SZ /d "7-Zip.tpz" /f >nul 2>&1
reg add "HKLM\Software\Classes\.txz" /ve /t REG_SZ /d "7-Zip.txz" /f >nul 2>&1
reg add "HKLM\Software\Classes\.vhd" /ve /t REG_SZ /d "7-Zip.vhd" /f >nul 2>&1
reg add "HKLM\Software\Classes\.wim" /ve /t REG_SZ /d "7-Zip.wim" /f >nul 2>&1
reg add "HKLM\Software\Classes\.xar" /ve /t REG_SZ /d "7-Zip.xar" /f >nul 2>&1
reg add "HKLM\Software\Classes\.xz" /ve /t REG_SZ /d "7-Zip.xz" /f >nul 2>&1
reg add "HKLM\Software\Classes\.z" /ve /t REG_SZ /d "7-Zip.z" /f >nul 2>&1
reg add "HKLM\Software\Classes\.zip" /ve /t REG_SZ /d "7-Zip.zip" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.001" /ve /t REG_SZ /d "001 Archive" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.001\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,9" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.001\shell" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.001\shell\open" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.001\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.7z" /ve /t REG_SZ /d "7z Archive" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.7z\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,0" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.7z\shell" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.7z\shell\open" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.7z\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.arj" /ve /t REG_SZ /d "arj Archive" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.arj\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,4" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.arj\shell" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.arj\shell\open" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.arj\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.bz2" /ve /t REG_SZ /d "bz2 Archive" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.bz2\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,2" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.bz2\shell" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.bz2\shell\open" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.bz2\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.bzip2" /ve /t REG_SZ /d "bzip2 Archive" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.bzip2\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,2" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.bzip2\shell" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.bzip2\shell\open" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.bzip2\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.cab" /ve /t REG_SZ /d "cab Archive" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.cab\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,7" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.cab\shell" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.cab\shell\open" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.cab\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.cpio" /ve /t REG_SZ /d "cpio Archive" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.cpio\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,12" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.cpio\shell" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.cpio\shell\open" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.cpio\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.deb" /ve /t REG_SZ /d "deb Archive" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.deb\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,11" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.deb\shell" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.deb\shell\open" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.deb\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.dmg" /ve /t REG_SZ /d "dmg Archive" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.dmg\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,17" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.dmg\shell" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.dmg\shell\open" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.dmg\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.esd" /ve /t REG_SZ /d "esd Archive" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.esd\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,0" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.esd\shell" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.esd\shell\open" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.esd\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.fat" /ve /t REG_SZ /d "fat Archive" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.fat\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,21" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.fat\shell" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.fat\shell\open" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.fat\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.gz" /ve /t REG_SZ /d "gz Archive" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.gz\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,14" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.gz\shell" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.gz\shell\open" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.gz\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.gzip" /ve /t REG_SZ /d "gzip Archive" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.gzip\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,14" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.gzip\shell" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.gzip\shell\open" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.gzip\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.hfs" /ve /t REG_SZ /d "hfs Archive" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.hfs\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,18" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.hfs\shell" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.hfs\shell\open" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.hfs\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.iso" /ve /t REG_SZ /d "iso Archive" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.iso\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,8" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.iso\shell" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.iso\shell\open" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.iso\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.lha" /ve /t REG_SZ /d "lha Archive" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.lha\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,6" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.lha\shell" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.lha\shell\open" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.lha\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.lzh" /ve /t REG_SZ /d "lzh Archive" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.lzh\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,6" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.lzh\shell" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.lzh\shell\open" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.lzh\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.lzma" /ve /t REG_SZ /d "lzma Archive" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.lzma\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,16" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.lzma\shell" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.lzma\shell\open" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.lzma\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.ntfs" /ve /t REG_SZ /d "ntfs Archive" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.ntfs\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,22" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.ntfs\shell" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.ntfs\shell\open" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.ntfs\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.rar" /ve /t REG_SZ /d "rar Archive" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.rar\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,3" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.rar\shell" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.rar\shell\open" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.rar\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.rpm" /ve /t REG_SZ /d "rpm Archive" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.rpm\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,10" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.rpm\shell" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.rpm\shell\open" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.rpm\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.squashfs" /ve /t REG_SZ /d "squashfs Archive" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.squashfs\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,24" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.squashfs\shell" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.squashfs\shell\open" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.squashfs\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.swm" /ve /t REG_SZ /d "swm Archive" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.swm\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,15" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.swm\shell" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.swm\shell\open" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.swm\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.tar" /ve /t REG_SZ /d "tar Archive" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.tar\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,13" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.tar\shell" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.tar\shell\open" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.tar\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.taz" /ve /t REG_SZ /d "taz Archive" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.taz\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,5" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.taz\shell" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.taz\shell\open" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.taz\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.tbz" /ve /t REG_SZ /d "tbz Archive" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.tbz2" /ve /t REG_SZ /d "tbz2 Archive" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.tbz2\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,2" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.tbz2\shell" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.tbz2\shell\open" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.tbz2\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.tbz\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,2" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.tbz\shell" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.tbz\shell\open" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.tbz\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.tgz" /ve /t REG_SZ /d "tgz Archive" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.tgz\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,14" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.tgz\shell" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.tgz\shell\open" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.tgz\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.tpz" /ve /t REG_SZ /d "tpz Archive" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.tpz\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,14" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.tpz\shell" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.tpz\shell\open" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.tpz\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.txz" /ve /t REG_SZ /d "txz Archive" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.txz\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,23" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.txz\shell" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.txz\shell\open" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.txz\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.vhd" /ve /t REG_SZ /d "vhd Archive" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.vhd\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,20" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.vhd\shell" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.vhd\shell\open" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.vhd\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.wim" /ve /t REG_SZ /d "wim Archive" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.wim\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,15" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.wim\shell" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.wim\shell\open" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.wim\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.xar" /ve /t REG_SZ /d "xar Archive" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.xar\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,19" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.xar\shell" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.xar\shell\open" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.xar\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.xz" /ve /t REG_SZ /d "xz Archive" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.xz\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,23" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.xz\shell" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.xz\shell\open" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.xz\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.z" /ve /t REG_SZ /d "z Archive" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.z\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,5" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.z\shell" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.z\shell\open" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.z\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.zip" /ve /t REG_SZ /d "zip Archive" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.zip\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,1" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.zip\shell" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.zip\shell\open" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\Software\Classes\7-Zip.zip\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f >nul 2>&1

:: Powershell Unredstricted
call:POWERSHELL Set-ExecutionPolicy Unrestricted -force

:: SET NTP SERVERS
w32tm /config /syncfromflags:manual /manualpeerlist:"0.pool.ntp.org 1.pool.ntp.org 2.pool.ntp.org 3.pool.ntp.org" >nul 2>&1
sc queryex "w32time"|Find "STATE"|Find /v "RUNNING">Nul||( net stop w32time >nul 2>&1 )
net start w32time >nul 2>&1
w32tm /config /update >nul 2>&1
w32tm /resync >nul 2>&1

:: IMPORT REGISTRY
NSudoL -ShowWindowMode:hide -Wait -U:T -P:E reg import "%SYSTEMROOT%\Heaven\SERVICES.reg" >nul 2>&1
regedit /s "%SYSTEMROOT%\Heaven\HEAVEN.reg" >nul 2>&1
PowerRun.exe /SW:0 regedit /s "%SYSTEMROOT%\Heaven\HEAVEN.reg" >nul 2>&1

:: DISABLE DMA REMAPPING
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\DmaGuard\DeviceEnumerationPolicy" /v "value" /t REG_DWORD /d "2" /f >nul 2>&1
for /f %%i in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services" /s /f DmaRemappingCompatible ^| find /i "Services\" ') do (
  reg add "%%i" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f >nul 2>&1
)

:: HiveNightmare Mitigations
icacls %windir%\system32\config\*.* /inheritance:e >nul 2>&1

:: OPTIMIZE PROCESSES CYCLES
copy /y "%windir%\System32\svchost.exe" "%windir%\System32\audiosvchost.exe" >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Audiosrv" /v "ImagePath" /t REG_EXPAND_SZ /d "%windir%\System32\audiosvchost.exe -k LocalServiceNetworkRestricted -p" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AudioEndpointBuilder" /v "ImagePath" /t REG_EXPAND_SZ /d "%windir%\System32\audiosvchost.exe -k LocalSystemNetworkRestricted -p" /f >nul 2>&1

:: SET PROCESSES PRORITIES
:: SET SYSTEM PROCESSES PRIORITY BELOW NORMAL
for %%i in (lsass sppsvc SearchIndexer fontdrvhost sihost ctfmon) do (
  reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%%.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "5" /f >nul 2>&1
)

:: SET BACKGROUND APPS PRIORITY BELOW NORMAL
for %%i in (OriginWebHelperService ShareX EpicWebHelper UplayWebCore SocialClubHelper steamwebhelper) do (
  reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%%i.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "5" /f >nul 2>&1
)

:: WINLOGON TO NORMAL PRIORITY
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\winlogon.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "2" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\winlogon.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "2" /f >nul 2>&1

:: CSRSS TO HIGH PRIORITY
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f >nul 2>&1

:: DISABLE PROCESS MITIGATIONS
:: https://docs.microsoft.com/en-us/powershell/module/processmitigations/set-processmitigation?view=windowsserver2019-ps
call:POWERSHELL "Set-ProcessMitigation -System -Disable CFG"
for /f "tokens=3 skip=2" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "MitigationAuditOptions"') do set mitigation_mask=%%a
for /L %%a in (0,1,9) do (
    set "mitigation_mask=!mitigation_mask:%%a=2!
)

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "MitigationOptions" /t REG_BINARY /d "!mitigation_mask!" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "MitigationAuditOptions" /t REG_BINARY /d "!mitigation_mask!" /f >nul 2>&1

for %%a in (fontdrvhost dwm lsass svchost WmiPrvSE winlogon csrss audiodg ntoskrnl services) do (
  reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%%a.exe" /v "MitigationOptions" /t REG_BINARY /d "!mitigation_mask!" /f >nul 2>&1
	reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%%a.exe" /v "MitigationAuditOptions" /t REG_BINARY /d "!mitigation_mask!" /f >nul 2>&1
)

:: DISABLE WIFI IF NEEDED
if !ETHERNET!==1 (
	if !LAPTOP!==0 (
    sc config WlanSvc start=disabled >nul 2>&1
    sc config vwififlt start=demand >nul 2>&1
	)
)

:: SYSTEM AND VPN DEVICES
DevManView /disable "AMD PSP"
DevManView /disable "AMD SMBus"
DevManView /disable "Base System Device"
DevManView /disable "Composite Bus Enumerator"
DevManView /disable "High Precision Event Timer"
DevManView /disable "Intel Management Engine"
DevManView /disable "Intel SMBus"
DevManView /disable "Microsoft Kernel Debug Network Adapter"
DevManView /disable "Microsoft RRAS Root Enumerator"
DevManView /disable "NDIS Virtual Network Adapter Enumerator"
DevManView /disable "Numeric Data Processor"
DevManView /disable "PCI Encryption/Decryption Controller"
DevManView /disable "PCI Memory Controller"
DevManView /disable "PCI standard RAM Controller"
DevManView /disable "SM Bus Controller"
DevManView /disable "System Timer"
DevManView /disable "UMBus Root Bus Enumerator"
DevManView /disable "Unknown Device"
DevManView /disable "WAN Miniport (IKEv2)"
DevManView /disable "WAN Miniport (IP)"
DevManView /disable "WAN Miniport (IPv6)"
DevManView /disable "WAN Miniport (L2TP)"
DevManView /disable "WAN Miniport (Network Monitor)"
DevManView /disable "WAN Miniport (PPPOE)"
DevManView /disable "WAN Miniport (PPTP)"
DevManView /disable "WAN Miniport (SSTP)"

:: CLEAN NON PRESENT DEVICES
call:POWERSHELL "$Devices = Get-PnpDevice | ? Status -eq Unknown;foreach ($Device in $Devices) { &\"pnputil\" /remove-device $Device.InstanceId }"

:: DISABLE OTHER Devices
devcon disable "=CDROM" >nul 2>&1
devcon disable "=Printer" >nul 2>&1
devcon disable "=PrintQueue" >nul 2>&1

:: ENABLE MSI MODE FOR PCI DEVICES
:: SET DEVICES PRIORITY TO UNDEFINED
for /f "tokens=*" %%i in ('reg query "HKLM\SYSTEM\CurrentControlSet\Enum\PCI"^| findstr "HKEY"') do (
  for /f "tokens=*" %%a in ('reg query "%%i"^| findstr "HKEY"') do reg delete "%%a\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /f >nul 2>&1
)

for /f %%i in ('wmic path Win32_USBController get PNPDeviceID^| findstr /l "PCI\VEN_"') do reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f >nul 2>&1
for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /l "PCI\VEN_"') do reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f >nul 2>&1
for /f %%i in ('wmic path Win32_NetworkAdapter get PNPDeviceID^| findstr /l "PCI\VEN_"') do reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f >nul 2>&1

:: DISABLE HPET AND SYNTHETIC TIMER
call:POWERSHELL "Get-PnpDevice | Where-Object { $_.InstanceId -like 'ACPI\PNP0103\2&daba3ff&*' } | Disable-PnpDevice -Confirm:$false"
bcdedit /deletevalue useplatformclock >nul 2>&1
bcdedit /set disabledynamictick yes >nul 2>&1
bcdedit /set useplatformtick yes >nul 2>&1

:: DUAL BOOT OPTIONS
bcdedit /set {current} description "Heaven" >nul 2>&1
bcdedit /set bootmenupolicy Legacy >nul 2>&1
bcdedit /timeout 0 >nul 2>&1

:: DISABLE DEP / NX
bcdedit /set nx AlwaysOff >nul 2>&1

:: DISABLE RECOVERY, TPM, HYPERV
bcdedit /set {current} recoveryenabled no >nul 2>&1
bcdedit /set tpmbootentropy ForceDisable >nul 2>&1
bcdedit /set hypervisorlaunchtype off >nul 2>&1

:: OPTIMIZE FILE SYSTEM SETTINGS
fsutil behavior set allowextchar 0 >nul 2>&1
fsutil behavior set Bugcheckoncorrupt 0 >nul 2>&1
fsutil behavior set disable8dot3 1 >nul 2>&1
fsutil behavior set disablecompression 1 >nul 2>&1
fsutil behavior set disableencryption 1 >nul 2>&1
fsutil behavior set disablelastaccess 1 >nul 2>&1
fsutil behavior set disablespotcorruptionhandling 1 >nul 2>&1
fsutil behavior set encryptpagingfile 0 >nul 2>&1
fsutil behavior set quotanotify 10800 >nul 2>&1
fsutil behavior set disabledeletenotify 0 >nul 2>&1
fsutil repair set C: 0 >nul 2>&1

:: SET SVCHOST
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "!SVCHOST!" /f >nul 2>&1

:: MEMORY CACHE SIZE AND MFT SPACE
if !TOTAL_MEMORY! LSS 8000000 (
	fsutil behavior set memoryusage 1 >nul 2>&1
	fsutil behavior set mftzone 1 >nul 2>&1
) else if !TOTAL_MEMORY! LSS 16000000 (
	fsutil behavior set memoryusage 1 >nul 2>&1
	fsutil behavior set mftzone 2 >nul 2>&1
) else (
	fsutil behavior set memoryusage 2 >nul 2>&1
	fsutil behavior set mftzone 2 >nul 2>&1
)

:: SET AND IMPORT POWERPLAN
powercfg /import "%SYSTEMROOT%\Heaven\Heaven.pow" 11111111-1111-1111-1111-111111111111 >nul 2>&1
powercfg /s 11111111-1111-1111-1111-111111111111 >nul 2>&1

:: DISABLE USB AND DEVICES POWER SAVINGS
powershell -NoProfile -Command "$devices = Get-WmiObject Win32_PnPEntity; $powerMgmt = Get-WmiObject MSPower_DeviceEnable -Namespace root\wmi; foreach ($p in $powerMgmt){$IN = $p.InstanceName.ToUpper(); foreach ($h in $devices){$PNPDI = $h.PNPDeviceID; if ($IN -like \"*$PNPDI*\"){$p.enable = $False; $p.psbase.put()}}}" >nul 2>&1
for %%i in (EnhancedPowerManagementEnabled AllowIdleIrpInD3 EnableSelectiveSuspend DeviceSelectiveSuspended
    SelectiveSuspendEnabled SelectiveSuspendOn EnumerationRetryCount ExtPropDescSemaphore WaitWakeEnabled
    D3ColdSupported WdfDirectedPowerTransitionEnable EnableIdlePowerManagement IdleInWorkingState) do (
        for /f %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Enum" /s /f "%%i"^| findstr "HKEY"') do (
            reg add "%%a" /v "%%i" /t REG_DWORD /d "0" /f >nul 2>&1
        )
    )

:: DISABLE DRIVE POWER SAVINGS
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Storage" /v "StorageD3InModernStandby" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v "DisplayPowerSaving" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\pci\Parameters" /v "ASPMOptOut" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters\Device" /v "IdlePowerMode" /t REG_DWORD /d "0" /f >nul 2>&1

for /f "tokens=*" %%i in ('reg query "HKLM\SYSTEM\CurrentControlSet\Enum" /s /f "StorPort"^| findstr "StorPort"') do reg add "%%i" /v "EnableIdlePowerManagement" /t REG_DWORD /d "0" /f >nul 2>&1
for /f "eol=E" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services" /s /f "EnableHIPM"^| findstr /v "EnableHIPM"') do (
  reg add "%%a" /f /v "EnableHIPM" /t REG_DWORD /d 0 >nul 2>&1
  reg add "%%a" /f /v "EnableDIPM" /t REG_DWORD /d 0 >nul 2>&1
)

:: DISABLE MEMORY COMPRESSION & PAGE COMBINING
call:POWERSHELL "Disable-MMAgent -PageCombining"
call:POWERSHELL "Disable-MMAgent -MemoryCompression"

:: DISABLE SCHEDULED TASKS
schtasks /change /disable /TN "\Microsoft\Windows\AppID\EDP Policy Manager" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\AppID\PolicyConverter" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\AppID\VerifiedPublisherCertStoreCheck" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\Application Experience\PcaPatchDbTask" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\Application Experience\StartupAppTask" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\ApplicationData\appuriverifierdaily" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\ApplicationData\appuriverifierinstall" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\ApplicationData\DsSvcCleanup" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\BrokerInfrastructure\BgTaskregistrationMaintenanceTask" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\CertificateServicesClient\AikCertEnrollTask" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\CertificateServicesClient\KeyPregenTask" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\Clip\License Validation" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\Defrag\ScheduledDefrag" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\DeviceDirectoryClient\HandleCommand" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\DeviceDirectoryClient\HandleWnsCommand" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\DeviceDirectoryClient\IntegrityCheck" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\DeviceDirectoryClient\LocateCommandUserSession" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\DeviceDirectoryClient\registerDeviceAccountChange" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\DeviceDirectoryClient\registerDeviceLocationRightsChange" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\DeviceDirectoryClient\registerDevicePeriodic24" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\DeviceDirectoryClient\registerDevicePolicyChange" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\DeviceDirectoryClient\registerDeviceProtectionStateChanged" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\DeviceDirectoryClient\registerDeviceSettingChange" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\DeviceDirectoryClient\registerUserDevice" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\Diagnosis\Scheduled" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\DiskFootprint\Diagnostics" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\InstallService\ScanForUpdates" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\InstallService\ScanForUpdatesAsUser" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\InstallService\SmartRetry" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\Management\Provisioning\Cellular" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\MemoryDiagnostic\ProcessMemoryDiagnosticEvents" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\MemoryDiagnostic\RunFullMemoryDiagnostic" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\MUI\LPRemove" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\SoftwareProtectionPlatform\SvcRestartTaskNetwork" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\StateRepository\MaintenanceTasks" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\Subscription\EnableLicenseAcquisition" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\Subscription\LicenseAcquisition" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\Sysmain\ResPriStaticDbSync" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\Sysmain\WsSwapAssessmentTask" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\Windows Error Reporting\QueueReporting" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\Windows Filtering Platform\BfeOnServiceStartTypeChange" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\Windows Media Sharing\UpdateLibrary" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\Wininet\CacheTask" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\XblGameSave\XblGameSaveTask" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\Device Setup\Metadata Refresh" >nul 2>&1
schtasks /delete /f /tn "\Microsoft\Windows\PLA\System" >nul 2>&1
schtasks /delete /f /tn "\Microsoft\Windows\PLA" >nul 2>&1
schtasks /delete /f /tn "\Microsoft\Windows\RetailDemo\CleanupOfflineContent" >nul 2>&1
schtasks /delete /f /tn "\Microsoft\Windows\RetailDemo" >nul 2>&1
schtasks /delete /f /tn "\Microsoft\Windows\SyncCenter" >nul 2>&1
schtasks /delete /f /tn "\Microsoft\Windows\TaskScheduler" >nul 2>&1
schtasks /delete /f /tn "\Microsoft\Windows\Windows Activation Technologies" >nul 2>&1
schtasks /delete /f /tn "\Microsoft\Windows\UpdateOrchestrator\Schedule Scan" >nul 2>&1
schtasks /delete /f /tn "\Microsoft\Windows\UpdateOrchestrator" >nul 2>&1
schtasks /delete /f /tn "\Microsoft\Windows\WindowsUpdate\Scheduled Start" >nul 2>&1
schtasks /delete /f /tn "\Microsoft\Windows\WindowsUpdate" >nul 2>&1
schtasks /delete /f /tn "\Microsoft\Windows\WaaSMedic" >nul 2>&1

:: --- INTERNET ---

:: DISABLE NAGLE'S ALGORITHM
for /f %%i in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do (
  reg add "HKLM\System\CurrentControlSet\services\Tcpip\Parameters\Interfaces\%%i" /v "TcpAckFrequency" /t REG_DWORD /d "1" /f >nul 2>&1
  reg add "HKLM\System\CurrentControlSet\services\Tcpip\Parameters\Interfaces\%%i" /v "TcpDelAckTicks" /t REG_DWORD /d "0" /f >nul 2>&1
  reg add "HKLM\System\CurrentControlSet\services\Tcpip\Parameters\Interfaces\%%i" /v "TCPNoDelay" /t REG_DWORD /d "1" /f >nul 2>&1
)

:: DISABLE NETWORK ADAPTERS
call:POWERSHELL "disable-netadapterbinding -name "*" -componentid ms_lldp, ms_lltdio, ms_implat, ms_tcpip6, ms_rspndr, ms_server, ms_msclient"

:: QOS
reg add "HKLM\Software\Policies\Microsoft\Windows\Psched" /v "TimerResolution" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\QoS" /v "Do not use NLA" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows NT\DNSClient" /v "EnableMulticast" /t REG_DWORD /d "0" /f >nul 2>&1

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

:: --- REGISTRY OPTIMIZATIONS ---

:: DELETE DEFAULTUSER0 ACCOUNT
net user defaultuser0 /delete >nul 2>&1

:: RESTORE AND CONIFGURE PHOTO VIEWER FROM W7
for %%i in (tif tiff bmp dib gif jfif jpe jpeg jpg jxr png) do (
	reg add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".%%~i" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f >nul 2>&1
)

:: ADD BATCH TO FILE CONTEXT MENU
reg add "HKEY_LOCAL_MACHINE\Software\Classes\.bat\ShellNew" /v "ItemName" /t REG_EXPAND_SZ /d "@C:\Windows\System32\acppage.dll,-6002" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\Software\Classes\.bat\ShellNew" /v "NullFile" /t REG_SZ /d "" /f >nul 2>&1

:: ADD REG TO FILE CONTEXT MENU
reg add "HKEY_LOCAL_MACHINE\Software\Classes\.reg\ShellNew" /v "ItemName" /t REG_EXPAND_SZ /d "@C:\Windows\regedit.exe,-309" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\Software\Classes\.reg\ShellNew" /v "NullFile" /t REG_SZ /d "" /f >nul 2>&1

:: double click to import power plans
reg add "HKEY_LOCAL_MACHINE\Software\Classes\powerplan\DefaultIcon" /ve /t REG_SZ /d "%%WinDir%%\System32\powercpl.dll,1" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\Software\Classes\powerplan\Shell\open\command" /ve /t REG_SZ /d "powercfg /import \"%%1\"" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\Software\Classes\.pow" /ve /t REG_SZ /d "powerplan" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\Software\Classes\.pow" /v "FriendlyTypeName" /t REG_SZ /d "PowerPlan" /f >nul 2>&1

:: MISC TWEAKS
lodctr /r >nul 2>&1
lodctr /r >nul 2>&1

:: FINISHING
echo Script has ended...

:: Restarting
shutdown /r /f /t 7 /c "POST TWEAKS COMPLETED: RESTARTING"

:: CLEANUP
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "POST INSTALL" /f >nul 2>&1
RD /s /q "%SYSTEMROOT%\Heaven"
DEL "%~f0"
exit

:CONFIG

REM Check Ethernet connection
set /a ETHERNET=0
ping -n 1 1.1.1.1 >nul 2>&1
if %errorlevel% EQU 0 ( set /a ETHERNET=1 )
ping -n 1 8.8.8.8 >nul 2>&1
if %errorlevel% EQU 0 ( set /a ETHERNET=1 )

REM Power plan GUID
set "POWER_GUID=%random:~0,1%%random:~0,1%%random:~0,1%%random:~0,1%%random:~0,1%%random:~0,1%%random:~0,1%%random:~0,1%-%random:~0,1%%random:~0,1%%random:~0,1%%random:~0,1%-%random:~0,1%%random:~0,1%%random:~0,1%%random:~0,1%-%random:~0,1%%random:~0,1%%random:~0,1%%random:~0,1%-%random:~0,1%%random:~0,1%%random:~0,1%%random:~0,1%%random:~0,1%%random:~0,1%%random:~0,1%%random:~0,1%%random:~0,1%%random:~0,1%%random:~0,1%%random:~0,1%"

REM Total memory and SvcHost
for /f "skip=1" %%i in ('wmic os get TotalVisibleMemorySize') do if not defined TOTAL_MEMORY set "TOTAL_MEMORY=%%i" & set /a SVCHOST=%%i+1024000
goto:eof

:POWERSHELL
chcp 437 >nul 2>&1 & powershell -nop -noni -exec bypass -c %* >nul 2>&1 & chcp 65001 >nul 2>&1
goto:eof