#!/bin/sh

while true
do
    sleep $INTERVAL;
	if [ -f /etc/bind/signal.lock ] ; then
	    rm -f /etc/bind/signal.lock;
		rndc reload;
	fi
done