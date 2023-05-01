@echo off
title OPTIMIZED WINDOWS; BY ADOTAL
::Version 0.9

::Command interface
color B
mode con: cols=100 lines=40

:start
set val=0
cls
echo.
echo --------------------------------------------------------------------------------------------
echo                         %USERNAME%, PLEASE EXEC WITH ADMIN PERMITIONS
echo.
echo      1- DELETE ALL TEMPORARY FILES
echo      2- POWER PLAN
echo      3- ENABLE HIBERNATION
echo      4- EMPTY RECYCLE BIN
echo.
echo      5- REBOOT
echo      6- SHUTDOWN 
echo      7- HIBERNATE
echo      0- EXIT
echo --------------------------------------------------------------------------------------------
cd C:\Users\%USERNAME%\Desktop

set /p val= Select an option [0-7]: 

if "%val%"=="1" goto tmp
if "%val%"=="2" goto energy
if "%val%"=="3" goto hibern
if "%val%"=="4" goto recyclebn
if "%val%"=="5" goto reboot
if "%val%"=="6" goto shutdwn
if "%val%"=="7" goto hibernow
if "%val%"=="0" exit
 
 ::Error promptString
 echo.
 echo OPTION "%val%" IS NOT AVAILABLE
 pause
 goto:start
 
:tmp
C:
cd %TMP%
RD /S /Q .\
cd C:\Windows\Temp
RD /S /Q .\
cd C:\Windows\Prefetch
RD /S /Q .\
cd\
del /F /S /Q *.tmp
echo.
echo TEMPORARY FILES DELETED
pause
goto:start

:energy
set opt=0
cls
echo.
echo --------------------------------------------------------------------------------------------
echo                                ENERGY MODES
echo.
echo      1- CURRENT PLAN
echo      2- HIGH PERFORMANCE
echo      3- BALANCED
echo      4- ECO
echo      5- BACK
echo --------------------------------------------------------------------------------------------
echo.
set /p opt= Select an option [1-4]: 

 if "%opt%"=="1" goto getact
 if "%opt%"=="2" goto high
 if "%opt%"=="3" goto balan
 if "%opt%"=="4" goto eco
 if "%opt%"=="5" goto start

:high
 POWERCFG /S SCHEME_MIN
 echo.
 echo POWER MODE CHANGED TO HIGH PERFORMANCE
 pause
 goto:energy

:balan
 POWERCFG /S SCHEME_BALANCED
 echo.
 echo POWER MODE CHANGED TO BALANCED
 pause
 goto:energy

:eco
 POWERCFG /S SCHEME_MAX
 echo.
 echo POWER MODE CHANGED TO ECO
 pause
 goto:energy

:getact
echo.
echo.
POWERCFG /GETACTIVESCHEME
echo.
echo.
pause
goto:energy

:hibern
set bool=n
set selec=n
echo. 
set /p bool= ENABLE HIBERNATION? [yes/not]:
if "%bool%"=="y"   set selec=y
if "%bool%"=="Y"   set selec=y
if "%bool%"=="yes" set selec=y
if "%bool%"=="Yes" set selec=y
if "%bool%"=="n"   set selec=n
if "%bool%"=="N"   set selec=n
if "%bool%"=="not" set selec=n
if "%bool%"=="Not" set selec=n

echo.
if "%selec%"=="y" POWERCFG /H ON && echo HIBERNATION ENABLED
if "%selec%"=="n" POWERCFG /H OFF && echo HIBERNATION DISABLED
echo.
set /p bool= CREATE A BATCH FILE ON DESKTOP TO HIBERNATE? [yes/not]: 
if "%bool%"=="y"   set selec=y
if "%bool%"=="Y"   set selec=y
if "%bool%"=="yes" set selec=y
if "%bool%"=="Yes" set selec=y
if "%bool%"=="n"   set selec=n
if "%bool%"=="N"   set selec=n
if "%bool%"=="not" set selec=n
if "%bool%"=="Not" set selec=n
echo.

if "%selec%"=="y" (
cd C:\Users\%USERNAME%\Desktop
copy > HIBERNATE.bat
echo SHUTDOWN /H /F > HIBERNATE.bat
echo.
echo FILE GENERATED WITH THE NAME "HIBERNATE.bat"
pause
goto:start
)
if "%selec%"=="n" echo FILE WAS NOT CREATED && pause && goto:start

:recyclebn
rd /S /Q C:\$Recycle.Bin\
echo.
echo RECYCLE BIN EMPTIED
pause
goto:start

:reboot
echo.
set bool=n
set selec=n
set /p bool= PROCEED WITH REBOOT? [yes/not]: 
if "%bool%"=="y"   set selec=y
if "%bool%"=="Y"   set selec=y
if "%bool%"=="yes" set selec=y
if "%bool%"=="Yes" set selec=y
if "%bool%"=="n"   set selec=n
if "%bool%"=="N"   set selec=n
if "%bool%"=="not" set selec=n
if "%bool%"=="Not" set selec=n

if "%selec%"=="n" goto:start
if "%selec%"=="y" shutdown /R /F /T 0

:shutdwn
echo.
set bool=n
set selec=n
set /p bool= PROCEED WITH SHUTDOWN? [yes/not]: 
if "%bool%"=="y"   set selec=y
if "%bool%"=="Y"   set selec=y
if "%bool%"=="yes" set selec=y
if "%bool%"=="Yes" set selec=y
if "%bool%"=="n"   set selec=n
if "%bool%"=="N"   set selec=n
if "%bool%"=="not" set selec=n
if "%bool%"=="Not" set selec=n

if "%selec%"=="n" goto:start
if "%selec%"=="y" shutdown /S /F /T 0

:hibernow
echo.
set bool=n
set selec=n
set /p bool= PROCEED WITH HIBERNATION? [yes/not]: 
if "%bool%"=="y"   set selec=y
if "%bool%"=="Y"   set selec=y
if "%bool%"=="yes" set selec=y
if "%bool%"=="Yes" set selec=y
if "%bool%"=="n"   set selec=n
if "%bool%"=="N"   set selec=n
if "%bool%"=="not" set selec=n
if "%bool%"=="Not" set selec=n

if "%selec%"=="n" goto:start
if "%selec%"=="y" shutdown /H /F

EXIT
