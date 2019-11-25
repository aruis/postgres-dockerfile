FROM lovearuis/postgres-mysql_fdw_plv8:12.1

MAINTAINER aruis (lovearuis@gmail.com)

RUN apt-get -y update
RUN apt-get -y install postgresql-server-dev-12
RUN apt-get -y install postgresql-12-postgis-2.5
RUN git clone https://github.com/citusdata/pg_cron.git \
    && cd pg_cron \
    && make && make install

RUN apt-get -y autoremove && apt-get clean
