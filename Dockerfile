FROM postgres:11.2

MAINTAINER aruis (lovearuis@gmail.com)

RUN apt-get -y update 
RUN apt-get -y install gcc make
RUN apt-get -y install wget unzip
RUN apt-get -y install postgresql-server-dev-11
RUN apt-get -y install default-libmysqlclient-dev
    
RUN  wget https://github.com/EnterpriseDB/mysql_fdw/archive/REL-2_5_1.zip && \
  unzip REL-2_5_1.zip && \
  cd mysql_fdw-REL-2_5_1 && make USE_PGXS=1 && make USE_PGXS=1 install && \
  cd .. && rm -R mysql_fdw-REL-2_5_1 && \
  rm -rf /var/lib/apt/lists/*

RUN apt-get -y autoremove && apt-get clean
