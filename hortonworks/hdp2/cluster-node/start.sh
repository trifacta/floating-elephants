#!/bin/bash

su - hdfs -c "/usr/hdp/current/hadoop-hdfs-datanode/../hadoop/sbin/hadoop-daemon.sh --config /etc/hadoop/conf start datanode"

su - yarn -c "/usr/hdp/current/hadoop-yarn-nodemanager/sbin/yarn-daemon.sh --config /etc/hadoop/conf start nodemanager"

tail -f `find /var/log -name *.log -or -name *.out`
