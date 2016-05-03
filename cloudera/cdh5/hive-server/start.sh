#!/bin/bash

# Wait for DFS to come out of safe mode
until hdfs dfsadmin -safemode wait
do
    echo "Waiting for HDFS safemode to turn off"
    sleep 1
done

service hive-webhcat-server start
service hive-server2 start

tail -f `find /var/log -name *.log -or -name *.out`
