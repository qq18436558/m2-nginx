FROM ubuntu:20.04

ENV LANG C.UTF-8

RUN apt update && DEBIAN_FRONTEND=noninteractive apt-get install -y wget tzdata && apt -y install nginx && \
    mkdir /logs && apt-get autoremove -y && apt-get clean && apt-get autoclean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 80/tcp