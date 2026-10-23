@echo off
setlocal enabledelayedexpansion

echo ====================================================
echo   UniKey Muong - Automated Release Build & Package
echo ====================================================

set "VSWHERE=%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe"
if not exist "!VSWHERE!" (
    echo [ERROR] vswhere.exe not found at: !VSWHERE!
    echo Please make sure Visual Studio is installed.
    pause
    exit /b 1
)

for /f "usebackq tokens=*" %%i in (`"!VSWHERE!" -latest -requires Microsoft.Component.MSBuild -find MSBuild\**\Bin\MSBuild.exe`) do (
    set "MSBUILD=%%i"
)

if not defined MSBUILD (
    echo [WARN] Visual Studio 2017+ MSBuild not found directly via vswhere.
    echo Searching for VS installation path...
    for /f "usebackq tokens=*" %%i in (`"!VSWHERE!" -latest -property installationPath`) do (
        set "VSINSTALLDIR=%%i"
    )
    if defined VSINSTALLDIR (
        if exist "!VSINSTALLDIR!\MSBuild\Current\Bin\MSBuild.exe" set "MSBUILD=!VSINSTALLDIR!\MSBuild\Current\Bin\MSBuild.exe"
        if exist "!VSINSTALLDIR!\MSBuild\15.0\Bin\MSBuild.exe" set "MSBUILD=!VSINSTALLDIR!\MSBuild\15.0\Bin\MSBuild.exe"
    )
)

if not defined MSBUILD (
    echo [ERROR] MSBuild.exe could not be found.
    echo Please verify that Visual Studio "Desktop development with C++" workload is installed.
    pause
    exit /b 1
)

echo [INFO] Found MSBuild: "!MSBUILD!"

echo.
echo [1/3] Building Unicode Release...
"!MSBUILD!" "newkey\newkey.sln" /p:Configuration="Unicode Release" /p:Platform="x86" /t:Rebuild /verbosity:minimal
if %ERRORLEVEL% neq 0 (
    echo [ERROR] Build failed! Check errors above.
    pause
    exit /b %ERRORLEVEL%
)

echo.
echo [2/3] Preparing publish directory...
set "PUBLISH_DIR=publish\UniKey-Muong"
if exist "!PUBLISH_DIR!" rd /s /q "!PUBLISH_DIR!"
mkdir "!PUBLISH_DIR!"

copy /y "urelease\UniKey-Muong.exe" "!PUBLISH_DIR!\" >nul
copy /y "urelease\UKHook35.dll" "!PUBLISH_DIR!\" >nul
copy /y "rtfio\rtfio.dll" "!PUBLISH_DIR!\" >nul
copy /y "license.txt" "!PUBLISH_DIR!\" >nul
copy /y "readme.txt" "!PUBLISH_DIR!\" >nul
if exist "README.md" copy /y "README.md" "!PUBLISH_DIR!\" >nul
if exist "MANUAL.md" copy /y "MANUAL.md" "!PUBLISH_DIR!\" >nul
if exist "DOC.docx" copy /y "DOC.docx" "!PUBLISH_DIR!\" >nul

if not exist "!PUBLISH_DIR!\UniKey-Muong.exe" (
    echo [ERROR] UniKey-Muong.exe was not created in !PUBLISH_DIR!
    pause
    exit /b 1
)

echo.
echo [3/3] Creating ZIP archive...
powershell -Command "Compress-Archive -Path 'publish\UniKey-Muong' -DestinationPath 'publish\UniKey-Muong-Release.zip' -Force"

echo.
echo ====================================================
echo   SUCCESS! Release package generated:
echo   - Folder:  publish\UniKey-Muong\
echo   - Archive: publish\UniKey-Muong-Release.zip
echo ====================================================
