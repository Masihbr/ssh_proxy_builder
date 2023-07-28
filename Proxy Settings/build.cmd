@echo off
call config.cmd

(
echo username = "%windows_username%"
echo Set sh = CreateObject^("WScript.Shell"^)
echo Set shortcut = sh.CreateShortcut^("C:\Users\" ^& username ^& "\Desktop\Proxy.lnk"^)
echo shortcut.TargetPath = "C:\Users\" ^& username ^& "\Proxy Settings\proxy_off.cmd"
echo shortcut.IconLocation = "C:\Users\" ^& username ^& "\Proxy Settings\Icons\on.ico"
echo shortcut.Save
)>change_shortcut_off.vbs

(
echo username = "%windows_username%"
echo Set sh = CreateObject^("WScript.Shell"^)
echo Set shortcut = sh.CreateShortcut^("C:\Users\" ^& username ^& "\Desktop\Proxy.lnk"^)
echo shortcut.TargetPath = "C:\Users\" ^& username ^& "\Proxy Settings\proxy_on.cmd"
echo shortcut.IconLocation = "C:\Users\" ^& username ^& "\Proxy Settings\Icons\off.ico"
echo shortcut.Save
)>change_shortcut_on.vbs

(
echo username = "%windows_username%"
echo Set sh = CreateObject^("WScript.Shell"^)
echo Set shortcut = sh.CreateShortcut^("C:\Users\" ^& username ^& "\Desktop\vpn.lnk"^)
echo shortcut.TargetPath = "C:\Users\" ^& username ^& "\Proxy Settings\vpn.cmd"
echo shortcut.IconLocation = "C:\Users\" ^& username ^& "\Proxy Settings\Icons\vpn.ico"
echo shortcut.Save
)>make_vpn.vbs

replace .\src\proxy_off.cmd /A
replace .\src\proxy_off.cmd
(echo set windows_username=%windows_username%) > temp.txt & type proxy_off.cmd >> temp.txt & move /y temp.txt proxy_off.cmd >nul

replace .\src\proxy_on.cmd /A
replace .\src\proxy_on.cmd
(echo set windows_username=%windows_username%) > temp.txt & type proxy_on.cmd >> temp.txt & move /y temp.txt proxy_on.cmd >nul

replace .\src\vpn.cmd /A
replace .\src\vpn.cmd
(echo set windows_username=%windows_username%) > temp.txt & type vpn.cmd >> temp.txt & move /y temp.txt vpn.cmd >nul

change_shortcut_off
change_shortcut_on
make_vpn