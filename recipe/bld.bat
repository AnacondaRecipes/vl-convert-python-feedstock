set LIBSQLITE3_SYS_USE_PKG_CONFIG=1

%PYTHON% -m pip install . -vv --no-deps --no-build-isolation
if errorlevel 1 exit 1
