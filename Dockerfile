FROM postgres:11.2

MAINTAINER aruis (lovearuis@gmail.com)

ENV PLV8_VERSION=2.3.11

RUN apt-get -y update 
RUN apt-get -y install curl
RUN apt-get -y install postgresql-server-dev-11
RUN apt-get -y install vim
RUN apt-get -y install gcc make g++
RUN apt-get -y install pkg-config
RUN apt-get -y install libc++-dev 
    
RUN apt-get -y install git && mkdir -p /plv8build \
    && cd plv8build \
    && curl -o plv8.tar.gz -L https://github.com/plv8/plv8/archive/v${PLV8_VERSION}.tar.gz \
    && tar -xvzf plv8.tar.gz \
    && cd plv8-${PLV8_VERSION} && make USE_PGXS=1 && make USE_PGXS=1 install \
    && apt-get -y remove git \
    && apt-get -y remove curl \
    && rm -rf /plv8build  \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get -y autoremove && apt-get clean
