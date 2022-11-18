#!/bin/bash

set -o nounset
set -o errexit
set -o pipefail

if [[ ! -f /.dockerenv ]]; then
    echo "Does not look like script is running inside a docker container"
    exit 1
fi

# It would be more elegant to have a ready docker image with these things install, maybe next version :)
apt update
apt-get install -y autoconf automake build-essential cmake gettext libtool-bin locales ninja-build pkg-config unzip git

cd /build/src/neovim-nightly

# based on https://github.com/neovim/neovim/blob/a966347cab652e2e064d7c826457d46cd9079923/.github/workflows/release.yml
make CMAKE_BUILD_TYPE=RelWithDebInfo
cd build
cpack -C RelWithDebInfo
