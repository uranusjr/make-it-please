@echo off

if "%1" == "-a" (
    where "%2"
) else (
    where "%2" | bat -r 0:1 -pp
)
