@echo off
if "%1" NEQ "" (goto run)
echo ��᫠ 1-9 �몫�祭�� � ���.
echo ���, �� ����� 9 �몫�祭�� � ������.
echo ���� ��� �� ⥪�� �⬥��� ⠩���.

set x=""
set /p x="�몫�祭�� �१: "

if %x% LEQ 9 (set/A x*=3600) else (set/A x*=60)

:run

if not defined x (set x=0)

if "%1" == "-h" (set/A x=%2 * 3600 + %x%)
if "%1" == "-m" (set/A x=%2 * 60 + %x%)
if "%1" == "-s" (set/A x=%2 + %x%)

if "%3" == "-h" (set/A x=%4 * 3600 + %x%)
if "%3" == "-m" (set/A x=%4 * 60 + %x%)
if "%3" == "-s" (set/A x=%4 + %x%)

if "%5" == "-h" (set/A x=%6 * 3600 + %x%)
if "%5" == "-m" (set/A x=%6 * 60 + %x%)
if "%5" == "-s" (set/A x=%6 + %x%)

if %x% NEQ 0 (shutdown -s -t %x%) else (shutdown -a)
