FROM ubuntu:19.10

# Environment setup
RUN apt update
RUN apt install -y git clang cmake make gcc g++ libmariadbclient-dev libssl-dev libbz2-dev libreadline-dev libncurses-dev libboost-all-dev mariadb-server p7zip libmariadb-client-lgpl-dev-compat
RUN update-alternatives --install /usr/bin/cc cc /usr/bin/clang 100
RUN update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang 100

# Build
WORKDIR /xyz/build
COPY . /xyz/
RUN cmake ../ -DCMAKE_INSTALL_PREFIX=/xyz-build/ -DTOOLS=0
RUN make -j 7
RUN make install
