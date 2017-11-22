#!/bin/sh

if [ ! -f /etc/bind/rndc.conf ] ; then
  /usr/sbin/rndc-confgen > /etc/bind/rndc.conf
  sleep 1s
fi

if [ ! -f /etc/bind/rndc.key ] ; then
  tail -10 /etc/bind/rndc.conf | head -9 | sed s/#\ //g > /etc/bind/rndc.key
fi

/usr/sbin/named -c /etc/bind/named.conf -g -u named
