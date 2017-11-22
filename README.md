# docker-bind
bind for docker


docker run -it -v /tmp/etc:/etc/bind -p 53:53/udp -p 53:53 --name bind davinbao/bind /bin/sh