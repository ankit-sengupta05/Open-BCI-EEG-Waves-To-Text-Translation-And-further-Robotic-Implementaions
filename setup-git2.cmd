@echo off
setlocal
set "SCRIPT=%~dp0setup-git2.ps1"
PowerShell -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT%" %*
exit /b %ERRORLEVEL%
