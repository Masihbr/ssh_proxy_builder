@echo off
call config.cmd

(
echo Set sh = CreateObject^("WScript.Shell"^)
echo Set shortcut = sh.CreateShortcut^("%USERPROFILE%\Desktop\Proxy.lnk"^)
echo shortcut.TargetPath = "%USERPROFILE%\Proxy Settings\proxy_off.cmd"
echo shortcut.IconLocation = "%USERPROFILE%\Proxy Settings\Icons\on.ico"
echo shortcut.Save
)>change_shortcut_off.vbs

(
echo Set sh = CreateObject^("WScript.Shell"^)
echo Set shortcut = sh.CreateShortcut^("%USERPROFILE%\Desktop\Proxy.lnk"^)
echo shortcut.TargetPath = "%USERPROFILE%\Proxy Settings\proxy_on.cmd"
echo shortcut.IconLocation = "%USERPROFILE%\Proxy Settings\Icons\off.ico"
echo shortcut.Save
)>change_shortcut_on.vbs

(
echo Set sh = CreateObject^("WScript.Shell"^)
echo Set shortcut = sh.CreateShortcut^("%USERPROFILE%\Desktop\vpn.lnk"^)
echo shortcut.TargetPath = "%USERPROFILE%\Proxy Settings\vpn.cmd"
echo shortcut.IconLocation = "%USERPROFILE%\Proxy Settings\Icons\vpn.ico"
echo shortcut.Save
)>make_vpn.vbs

replace .\src\proxy_off.cmd /A
replace .\src\proxy_off.cmd

replace .\src\proxy_on.cmd /A
replace .\src\proxy_on.cmd

replace .\src\vpn.cmd /A
replace .\src\vpn.cmd

change_shortcut_off
change_shortcut_on
make_vpn