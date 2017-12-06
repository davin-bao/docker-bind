FROM alpine:latest

MAINTAINER Davin Bao <davin.bao@gmail.com>

RUN set -x \
    && apk add --update bash openssh rsync bind

ENV INTERVAL 1m

RUN set -x \
    && mkdir /var/log/bind

VOLUME ["/etc/bind", "/var/log/bind", "/root/.ssh"]
EXPOSE 22 53 53/udp

COPY monitor.sh /
COPY entrypoint.sh /

RUN set -x \
    && chmod +x /monitor.sh \
    && chmod +x /entrypoint.sh

CMD "/entrypoint.sh"