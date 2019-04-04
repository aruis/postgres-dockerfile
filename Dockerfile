FROM postgres:11.2

MAINTAINER aruis (lovearuis@gmail.com)

ENV PLV8_VERSION=2.3.11

RUN apt-get -y update 
RUN apt-get -y install postgresql-server-dev-11
RUN apt-get -y install vim
RUN apt-get -y install wget
RUN apt-get -y install gcc make g++
RUN apt-get -y install pkg-config
RUN apt-get -y install libc++-dev 
RUN apt-get -y install git
RUN mkdir -p /plv8build
RUN cd plv8build && wget https://github.com/plv8/plv8/archive/v${PLV8_VERSION}.tar.gz
RUN cd plv8build && tar -xvzf v${PLV8_VERSION}.tar.gz
RUN cd plv8build && cd plv8-${PLV8_VERSION} && make USE_PGXS=1 && make USE_PGXS=1 install
RUN apt-get -y remove git
RUN rm -rf /plv8build 
RUN rm -rf /var/lib/apt/lists/*

RUN apt-get autoremove && apt-get clean
