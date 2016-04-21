#!/bin/bash

service zookeeper-server start

tail -f `find /var/log -name *.log -or -name *.out`
