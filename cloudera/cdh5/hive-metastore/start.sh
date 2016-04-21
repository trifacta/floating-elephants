#!/bin/bash

# Wait for DFS to come out of safe mode
until hdfs dfsadmin -safemode wait
do
    echo "Waiting for HDFS safemode to turn off"
    sleep 1
done

# Check to see if MySQL has been initialized
/usr/lib/hive/bin/schematool -dbType mysql -info || {
  # If we haven't yet initialized MySQL, initialize it
  /usr/lib/hive/bin/schematool -dbType mysql -initSchema
}

# Upgrade the schema to the latest version
/usr/lib/hive/bin/schematool -dbType mysql -upgradeSchema

service hive-metastore start

tail -f `find /var/log -name *.log -or -name *.out`
