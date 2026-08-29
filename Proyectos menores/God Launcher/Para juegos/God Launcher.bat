@echo off
setlocal enabledelayedexpansion

:: Verificar si se ejecuta como administrador
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo ========================================
    echo    ERROR: Este script necesita permisos
    echo           de ADMINISTRADOR para correr.
    echo ========================================
    pause
    exit /b
)

:: Si es admin, sigue normalmente
echo OK: Se está ejecutando como administrador.
cls

:menu
title God OTG

:: Escanear la carpeta actual por archivos .exe
set "ruta="
for %%F in (*.exe) do (
    set "ruta=%%F"
    goto :encontrado
)
:encontrado
if "%ruta%"=="" (
    echo No se encontro ningun archivo .exe en la carpeta.
    pause
    exit /b
)
for %%A in ("%ruta%") do set nombre=%%~nxA

:Opti
echo Aplicando configuraciones
timeout /t 1 /nobreak >nul
cls
echo Aplicando configuraciones.
timeout /t 1 /nobreak >nul
cls
echo Aplicando configuraciones..
timeout /t 1 /nobreak >nul
cls
echo Aplicando configuraciones...
timeout /t 2 /nobreak >nul
cls

:: Detener servicios
net stop uxsms
net stop SysMain
net stop DiagTrack
net stop Themes
net stop WSEARCH
net stop wuauserv
net stop FontCache
net stop UevAgentService
net stop TabletInputService
net stop ShellHWDetection
net stop shpamsvc
net stop RemoteRegistry
net stop AJRouter
net stop AssignedAccessManagerSvc
net stop MapsBroker
net stop DPS
net stop PcaSvc
net stop diagsvc
net stop WbioSrvc
net stop WerSvc
net stop WaaSMedicSvc
net stop diagnosticshub.standardcollector.service
net stop sppsvc
cls

echo Servicios detenidos correctamente.
timeout /t 1 /nobreak >nul
cls

echo Estableciendo prioridad al juego...
timeout /t 1 /nobreak >nul
cls

:Prioridad
echo Elige la prioridad del juego:
echo 1. Alta
echo 2. Por encima de lo normal
echo 3. Normal
echo 4. Por debajo de lo normal
echo 5. Inactivo
set /p prioridad=Selecciona una opcion (1-5): 

:: Iniciar el juego
start "" "%ruta%"
timeout /t 2 >nul

:: Aplicar prioridad
if "%prioridad%"=="1" (
    wmic process where name="%nombre%" CALL setpriority 128
) else if "%prioridad%"=="2" (
    wmic process where name="%nombre%" CALL setpriority 32768
) else if "%prioridad%"=="3" (
    wmic process where name="%nombre%" CALL setpriority 32
) else if "%prioridad%"=="4" (
    wmic process where name="%nombre%" CALL setpriority 16384
) else if "%prioridad%"=="5" (
    wmic process where name="%nombre%" CALL setpriority 64
) else (
    echo Opcion invalida. Volviendo a seleccionar...
    goto Prioridad
)

timeout /t 2 >nul
cls

echo Aplicando la prioridad al juego...
timeout /t 1 /nobreak >nul
cls

echo Cerrando aplicaciones innecesarias...
timeout /t 1 /nobreak >nul
cls

taskkill /f /im CompatTelRunner.exe
taskkill /f /im OneDrive.exe
taskkill /f /im Dropbox.exe
taskkill /f /im SearchIndexer.exe
taskkill /f /im SearchUI.exe
taskkill /f /im control.exe
taskkill /f /im mmc.exe
taskkill /f /im spoolsv.exe
taskkill /f /im StartMenuExperienceHost.exe
taskkill /f /im taskhostw.exe
taskkill /f /im mscorsvw.exe
taskkill /f /im MicrosoftEdgeUpdate.exe
taskkill /f /im TextInputHost.exe
taskkill /f /im SystemSettings.exe
taskkill /f /im WinStore.App.exe
cls

echo Aplicaciones cerradas correctamente.
timeout /t 1 /nobreak >nul
cls

echo Esperando hasta que el usuario cierre el juego...

:esperar
timeout /t 15 >nul
tasklist /FI "IMAGENAME eq %nombre%" 2>NUL | find /I "%nombre%" >NUL
if not errorlevel 1 (
    goto esperar
)

echo El proceso %nombre% fue cerrado.
echo Restableciendo cambios...
timeout /t 1 /nobreak >nul
cls

:: Reiniciar servicios
net start uxsms
net start SysMain
net start DiagTrack
net start Themes
net start WSEARCH
net start wuauserv
net start FontCache
net start UevAgentService
net start TabletInputService
net start ShellHWDetection
net start shpamsvc
net start RemoteRegistry
net start AJRouter
net start AssignedAccessManagerSvc
net start MapsBroker
net start DPS
net start PcaSvc
net start diagsvc
net start WbioSrvc
net start WerSvc
net start diagnosticshub.standardcollector.service
net start sppsvc

echo Cambios restablecidos correctamente.
timeout /t 1 /nobreak >nul
cls

echo 1. Volver al menu
echo 2. Salir
set /p opcion=Selecciona una opcion (1-2): 
if "%opcion%"=="1" (
    goto menu
) else if "%opcion%"=="2" (
    exit
) else (
    echo Opcion invalida. Saliendo...
    exit
)

pause
exit