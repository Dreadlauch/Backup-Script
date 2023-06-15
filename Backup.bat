@echo off
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"

set "datestamp=%DD%.%MM%.%YYYY%"
set logDir=%Drive%\LOG

set backupSourceUsrDir=C:\users\dreadlauch
set exceptions="C:\Users\dreadlauch\Documents\My Music" "C:\Users\dreadlauch\Documents\My Pictures" "C:\Users\dreadlauch\Documents\My Videos" "C:\Users\dreadlauch\Documents\My Documents"
set Drive=%~d0
set backupSourceD=D:\Sicherungen

set backupDest=%Drive%\Backups\


:: copy C:\user\
robocopy "%backupSourceUsrDir%\Documents" "%backupDest%\%datestamp%\C\users\dreadlauch\Documents" /E /xd %exceptions% /tee /log+:%logDir%\%datestamp%.txt
robocopy "%backupSourceUsrDir%\Music" "%backupDest%\%datestamp%\C\users\dreadlauch\Music" /E /tee /log+:%logDir%\%datestamp%.txt
robocopy "%backupSourceUsrDir%\Pictures" "%backupDest%\%datestamp%\C\users\dreadlauch\Pictures" /E /tee /log+:%logDir%\%datestamp%.txt
robocopy "%backupSourceUsrDir%\Videos" "%backupDest%\%datestamp%\C\users\dreadlauch\Videos" /E /tee /log+:%logDir%\%datestamp%.txt
robocopy "%backupSourceUsrDir%\Desktop" "%backupDest%\%datestamp%\C\users\dreadlauch\Desktop" /E /tee /log+:%logDir%\%datestamp%.txt
:: copy FL-Studio sound packs & The Binding of Isaac mods
robocopy "C:\Program Files\Image-Line\FL Studio 21\Data\Patches\Packs" "%backupDest%\%datestamp%\C\Program Files\Image-Line\FL Studio 21\Data\Patches\Packs" /E /tee /log+:%logDir%\%datestamp%.txt
robocopy "C:\Program Files (x86)\Steam\steamapps\common\The Binding of Isaac Rebirth\mods" "%backupDest%\%datestamp%\C\Program Files (x86)\Steam\steamapps\common\The Binding of Isaac Rebirth\mods" /E /tee /log+:%logDir%\%datestamp%.txt


:: copy all other drives to the backup-disk
robocopy "%backupSourceD%" "%backupDest%\%datestamp%\D" /E /tee /log+:%logDir%\%datestamp%.txt

CALL zip.bat