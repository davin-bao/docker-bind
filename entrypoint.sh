#!/bin/sh

if [ ! -f /etc/bind/rndc.key ] ; then
  /usr/sbin/rndc-confgen > /etc/bind/rndc.key
  sleep 1s
fi

if [ ! -f /etc/bind/rndc.conf ] ; then
  tail -10 /etc/bind/rndc.key | head -9 | sed s/#\ //g > /etc/bind/rndc.conf
fi

chown -R named:named /etc/bind
chmod -R 777 /etc/bind
chown -R named:named /var/log/bind
chmod -R 777 /var/log/bind
chmod -R 600 /etc/ssh/

/usr/sbin/sshd -p 22

./monitor.sh &

/usr/sbin/named -c /etc/bind/named.conf -u named -f