FROM postgres:11.5

MAINTAINER aruis (lovearuis@gmail.com)


RUN apt-get -y update \
    && apt-get -y install vim curl wget unzip postgresql-server-dev-11 \
    && apt-get -y install pgpool2 \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get -y autoremove && apt-get clean
