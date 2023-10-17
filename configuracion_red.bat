@echo off
set /p choice= Quieres configurar la IP estatica? (S/N): 

if /i "%choice%"=="S" (

    netsh interface ip set address "Ethernet" static 192.168.1.200 255.255.255.0 192.168.1.1
    netsh interface ip set dns "Ethernet" static 8.8.8.8
    netsh interface ip add dns "Ethernet" 1.1.1.1 index=2
    echo Configuracion IP estatica aplicada.

) else if /i "%choice%"=="N" (
    netsh interface ip set address "Ethernet" dhcp
    netsh interface ip set dns "Ethernet" dhcp
    echo Configuracion DHCP aplicada.
    ipconfig /renew

) else (
    echo Opcion no valida. Por favor, ingresa S o N.
)

pause