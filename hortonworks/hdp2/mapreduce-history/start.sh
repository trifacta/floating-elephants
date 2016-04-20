#!/bin/bash

# Wait for DFS to come out of safe mode
until hdfs dfsadmin -safemode wait
do
    echo "Waiting for HDFS safemode to turn off"
    sleep 1
done

# Wait for resource manager to come alive on its standard port
until nc -z -w5 yarnresourcemanager 8032
do
    echo "Waiting for YARN ResourceManager to become available"
    sleep 1
done

# su - hdfs -c "hdfs dfs -mkdir -p /mr-history/tmp"
# su - hdfs -c "hdfs dfs -chmod -R 1777 /mr-history/tmp"
# su - hdfs -c "hdfs dfs -mkdir -p /mr-history/done"
# su - hdfs -c "hdfs dfs -chmod -R 1777 /mr-history/done"
# su - hdfs -c "hdfs dfs -chown -R mapred:hdfs /mr-history"

# su - hdfs -c "hdfs dfs -mkdir -p /app-logs"
# su - hdfs -c "hdfs dfs -chmod -R 1777 /app-logs"
# su - hdfs -c "hdfs dfs -chown yarn /app-logs"

su -l yarn -c "/usr/hdp/current/hadoop-mapreduce-historyserver/sbin/mr-jobhistory-daemon.sh --config /etc/hadoop/conf start historyserver"

tail -f `find /var/log -name *.log -or -name *.out`
