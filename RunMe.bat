@echo off
REG QUERY "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders">%Temp%\Temp.txt
FOR /F "TOKENS=2* DELIMS= " %%I IN ('TYPE %Temp%\Temp.txt^|FINDSTR /I "Personal"') DO ( SET "Personal=%%~J" )
del %Temp%\Temp.txt
start "" /WAIT /B evemodx.exe
start "" explorer.exe /root,%personal%
@echo on