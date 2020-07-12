FROM ubuntu:19.10

WORKDIR /xyz
COPY . /xyz/

# Environment setup
RUN apt update
RUN apt install -y git clang cmake make gcc g++ libmariadbclient-dev libssl-dev libbz2-dev libreadline-dev libncurses-dev libboost-all-dev mariadb-server p7zip libmariadb-client-lgpl-dev-compat
RUN update-alternatives --install /usr/bin/cc cc /usr/bin/clang 100
RUN update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang 100

# Build
WORKDIR /xyz/build
RUN cmake ../
RUN make -j 4
RUN make install
