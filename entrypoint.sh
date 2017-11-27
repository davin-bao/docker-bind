#!/bin/sh

if [ ! -f /etc/bind/rndc.key ] ; then
  /usr/sbin/rndc-confgen > /etc/bind/rndc.key
  sleep 1s
fi

if [ ! -f /etc/bind/rndc.conf ] ; then
  tail -10 /etc/bind/rndc.key | head -9 | sed s/#\ //g > /etc/bind/rndc.conf
fi

 ./monitor.sh &

/usr/sbin/named -c /etc/bind/named.conf -u named -f