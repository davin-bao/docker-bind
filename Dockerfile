FROM alpine:latest

RUN set -x \
    && apk add --update bind

ENV INTERVAL 1m

RUN set -x \
    && mkdir /etc/monitor \

VOLUME ["/etc/bind", "/etc/monitor"]
EXPOSE 53 53/udp

COPY monitor.sh /
COPY entrypoint.sh /

RUN set -x \
    && chown -R named:named /etc/bind \
    && chmod -R 777 /etc/bind \
    && chmod +x /monitor.sh \
    && chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]