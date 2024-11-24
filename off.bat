@echo off
if "%1" NEQ "" (goto run)
chcp 866 > nul
echo Числа 1-9 выключение в часах.
echo Всё, что больше 9 выключение в минутах.
echo Ноль или любой текст отменяет таймер.

set sum_sec=""
set /p sum_sec="Выключение через: "

if %sum_sec% LEQ 9 (set/A sum_sec*=3600) else (set/A sum_sec*=60)

:run
setlocal enabledelayedexpansion
if not defined sum_sec (set sum_sec=0)

for %%A in (%*) do (
    if "!next_param!" equ "hour" (set /a sum_sec=!sum_sec! + %%A * 3600)
	if "!next_param!" equ "minute" (set /a sum_sec=!sum_sec! + %%A * 60)
	if "!next_param!" equ "second" (set /a sum_sec=!sum_sec! + %%A)
	
	if "%%A" equ "-h" (
		set next_param=hour
	) else if "%%A" equ "-m" (
		set next_param=minute
	) else if "%%A" equ "-s" (
		set next_param=second
	) else (set next_param=none)
)

if %sum_sec% NEQ 0 (shutdown -s -t %sum_sec%) else (shutdown -a)
