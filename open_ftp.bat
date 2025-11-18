@echo off
title FTP Gateway Opener - By NABIL GHENISSA
color 0A
REM Script to auto-detect gateway IP and open FTP in Windows Explorer
REM Created by: NABIL GHENISSA
REM Date: November 18, 2025

echo.
echo ================================================
echo    FTP Gateway Auto-Detect and Opener
echo    Created by: NABIL GHENISSA
echo ================================================
echo.
echo Detecting default gateway IP...

REM Get the default gateway IP address - extract IP pattern
for /f "tokens=*" %%a in ('ipconfig ^| findstr /C:"Passerelle"') do (
    set line=%%a
    for /f "tokens=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15 delims= " %%b in ("%%a") do (
        set gateway=%%b
        if "%%c" NEQ "" set gateway=%%c
        if "%%d" NEQ "" set gateway=%%d
        if "%%e" NEQ "" set gateway=%%e
        if "%%f" NEQ "" set gateway=%%f
        if "%%g" NEQ "" set gateway=%%g
        if "%%h" NEQ "" set gateway=%%h
        if "%%i" NEQ "" set gateway=%%i
        if "%%j" NEQ "" set gateway=%%j
        if "%%k" NEQ "" set gateway=%%k
        if "%%l" NEQ "" set gateway=%%l
        if "%%m" NEQ "" set gateway=%%m
        if "%%n" NEQ "" set gateway=%%n
        if "%%o" NEQ "" set gateway=%%o
        if "%%p" NEQ "" set gateway=%%p
    )
    goto :found
)

:found
if "%gateway%"=="" (
    echo No gateway IP detected. Please enter manually.
    set /p gateway="Enter FTP IP address: "
)

echo Detected IP: %gateway%
echo.
echo ================================================

REM Set the FTP port
set ftpport=2221

REM Build the FTP URL with the specified port
set ftpaddress=ftp://%gateway%:%ftpport%/

echo Opening %ftpaddress% in Explorer...
echo ================================================
echo.
explorer.exe "%ftpaddress%"

timeout /t 2 >nul

REM Note: Windows Explorer has limited support for custom FTP ports.
REM If connection fails, try using a web browser or dedicated FTP client.
REM For best compatibility, configure your FTP server to use standard port 21.

