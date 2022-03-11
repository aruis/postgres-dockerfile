FROM postgres:13.6

MAINTAINER aruis (lovearuis@gmail.com)

RUN apt-get -y update \
    && apt-get -y install gcc make g++ cmake git postgresql-server-dev-13 postgresql-13-postgis-3 \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get -y autoremove && apt-get clean

RUN git clone https://github.com/jaiminpan/pg_jieba
RUN cd pg_jieba && git submodule update --init --recursive
RUN cd pg_jieba && mkdir build && cd build && cmake -DPostgreSQL_TYPE_INCLUDE_DIR=/usr/include/postgresql/13/server .. && make && make install
