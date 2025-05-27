@echo off
echo Iniciando servidor HTTPS para PWA...
cd /d "c:\Users\diego\LocalDocuments\ut\mariano\practica2pwa"

echo.
echo ===========================================
echo  Servidor HTTPS para PWA Development
echo ===========================================
echo.

REM Verificar si los certificados existen
if not exist "certificates\server.crt" (
    echo Generando certificados SSL...
    node setup-https.js
    echo.
)

echo Iniciando servidor HTTPS en puerto 5500...
start /B node https-server.js

echo Esperando que el servidor inicie...
timeout /t 3 /nobreak >nul

echo.
echo Abriendo navegador con configuracion PWA...
echo URL: https://localhost:5500
echo.
echo IMPORTANTE: Acepta la advertencia de certificado en el navegador
echo.

REM Abrir en el navegador predeterminado
start https://localhost:5500

echo.
echo Iniciando servidor HTTPS en puerto 8443...
echo URL: https://localhost:8443
echo.
echo Instrucciones:
echo 1. Acepta el certificado auto-firmado en Chrome
echo 2. Ve a DevTools (F12) ^> Lighthouse
echo 3. Selecciona solo "Progressive Web App"
echo 4. Ejecuta la auditoria
echo.

node https-server.js
