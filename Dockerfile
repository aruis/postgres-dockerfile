FROM postgres:12.1

MAINTAINER aruis (lovearuis@gmail.com)


RUN apt-get -y update \
    && apt-get -y install vim curl wget unzip postgresql-server-dev-12 \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get -y autoremove && apt-get clean
