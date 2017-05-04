@echo off

if "%~1"=="" (
    echo Please 
    goto :eof
)

set "result="
set "penis=penis"

REM for loops are easy they say. not in batch
for /f "tokens=* delims=/ " %%a in (%1) do for %%x in (%%a) do call :addPenis

echo %result% > %1

goto :eof

:addPenis
set "result=%result%%penis% "
goto :eof
