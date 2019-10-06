FROM lovearuis/postgres-plv8:12

MAINTAINER aruis (lovearuis@gmail.com)

ENV MYSQL_FDW_VERSION=2_5_3

RUN apt-get -y update 
RUN apt-get -y install gcc make
RUN apt-get -y install wget unzip
RUN apt-get -y install postgresql-server-dev-12
RUN apt-get -y install default-libmysqlclient-dev
    
RUN  wget https://github.com/EnterpriseDB/mysql_fdw/archive/REL-${MYSQL_FDW_VERSION}.zip && \
  unzip REL-${MYSQL_FDW_VERSION}.zip && \
  cd mysql_fdw-REL-${MYSQL_FDW_VERSION} && make USE_PGXS=1 && make USE_PGXS=1 install && \
  cd .. && rm -R mysql_fdw-REL-${MYSQL_FDW_VERSION} && \
  rm -rf /var/lib/apt/lists/*

RUN apt-get -y autoremove && apt-get clean
