#!/bin/bash

set -o nounset
set -o errexit
set -o pipefail

docker run --rm --privileged multiarch/qemu-user-static --reset -p yes

# Ensure emulation works correctly
docker run --rm -t arm64v8/ubuntu uname -m

# Remove existing bits
rm -rf nightly.zip src

# Create need dirs, delete cache manually daily or to free up disk space
mkdir -p src cache

wget https://github.com/neovim/neovim/archive/refs/tags/nightly.zip
unzip nightly.zip -d src

# Run aarch64 debian container with local folders mounted in
docker run --rm -v "$(pwd)/cache/deps:/build/src/neovim-nightly/.deps" -v "$(pwd):/build" -it --platform linux/arm64 debian:bullseye /build/build.sh

#copy nvim-linux64.deb
