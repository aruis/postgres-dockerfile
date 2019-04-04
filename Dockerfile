FROM postgres:11.2

MAINTAINER aruis (lovearuis@gmail.com)

ENV PLV8_VERSION=2.3.11

RUN apt-get -y update \
    && apt-get -y install 
    postgresql-server-dev-11 \
    vim \
    wget \
    gcc make g++ \
    pkg-config \
    libc++-dev  \
    git 
    
RUN mkdir -p /plv8build \
    cd plv8build \
    && wget https://github.com/plv8/plv8/archive/v${PLV8_VERSION}.tar.gz \
    && tar -xvzf v${PLV8_VERSION}.tar.gz \
    && cd plv8-${PLV8_VERSION} && make USE_PGXS=1 && make USE_PGXS=1 install \
    && apt-get -y remove git \
    && rm -rf /plv8build  \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get -y autoremove && apt-get clean
