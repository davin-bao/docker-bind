FROM alpine:latest

RUN set -x \
    && apk add --update bind


VOLUME ["/etc/bind"]
EXPOSE 53 53/udp

COPY entrypoint.sh /
RUN set -x \
    && chown -R named:named /etc/bind \
    && chmod -R 777 /etc/bind \
    && chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]