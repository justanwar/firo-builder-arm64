FROM ubuntu:18.04

# install required packages
RUN apt-get update && apt-get install -y software-properties-common

RUN add-apt-repository ppa:bitcoin/bitcoin

RUN apt-get update && apt-get install -y \
    autoconf automake bsdmainutils ccache cmake curl g++  gcc git \
    libboost-all-dev libbz2-dev libcap-dev libdb4.8-dev libdb4.8++-dev libevent-dev libminiupnpc-dev libprotobuf-dev \
    libqrencode-dev libssl-dev libtool make pkg-config protobuf-compiler python-pip qtbase5-dev \
    qttools5-dev-tools python3-zmq zlib1g-dev build-essential minizip lcov default-jre libzmq3-dev libgmp-dev bison

# aarch64
RUN apt-get install -y gcc-aarch64-linux-gnu g++-aarch64-linux-gnu

RUN pip install ez_setup

# create user to use
RUN useradd -m -U firo-builder

# create a volume for home directory
VOLUME [ "/home/firo-builder" ]

# start shell with created user
USER firo-builder
WORKDIR /home/firo-builder