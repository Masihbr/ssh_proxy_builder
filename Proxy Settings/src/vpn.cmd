@echo off

call "%USERPROFILE%\Proxy Settings\config.cmd"

if "%~1" neq "_start_" (
  call "%USERPROFILE%\Proxy Settings\proxy_on.cmd"
  stnlc -unat %proxy_username%@%host_ip%:%host_port% -pw=%proxy_password% -proxyListPort=%proxy_port% -proxyFwding=y
  cmd /c "%~f0" _start_ %*
  call "%USERPROFILE%\Proxy Settings\proxy_off.cmd"
  exit /b
)
shift /1
