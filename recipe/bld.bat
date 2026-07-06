@echo on

set "LIBSQLITE3_SYS_USE_PKG_CONFIG=1"
set "AWS_LC_SYS_CMAKE_BUILDER=1"

%PYTHON% -m pip install --no-deps --ignore-installed . -vv
if errorlevel 1 exit 1
