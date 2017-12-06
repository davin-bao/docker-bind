# docker-bind
bind for docker

### bind reload configration signal

```
touch /etc/bind/signal.lock
```

### use docker command
docker run -it --name bind -v /xmisp/docker/bind/conf:/etc/bind:rw -v /root/.ssh:/root/.ssh -p 2222:22 -v /etc/ssh:/etc/ssh -p 53:53/udp -e INTERVAL=10s davinbao/bind

### use docker compose

version: '3.3'
services:
  bind:
    image: davinbao/bind:latest
    deploy:
      replicas: 1
      endpoint_mode: vip
      resources:
        limits:
          memory: 512M
    volumes:
    - /xmisp/docker/bind/conf:/etc/bind:rw
    - /root/.ssh:/root/.ssh:ro
    - /etc/ssh:/etc/ssh:ro
    ports:
    - 53:53/udp
    - 2222:22
    environment:
      INTERVAL: 10s
    networks:
      - backend