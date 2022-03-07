FROM postgres:13.6

MAINTAINER aruis (lovearuis@gmail.com)

RUN apt-get -y update \
    && apt-get -y install gcc make \
    && apt-get -y install wget unzip \
    && apt-get -y install postgresql-server-dev-13
    && apt-get -y install default-libmysqlclient-dev
    && rm -rf /var/lib/apt/lists/* \
    && apt-get -y autoremove && apt-get clean
    
RUN  wget https://github.com/EnterpriseDB/mysql_fdw/archive/REL-2_7_0.zip && \
  unzip REL-2_7_0.zip && \
  cd mysql_fdw-REL-2_7_0 && make USE_PGXS=1 && make USE_PGXS=1 install && \
  cd .. && rm -R mysql_fdw-REL-2_7_0 && 
