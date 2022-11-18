# Build neovim nightly for Debian Arm 64 bit (aarch64)

Downloads archive of neovim nightly and builds it using a Debian arm64 docker container

This works on x86_64 by using qemu emulation

## Running

`./run.sh` launches a docker container and starts the `build.sh` script inside it

When the build is done you should see a message like:

```
CPack: - package: /build/src/neovim-nightly/build/nvim-linux64.deb generated.
```

This corresponds to `src/neovim-nightly/build/nvim-linux64.deb` outside the container. Copy this file to your raspberry pi (or other aarch64 device) and install it using `dpkg -i nvim-linux64.deb`
