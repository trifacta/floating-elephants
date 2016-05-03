#!/bin/bash

service hadoop-hdfs-namenode start

# Wait for DFS to come out of safe mode
until hdfs dfsadmin -safemode wait
do
    echo "Waiting for HDFS safemode to turn off"
    sleep 1
done

# Create the hadoop.tmp.dir. Refer to core-site.xml
sudo -u hdfs hdfs dfs -mkdir /tmp
sudo -u hdfs hadoop fs -chmod -R 1777 /tmp

tail -f `find /var/log -name *.log -or -name *.out`
