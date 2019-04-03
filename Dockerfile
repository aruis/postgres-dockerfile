FROM postgres:11.2

MAINTAINER aruis (lovearuis@gmail.com)

RUN apt-get -y update 
RUN apt-get -y install postgresql-server-dev-11
RUN apt-get -y install vim
RUN apt-get -y install wget
RUN apt-get -y install gcc make
RUN apt-get -y install pkg-config
RUN apt-get -y install libc++-dev 
RUN apt-get -y install git
RUN wget https://github.com/plv8/plv8/archive/v2.3.11.tar.gz
RUN tar -xvzf v2.3.11.tar.gz && cd plv8-2.3.11
RUN cd plv8-2.3.11 && pwd && make USE_PGXS=1 && make USE_PGXS=1 install
RUN cd .. && rm -R plv8-2.3.11
RUN rm -rf /var/lib/apt/lists/*
