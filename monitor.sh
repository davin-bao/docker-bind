#!/usr/bin/env bash

while true
do
    sleep $INTERVAL;
	if [ -f /etc/monitor/update.lock ] ; then
	    rm -f /etc/monitor/update.lock;
		rndc reload;
	fi
done