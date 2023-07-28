@echo off
call "C:\Users\%windows_username%\Proxy Settings\config.cmd"
call "C:\Users\%windows_username%\Proxy Settings\proxy_on.cmd"
stnlc -unat %proxy_username%@%host_ip%:%host_port% -pw=%proxy_password% -proxyListPort=%proxy_port% -proxyFwding=y
call "C:\Users\%windows_username%\Proxy Settings\proxy_off.cmd"

