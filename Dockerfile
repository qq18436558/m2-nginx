FROM ubuntu:20.04

ENV LANG C.UTF-8

RUN apt update && DEBIAN_FRONTEND=noninteractive apt-get install -y wget tzdata && apt -y install webp nginx libnginx-mod-http-lua && \
    wget https://github.com/just-containers/s6-overlay/releases/download/v2.1.0.2/s6-overlay-amd64.tar.gz -O /tmp/s6-overlay-amd64.tar.gz && \
    tar xzf /tmp/s6-overlay-amd64.tar.gz -C / && \
    mkdir /logs && apt-get autoremove -y && apt-get clean && apt-get autoclean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 80/tcp 443/tcp

COPY resources/etc/ /etc/

ENTRYPOINT ["/init"]
