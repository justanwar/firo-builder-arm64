Compiles arm64 Firo binaries for 64-bit Rapsberry Pis. Based on [the Firo builder Dockerfile.](https://github.com/firoorg/firo/blob/master/contrib/docker/builder/Dockerfile) Not uploaded to Docker Hub due to the size (1GB+).

Build the dockerfile:
```
docker build -t firo-builder-arm64 .
```
## Start build environment
```
docker run --rm -it firo-builder-arm64
```
## Get Firo source
```
git clone https://github.com/firoorg/firo.git && cd firo
```
## Build portable binary for Linux arm64
Build all dependencies:
```
make -C depends HOST=aarch64-linux-gnu -j$(nproc)
```
Then build Firo
```
./autogen.sh && ./configure --prefix=$PWD/depends/aarch64-linux-gnu && make -j$(nproc)
```
## Copy binary out of Docker
Open a new terminal. Then get the container ID to copy from:
```
docker ps
```
Grab the binary from container:

```
docker cp <ID>:/home/firo-builder/firo/src/firod .
docker cp <ID>:/home/firo-builder/firo/src/firo-cli .
docker cp <ID>:/home/firo-builder/firo/src/qt/firo-qt .
```
