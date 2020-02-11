@echo off

REM This does not directly work in normal cmd.exe because "cd" is a built-in.
REM You need to register this as a macro with DOSKEY.

if not "%~1" == "-" (
    cd /d %1
    set OLDPWD=%CD%
) else if "%OLDPWD%" == "" (
    echo cd: %%OLDPWD%% not set
    exit /b 1
) else (
    set OLDPWD=%CD%
    cd /d %OLDPWD%
)
