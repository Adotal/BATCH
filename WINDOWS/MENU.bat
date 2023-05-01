@echo off
@echo off
title Bienvenid@ %USERNAME% a @Im_blog menu
color 3
mode con:cols=80 lines=40

:inicio
set var=0
cls
echo ----------------------
echo %DATE% %TIME%
echo ----------------------
echo .

echo 1 Opcion 1
echo 2 Opcion 2
echo 3 Opcion 3
echo 4 Opcion 4
echo 5 Opcion 5
echo 6 Salir 
echo ----------------------
echo .

rem set /p var=^> Seleccione una opcion [1-6]:
set /p var=  Seleccione una opcion [1-6]:

if "%var%"=="0" goto inicio
if "%var%"=="1" goto op1
if "%var%"=="2" goto op2
if "%var%"=="3" goto op3
if "%var%"=="4" goto op4
if "%var%"=="5" goto op5
if "%var%"=="6" goto salir

::Mensaje de error, validación cuando se selecciona una opcion fuera de rango
echo . El numero %var% no es una opcion valida
echo .
pause
echo .
goto:inicio

:op1
   echo .
   echo . Has elegido la opcion No. 1
   echo .
     ::Líneas de comando de la opcion 1
   color 08
   echo .
   pause
   goto:inicio
:op2
   echo .
   echo . Has elegido la opcion No. 2
:salir
