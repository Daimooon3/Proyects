@echo off
:MENU
cls
echo -------------------------------------------------------------------------------
echo                     OPTIMIZADOR LOARLA
echo -------------------------------------------------------------------------------
echo -------------------------------------------------------------------------------
echo Selecciona una opcion (Opciones 2 y 3 no implementadas):
echo 1. Optimizador        2. Opciones
echo 3. Acerca de          4. Salir
echo -------------------------------------------------------------------------------
echo.
set /p opcion="Selecciona una opcion (1-4): "

if "%opcion%"=="1" goto Optimizador
if "%opcion%"=="2" goto Opciones
if "%opcion%"=="3" goto Acercade
if "%opcion%"=="4" goto Salir
echo Opcion invalida. Presiona cualquier tecla para intentar de nuevo.
pause >nul
goto MENU

:Optimizador
cls
echo Escaneando ejecutables en la carpeta del optimizador...
timeout /t 2 /nobreak >nul

setlocal enabledelayedexpansion
set count=0

for /f "delims=" %%f in ('dir /b "%~dp0*.exe" 2^>nul') do (
    set /a count+=1
    set "exe[!count!]=%%f"
    echo !count!. %%f
)

if %count%==0 (
    echo.
    echo No se encontraron archivos .exe
    pause
    goto MENU
)

echo.
set /p exe_choice="Selecciona el numero del ejecutable: "

if not defined exe[%exe_choice%] (
    echo Opcion invalida.
    pause
    goto Optimizador
)

set "app_path=%~dp0!exe[%exe_choice%]!"
endlocal & set "app_path=%app_path%"

echo.
echo Ejecutable seleccionado:
echo %app_path%
pause
goto procesos


:procesos
cls
tasklist /FI "USERNAME ne NT AUTHORITY\SYSTEM" /FI "USERNAME ne LOCAL SERVICE" /FI "USERNAME ne NETWORK SERVICE"
set /p proceso="Ingresa el nombre del proceso que deseas cerrar (con extension .exe) (escribe no para no cerrar nada)                   (escribe lo para actualizar): "
if "%proceso%"=="no" goto Prioridad
if "%proceso%"=="lo" goto Optimizador
taskkill /IM "%proceso%" /F
echo Proceso %proceso% cerrado (si existia).
timeout /t 2 /nobreak >nul
goto LOOP
:LOOP
Set /p loop="Quieres cerrar otro proceso? (S/N): "
if "%loop%"=="S" goto Optimizador
if "%loop%"=="N" goto Prioridad
echo Opcion invalida. Volviendo a preguntar...
goto LOOP

:Prioridad
cls
echo Elige la prioridad del juego:
echo 1. Alta
echo 2. Por encima de lo normal
echo 3. Normal
echo 4. Por debajo de lo normal
echo 5. Inactivo
set /p prioridad="Selecciona una opcion (1-5): "

if "%prioridad%"=="1" (
    set prioridad_flag=/HIGH
) else if "%prioridad%"=="2" (
    set prioridad_flag=/ABOVENORMAL
) else if "%prioridad%"=="3" (
    set prioridad_flag=/NORMAL
) else if "%prioridad%"=="4" (
    set prioridad_flag=/BELOWNORMAL
) else if "%prioridad%"=="5" (
    set prioridad_flag=/LOW
) else (
    echo Opcion invalida. Intenta de nuevo.
    goto Prioridad
)
qres /x 640 /y 400
:jogo
cls
echo Iniciando el juego
start "" %prioridad_flag% "%app_path%"
echo Juego iniciado. Presiona cualquier tecla para volver al menu.
pause >nul
goto MENU

:Opciones
cls
echo Esta opcion todavia no esta implementada.
pause
goto MENU

:Acercade
cls
echo Esta opcion todavia no esta implementada.
pause
goto MENU

:Salir
cls
timeout /t 1 /nobreak >nul
exit