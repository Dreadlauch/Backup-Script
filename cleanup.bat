:: This Script deletes all *.YYYY.zip files older than 180 days

@echo off
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"

set "datestamp=%DD%.%MM%.%YYYY%"
set Drive=%~d0

FORFILES /P "%Drive%\Backups" /M *.%YYYY%.zip /D -180 /C "cmd /c del @file"

PAUSE

exit