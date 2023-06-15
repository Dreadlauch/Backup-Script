:: *||* means set you own Directories

@echo off
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"

set "datestamp=%DD%.%MM%.%YYYY%"
set logDir=%Drive%\LOG

set backupSourceUsrDir=C:\users\*||*
set exceptions="C:\Users\*||*\Documents\My Music" "C:\Users\*||*\Documents\My Pictures" "C:\Users\*||*\Documents\My Videos" "C:\Users\*||*\Documents\My Documents"
set Drive=%~d0

set backupDest=%Drive%\Backups\


:: copy C:\user\
robocopy "%backupSourceUsrDir%\Documents" "%backupDest%\%datestamp%\C\users\user\Documents" /E /xd %exceptions% /tee /log+:%logDir%\%datestamp%.txt
robocopy "%backupSourceUsrDir%\Music" "%backupDest%\%datestamp%\C\users\user\Music" /E /tee /log+:%logDir%\%datestamp%.txt
robocopy "%backupSourceUsrDir%\Pictures" "%backupDest%\%datestamp%\C\users\user\Pictures" /E /tee /log+:%logDir%\%datestamp%.txt
robocopy "%backupSourceUsrDir%\Videos" "%backupDest%\%datestamp%\C\users\user\Videos" /E /tee /log+:%logDir%\%datestamp%.txt
robocopy "%backupSourceUsrDir%\Desktop" "%backupDest%\%datestamp%\C\users\user\Desktop" /E /tee /log+:%logDir%\%datestamp%.txt

CALL zip.bat
