@echo off
setlocal

set file=%1

if "%file%" == "-n" (
    set end=%2
    set file=%3
) else if "%file:~0,2%" == "-n" (
    set end=%file:~2,100000%
    set file=%2
) else (
    set end=10
)

bat -pp --color=never -r=:%end% %file%
