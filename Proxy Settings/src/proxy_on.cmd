echo off
call "%USERPROFILE%\Proxy Settings\config.cmd"

for /f "skip=2 tokens=3 delims= " %%R in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable') do (
 set "reg_value=%%R"
)
REM #Remove REM below for debugging
REM echo [Debug]
REM echo REG status: %reg_value%
REM echo file: %~dpnx0
REM echo.
if "%reg_value%" EQU "0x0" goto proxyON
if "%reg_value%" EQU "0x1" goto proxyOFFAndON
goto end

:proxyON
echo Proxy Status: OFF
echo Switching ON proxy . . .
echo.
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /d "127.0.0.1:%proxy_port%" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f
echo. 
goto end

:proxyOFFAndON
echo Proxy Status: ON
echo Switching OFF proxy . . .
echo.
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f
echo. 
echo Switching ON proxy . . .
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /d "127.0.0.1:%proxy_port%" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f
echo.
goto end

:end
"%USERPROFILE%\Proxy Settings\change_shortcut_off.vbs"

