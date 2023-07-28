echo off
call "%USERPROFILE%\Proxy Settings\config.cmd"
cls
for /f "skip=2 tokens=3 delims= " %%R in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable') do (
 set "reg_value=%%R"
)
REM #Remove REM below for debugging
REM echo [Debug]
REM echo REG status: %reg_value%
REM echo file: %~dpnx0
REM echo.
if "%reg_value%" EQU "0x1" goto proxyOFF
goto end

:proxyOFF
echo Proxy Status: ON
echo Switching OFF proxy . . .
echo.
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f
echo. 
goto end

:end
"%USERPROFILE%\Proxy Settings\change_shortcut_on.vbs"

