@echo on

set "LIBSQLITE3_SYS_USE_PKG_CONFIG=1"
set "AWS_LC_SYS_CMAKE_BUILDER=1"

if "%target_platform%" == "win-arm64" (
  set "V8_FROM_SOURCE=1"
  set "CLANG_BASE_PATH=%BUILD_PREFIX%\Library"
  set "LIBCLANG_PATH=%BUILD_PREFIX%\Library\bin"
)

%PYTHON% -m pip install --no-deps --ignore-installed . -vv
if errorlevel 1 exit 1
