#!/usr/bin/env bash
set -ex

if [ -f *.whl ]; then
    # arm64 / aarch64: install pre-built wheel
    cp vl_convert_python*/licenses/LICENSE .
    ${PYTHON} -m pip install *.whl --no-deps --ignore-installed -vv
else
    # Source build (linux_64, osx_64)
    export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
    export AWS_LC_SYS_CMAKE_BUILDER=1

    ${PYTHON} -m pip install . --no-deps --ignore-installed -vv
fi
