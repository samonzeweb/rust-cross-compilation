# Rust cross compilation example

## Purpose

This projet is an example (and reminder) of doing cross compilation with Rust.

The build if done with Docker as it's the best way to experiment in a clean (isolated) way. The targets are Windows (AMD64) and Linux (multiple architectures, GNU ABI).

The build is tested on AMD64 and ARMv8 architectures. Both build all targets.

Not all possible targets are presents, only ones I can validate are presents.

The Rust code is the default one created by `cargo new`, it prints `Hello, world!`.

## Build

Just run `make`. After the build process the executable files are present in the `release` folder.

## Key points

To cross compile, you need :

* the Rust target (ie `aarch64-linux-gnu-gcc`).
* the linker installed with the OS package manager (ie `aarch64-unknown-linux-gnu`).
* to tell cargo wich linker to use, see `.cargo/config.toml`.

## Licence

Released under the MIT License, see [LICENSE](LICENSE) file for more informations.