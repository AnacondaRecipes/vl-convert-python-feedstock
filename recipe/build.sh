#!/usr/bin/env bash
set -ex

# Source build (linux_64, osx_64)
export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
export AWS_LC_SYS_CMAKE_BUILDER=1

${PYTHON} -m pip install . --no-deps --ignore-installed -vv
