@echo off
call "%USERPROFILE%\Proxy Settings\config.cmd"
call "%USERPROFILE%\Proxy Settings\proxy_on.cmd"
stnlc -unat %proxy_username%@%host_ip%:%host_port% -pw=%proxy_password% -proxyListPort=%proxy_port% -proxyFwding=y
call "%USERPROFILE%\Proxy Settings\proxy_off.cmd"

