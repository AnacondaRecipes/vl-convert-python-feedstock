#!/bin/bash
set -ex

export LIBSQLITE3_SYS_USE_PKG_CONFIG=1

if [ -n "${CC}" ]; then
    CARGO_TARGET=$(rustc -vV | grep 'host:' | awk '{print $2}')
    mkdir -p .cargo
    cat > .cargo/config.toml <<EOF
[target.${CARGO_TARGET}]
linker = "${CC}"
EOF
fi

${PYTHON} -m pip install . -vv --no-deps --no-build-isolation
