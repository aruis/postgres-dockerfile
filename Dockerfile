FROM lovearuis/postgres-jieba:13.6

MAINTAINER aruis (lovearuis@gmail.com)

RUN apt-get -y update \
    && apt-get -y install postgresql-13-postgis-3 \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get -y autoremove && apt-get clean
