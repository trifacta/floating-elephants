#!/bin/bash

# Wait for DFS to come out of safe mode
until hdfs dfsadmin -safemode wait
do
    echo "Waiting for HDFS safemode to turn off"
    sleep 1
done

# Create yarn.app.mapreduce.am.staging-dir. Refer to mapred-site.xml.
su - hdfs -c "hdfs dfs -mkdir -p /user/history"
su - hdfs -c "hdfs dfs -chmod -R 1777 /user/history"
su - hdfs -c "hdfs dfs -chown mapred:hadoop /user/history"

# Create the parent directory of yarn.nodemanager.remote-app-log-dir.
# Refer to yarn-site.xml.
su - hdfs -c "hadoop fs -mkdir -p /var/log/hadoop-yarn"
su - hdfs -c "hadoop fs -chown yarn:mapred /var/log/hadoop-yarn"

su -l yarn -c "YARN_CONF_DIR=/etc/hadoop/conf /usr/hdp/current/hadoop-yarn-resourcemanager/sbin/yarn-daemon.sh --config /etc/hadoop/conf start resourcemanager"

tail -f `find /var/log -name *.log -or -name *.out`
