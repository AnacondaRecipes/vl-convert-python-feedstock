@echo on

set "LIBSQLITE3_SYS_USE_PKG_CONFIG=1"
set "AWS_LC_SYS_CMAKE_BUILDER=1"

if "%target_platform%" == "win-arm64" (
  set "V8_FROM_SOURCE=1"
  rem The archive has no native ARM64 GN; Windows runs this x64 binary via emulation.
  set "GN=%SRC_DIR%\ninja_gn_binaries\windows-amd64\gn.exe"
  set "LIBCLANG_PATH=%BUILD_PREFIX%\Library\bin"
  if not exist "%BUILD_PREFIX%\Library\bin\libclang.dll" (
    rem clang-sys does not discover conda's versioned libclang-13.dll.
    if not exist "%BUILD_PREFIX%\Library\bin\libclang-13.dll" (
      echo "libclang.dll or libclang-13.dll is required"
      exit 1
    )
    mkdir "%SRC_DIR%\libclang"
    copy /y "%BUILD_PREFIX%\Library\bin\libclang-13.dll" "%SRC_DIR%\libclang\libclang.dll" >nul
    if errorlevel 1 exit 1
    set "LIBCLANG_PATH=%SRC_DIR%\libclang"
  )
  rem Chromium only searches %%ProgramFiles%% for VS2022 by default.
  set "vs2022_install=%VSINSTALLDIR%"
)

%PYTHON% -m pip install --no-deps --ignore-installed . -vv
if errorlevel 1 exit 1
