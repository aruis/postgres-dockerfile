FROM lovearuis/postgres-plv8:12.1

MAINTAINER aruis (lovearuis@gmail.com)

RUN apt-get -y update \
    && apt-get -y install postgresql-12-mysql-fdw \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get -y autoremove && apt-get clean
