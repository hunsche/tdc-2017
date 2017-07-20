FROM ubuntu:16.04
MAINTAINER matheus.arendt.hunsche@gmail.com
RUN apt-get update \
    && apt-get install libcurl4-gnutls-dev -y \
    apache2 -y
USER root
COPY init /init
COPY entrypoint.sh /usr/local/bin/
RUN ln -s usr/local/bin/entrypoint.sh /
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]