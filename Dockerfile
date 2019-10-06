FROM lovaruis/postgres:11.5

MAINTAINER aruis (lovearuis@gmail.com)


RUN apt-get -y update \
    && apt-get -y install pgpool2 \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get -y autoremove && apt-get clean
