FROM postgres:13.6

MAINTAINER aruis (lovearuis@gmail.com)

RUN apt-get -y update \
    && apt-get -y install wget bzip2 gcc make unzip postgresql-server-dev-13 \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get -y autoremove && apt-get clean

RUN wget http://www.xunsearch.com/scws/down/scws-1.2.3.tar.bz2
RUN tar xvjf scws-1.2.3.tar.bz2
RUN cd scws-1.2.3 && ./configure --prefix=/usr/local/ && make && make install
RUN wget https://github.com/amutu/zhparser/archive/master.zip
RUN unzip master.zip
RUN cd zhparser-master && make && make install
