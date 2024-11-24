@echo off
if "%1" NEQ "" (goto run)
chcp 866 > nul
echo ��᫠ 1-9 �몫�祭�� � ���.
echo ���, �� ����� 9 �몫�祭�� � ������.
echo ���� ��� �� ⥪�� �⬥��� ⠩���.

set sum_sec=""
set /p sum_sec="�몫�祭�� �१: "

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
