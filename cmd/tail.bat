@echo off
setlocal enabledelayedexpansion

set file=%1

if "%file%" == "-n" (
    set from=%2
    set file=%3
) else if "%file:~0,2%" == "-n" (
    set from=%file:~2,100000%
    set file=%2
) else (
    set from=10
)

REM Bat does not support negative indexing, so we need to be inventive.
REM This Python one-liner counts lines in the file, and return the result in
REM the status code for BAT to pick up as %errorlevel%.
py -c ^
 "import sys;f=open(sys.argv[1]);c=sum(1 for i in f);f.close();sys.exit(c)" ^
 %file%

set /a from = %errorlevel% - %from%

bat -pp --color=never -r=%from%: %file%
