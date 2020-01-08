@echo off

if "%1" == "-a" (
    where "%2"
) else (
    where "%1" | bat -r 0:1 -pp
)
