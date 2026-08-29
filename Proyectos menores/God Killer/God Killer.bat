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

echo Cerrando programas de mierda
timeout /t 2
cls

taskkill /f /im DriverBooster.exe
taskkill /f /im Microsoft.SharePoint.exe
taskkill /f /im MicrosoftEdgeUpdate.exe
taskkill /f /im WmiPrvSE.exe
timeout /t 2
cls

echo Programas de mierda cerrados correctamente

pause