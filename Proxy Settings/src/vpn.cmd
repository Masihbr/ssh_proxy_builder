@echo off

where stnlc >nul 2>&1
if %errorlevel% equ 0 (
    echo stnlc is okay!
) else (
    echo YOU NEED TO DOWNLOAD AND INSTALL "bitvise ssh client" THEN RUN THE SCRIPT AGAIN!  
    @pause
    exit /b
)

call "%USERPROFILE%\Proxy Settings\config.cmd"

if "%~1" neq "_start_" (
  call "%USERPROFILE%\Proxy Settings\proxy_on.cmd"
  set "wait_time=2"
  :loop
  echo CONNECTED...
  stnlc -unat %proxy_username%@%host_ip%:%host_port% -pw=%proxy_password% -proxyListPort=%proxy_port% -proxyFwding=y | find "ERROR" && (
    timeout %wait_time%
    set /A "wait_time*=2"
    goto loop
  )
  cmd /c "%~f0" _start_ %*
  call "%USERPROFILE%\Proxy Settings\proxy_off.cmd"
  exit /b
)
shift /1
