@echo off
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"

set "datestamp=%DD%.%MM%.%YYYY%"

set Drive=%~d0
set zipSource=%Drive%\Backups
set zipDest=%Drive%\Backups

CD /d %zipSource%\%datestamp%
for %%X in (*) do "C:\Program Files\7-Zip\7z.exe" a "%zipDest%\%datestamp%.zip" "%%X"
for /d %%X in (*) do "C:\Program Files\7-Zip\7z.exe" a "%zipDest%\%datestamp%.zip" "%%X"

CD..
FORFILES /P "%zipSource%" /M * /C "cmd /c rd %datestamp% /S /Q"

CALL cleanup.bat

exit