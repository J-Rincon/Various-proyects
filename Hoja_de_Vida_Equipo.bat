@echo off

@REM By @JRincon
@REM Datos Dinamicos

set ub=%0
set ruta=%ub:~1,-25%
echo %ruta%

cls
title ESTADO DEL EQUIPO & mode con cols=78 lines=30 && color b0

for /f "usebackq tokens=2 delims==" %%f in (`wmic bios get serialnumber /value`) do set serial=%%f

for /f "usebackq tokens=2 delims=:" %%f in (`systeminfo ^| findstr "Modelo"`) do set model=%%f
set model=%model:~25%

for /f "usebackq tokens=2 delims==" %%f in (`wmic cpu get name /value`) do set procesador=%%f

for /f "usebackq tokens=2 delims=:" %%a in (`systeminfo ^| findstr "memoria"`) do set memory=%%a || for /f "usebackq tokens=2 delims=:" %%a in (`systeminfo ^| findstr "Memory"`) do set memory=%%a
for /f "tokens=1 delims=,." %%b in ("%memory%") do set memoryGb=%%b
set memoryGb=%memoryGb:~10%

for /f "usebackq tokens=2 delims==" %%a in (`"WMIC diskdrive Where (MediaType="Fixed hard disk media") Get Size /value"`) do set size=%%a
for /f %%b in ('powershell %size% /1000/1000/1000') do ( for /f "tokens=1 delims=,." %%c in ("%%b") do set diskspace=%%c)

@REM Datos Ingresados

cls
title ESTADO DEL EQUIPO & mode con cols=78 lines=30 && color b0
echo.
set /p ID= Ingrese su ID de Tecnico: 

cls
title ESTADO DEL EQUIPO & mode con cols=78 lines=30 && color b0
echo.
set /p CT= Ingrese el contrato del Equipo: 

cls
title ESTADO DEL EQUIPO & mode con cols=78 lines=30 && color b0
echo.
set /p CR= Ingrese el serial del Cargador: 

cls
title ESTADO DEL EQUIPO & mode con cols=78 lines=30 && color b0
echo.
set /p SI= Ingrese la placa del equipo: 

cls
title ESTADO DEL EQUIPO & mode con cols=78 lines=30 && color b0
echo (1) Estado Tapa Pantalla (TP)
echo 1 (Buena) 2 (Rayada) 3 (Mala) 4 (desgaste) 5 (Lamina Protectora)
echo ================================================================== 
set /p TP= Ingrese el estado de la Tapa Pantalla: 

cls
title ESTADO DEL EQUIPO & mode con cols=78 lines=30 && color b0
echo (2) Estado Pantalla (P)
echo 1 (Buena) 2 (Mala) 3 (Rota) 4 (Reparar) 5 (Buena-Rayada)
echo 6 (Marco Roto) 7 (Bisel Roto)
echo ================================================================== 
set /p P= Ingrese el estado de la Pantalla: 

cls
title ESTADO DEL EQUIPO & mode con cols=78 lines=30 && color b0
echo (3) Estado Carcasa (C)
echo 1 (Buena) 2 (Mala) 3 (Sin Carcasa) 4 (Reparar) 5 (Rayada)
echo 6 (Desgaste)
echo ================================================================== 
set /p C1= Ingrese el estado de la Carcasa: 

cls
title ESTADO DEL EQUIPO & mode con cols=78 lines=30 && color b0
echo (4) Estado Touchpad (P)
echo 1 (Buena) 2 (Mala) 3 (Btn/Izq/Danado) 4 (Btn/Der/Danado) 5 (Reparar)
echo 6 (Desgaste) 7 (Revisar)
echo ================================================================== 
set /p T= Ingrese el estado del Touchpad: 

cls
title ESTADO DEL EQUIPO & mode con cols=78 lines=30 && color b0
echo (5) Estado Cargador (C)
echo 1 (Danado) 2 (Bueno) 3 (Reparar) 4 (Sin Cargador)
echo ================================================================== 
set /p C2= Ingrese el estado del Cargador: 

cls
title ESTADO DEL EQUIPO & mode con cols=78 lines=30 && color b0
echo (6) Estado Camara (C)
echo 3 (Reparar) 4 (Buena) 5 (Mala) 6 (Revisar)
echo ================================================================== 
set /p C3= Ingrese el estado de la Camara: 

cls
title ESTADO DEL EQUIPO & mode con cols=78 lines=30 && color b0
echo (7) Estado Bisagra (B)
echo 1 (Buena) 2 (Mala) 3 (Reparar) 4 (Rota)
echo ================================================================== 
set /p B= Ingrese el estado de la Bisagra: 

cls
title ESTADO DEL EQUIPO & mode con cols=78 lines=30 && color b0
echo (8) Estado Teclado (T)
echo 1 (Buena) 2 (Mala) 3 (Falla/Boton) 4 (Reparar) 5 (Revisar)
echo 6 (Bueno con Desgaste)
echo ================================================================== 
set /p T2= Ingrese el estado del Teclado: 

cls
title ESTADO DEL EQUIPO & mode con cols=78 lines=30 && color b0
echo (9) Estado TapaBoard (TB)
echo 1 (Reparar) 2 (Buena) 3 (Sin TapaBoard) 4 (Rota) 5 (Desgaste)
echo ================================================================== 
set /p TB= Ingrese el estado de la TapaBoard: 

cls
title ESTADO DEL EQUIPO & mode con cols=78 lines=30 && color b0
echo (10) Estado Bateria (B)
echo 1 (Falta Bateria) 2 (Buena) 3 (Mala) 4 (Revisar) 5 (Regular)
echo ================================================================== 
set /p B2= Ingrese el estado de la Bateria: 

cls
title ESTADO DEL EQUIPO & mode con cols=78 lines=30 && color b0
echo Sugerencias
echo F12 (Arriendo) E12 (Venta) R1 (Reparar) F13 (Repuesto) E11 (Venta Repuesto)
echo ================================================================== 
set /p S= Ingrese las Sugerencias del equipo: 

cls
title ESTADO DEL EQUIPO & mode con cols=78 lines=30 && color b0
echo.
echo Notas
echo.
echo ================================================================== 
echo.
set /p N= Ingrese las Observaciones adicionales: 

cls
title ESTADO DEL EQUIPO & mode con cols=78 lines=30 && color b0
if not exist %ruta%\Seriales\ mkdir %ruta%\Seriales\
echo. > %ruta%\Seriales\%serial%.txt
echo TIPO-%model% >> %ruta%\Seriales\%serial%.txt
echo CONTRATO-%CT% >> %ruta%\Seriales\%serial%.txt
echo PROCESADOR-%procesador% >> %ruta%\Seriales\%serial%.txt
echo RAM-%memoryGb% GB >> %ruta%\Seriales\%serial%.txt
echo HDD-%diskspace% GB >> %ruta%\Seriales\%serial%.txt
echo CARGADOR-%CR% >> %ruta%\Seriales\%serial%.txt
echo SIPS-%SI% >> %ruta%\Seriales\%serial%.txt
echo GLPI-%serial% >> %ruta%\Seriales\%serial%.txt
echo TD-TP%TP%,P%P%,C%C1%,T%T%,C%C2%,C%C3%,B%B%,T%T2%,TB%TB%,B%B2% >> %ruta%\Seriales\%serial%.txt
echo SUGERENCIAS-%S% >> %ruta%\Seriales\%serial%.txt
echo ID-%ID% >> %ruta%\Seriales\%serial%.txt
echo NOTA-%N% >> %ruta%\Seriales\%serial%.txt
echo ================================================================ >> %ruta%\Seriales\%serial%.txt
echo.
echo !!HOJA DE VIDA REALIZADA CON EXITO!!
echo.
pause