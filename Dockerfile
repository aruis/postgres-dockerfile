FROM postgres:12.1

MAINTAINER aruis (lovearuis@gmail.com)

ENV PLV8_VERSION=2.3.13

RUN apt-get -y update 
RUN apt-get -y install vim
RUN apt-get -y install curl git
RUN apt-get -y install postgresql-server-dev-12
RUN apt-get -y install gcc make g++
RUN apt-get -y install pkg-config
RUN apt-get -y install libc++-dev
RUN apt-get -y install libc++abi-dev
RUN apt install libtinfo5

RUN mkdir -p /plv8build \
    && cd plv8build \
    && curl -o plv8.tar.gz -L https://github.com/plv8/plv8/archive/v${PLV8_VERSION}.tar.gz

RUN cd plv8build\
    && tar -xvzf plv8.tar.gz \
    && cd plv8-${PLV8_VERSION} && make USE_PGXS=1 && make USE_PGXS=1 install \
    && rm -rf /plv8build  \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get -y autoremove && apt-get clean
