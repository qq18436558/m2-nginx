FROM    alpine:3.13.2

ENV     LANG C.UTF-8

RUN     apk update && apk add --no-cache nginx shadow && \
        usermod -u 32 xfs && groupmod -g 32 xfs && usermod -u 33 nginx && groupmod -g 33 nginx && \
        rm -rf /tmp/* /var/cache/*  /root/.cache /root/.ash_history

EXPOSE 80/tcp