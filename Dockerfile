FROM rust:1.50

LABEL UPDATED_AT=2021-03-16

RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install mingw-w64 gcc-arm-linux-gnueabi gcc-aarch64-linux-gnu -y && \
    rustup target add x86_64-unknown-linux-gnu && \
    rustup target add x86_64-pc-windows-gnu && \
    rustup target add arm-unknown-linux-gnueabi  && \
    rustup target add aarch64-unknown-linux-gnu && \
    mkdir /release

WORKDIR /app
COPY . /app

# Build for Linux AMD64
RUN cargo build --release --target x86_64-unknown-linux-gnu && \
    cp target/x86_64-unknown-linux-gnu/release/cross-hello /release/hello-amd64

# Build for Windows AMD64
RUN cargo build --release --target x86_64-pc-windows-gnu && \
    cp target/x86_64-pc-windows-gnu/release/cross-hello.exe /release/hello-amd64-windows.exe

# Build for Linux ARM (ie Raspberry Pi Zero)
RUN cargo build --release --target arm-unknown-linux-gnueabi && \
    cp target/arm-unknown-linux-gnueabi/release/cross-hello /release/hello-arm

# Build for Linux ARM 64 (ie Raspberry Pi 4)
RUN cargo build --release --target aarch64-unknown-linux-gnu && \
    cp target/aarch64-unknown-linux-gnu/release/cross-hello /release/hello-armv8
