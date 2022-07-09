# Building From Source

CREDITS: **Zusier, imribiy, aeon**
We are an open-source project, you can build Heaven in most part by yourself.
Therefore you can contribute project or learn new things about windows.

### What is needed? 

- NTLite Software with "Home" or higher license.
- 7Zip, WinRar or other archive extractor.
- Take Ownership or Unlocker.
- A Default Windows Build from Microsoft. You can choose MSDN one, or this which is public.
([1](https://tb.rg-adguard.net/) [2](https://www.heidoc.net/joomla/technology-science/microsoft/67-microsoft-windows-iso-download-tool) [3](https://uupdump.net))

### Building Process

1. Extract the Windows Build using 7Zip or WinRar.
2. Open NTLite and drag extracted folder to it.
3. Load Windows Edition (e.g. Pro, Home).
4. Apply Heaven's latest preset.
5. Integrate drivers, regs or updates if needed.
5. Copy these folders to NTLite mount directory (right click).
  ```
  - Configuration >> %temp%\NLTmpMount01\ProgramFiles\Windows Optimization
  - Web >> %temp%\NLTmpMount01\Windows\Web
  - Heaven Folder >> %temp%\NLTmpMount01\Windows\Heaven
  - Setup >> %temp%\NLTmpMount01\Users\Default\Desktop
  ```
6. Delete the following files or folders using Take Ownership or Unlocker:
  ```
  - %temp%\NLTmpMount01\Windows\System32\mobsync.exe
  - %temp%\NLTmpMount01\Windows\System32\GameBarPresenceWriter.exe
  - %temp%\NLTmpMount01\Windows\System32\backgroundtaskhost.exe
  - %temp%\NLTmpMount01\Windows\System32\Catroot2
  ```
7. Make any changes you want to NTLite's settings, components; not for basic users
8. Go to the "Apply" tab and:
8.1. You can choose .ESD or .WIM compression. ESD is needed when you did your ISO completely.
8.2. NTLite gives you the ability to save ISO wherever you want. Save it to a preferred location.
9. Done.

## Resources used during developement
- [VCRedist](https://github.com/abbodi1406/vcredist)
- [DevManView](https://www.nirsoft.net/utils/device_manager_view.html)
- [7-Zip](https://www.7-zip.org)
- [NSudo](https://github.com/m2team/NSudo)
- [DevCon](https://docs.microsoft.com/en-us/windows-hardware/drivers/devtest/devcon)
