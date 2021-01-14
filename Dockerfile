FROM ubuntu:18.04

ENV LANG C.UTF-8

ENV DEBIAN_FRONTEN noninteractive

RUN apt update && apt-get -y install tzdata && apt -y install supervisor nginx && mkdir /logs && apt-get autoremove -y && apt-get clean && apt-get autoclean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 80/tcp 443/tcp

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY start-container /usr/local/bin/start-container
RUN chmod +x /usr/local/bin/start-container

ENTRYPOINT ["start-container"]