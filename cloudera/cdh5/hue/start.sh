#!/bin/bash

# Wait for DFS to come out of safe mode
until hdfs dfsadmin -safemode wait
do
    echo "Waiting for HDFS safemode to turn off"
    sleep 1
done

sudo -u hdfs hdfs dfs -mkdir /user/hue
sudo -u hdfs hdfs dfs -chmod -R 1777 /user/hue
sudo -u hdfs hdfs dfs -chown hue:hadoop /user/hue

service hue start

tail -f `find /var/log -name *.log -or -name *.out`
