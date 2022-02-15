FROM postgres:14.2

MAINTAINER aruis (lovearuis@gmail.com)


RUN apt-get -y update \
    && apt-get -y install postgresql-14-wal2json \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get -y autoremove && apt-get clean
