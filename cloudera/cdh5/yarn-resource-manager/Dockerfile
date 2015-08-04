# Adds a resource manager

FROM trifacta/ubuntu-cdh5-base
MAINTAINER Trifacta, Inc.

RUN apt-get update && apt-get install -y hadoop-yarn-resourcemanager

# Refer to yarn-site.xml
# RUN mkdir -p /var/lib/hadoop-hdfs/cache/hdfs/dfs/name
# RUN chown -R hdfs:hdfs /var/lib/hadoop-hdfs/cache/hdfs/dfs/name

# yarn.resourcemanager.address
EXPOSE 8032
# yarn.resourcemanager.scheduler.address
EXPOSE 8030
# yarn.resourcemanager.resource-tracker.address
EXPOSE 8031
# yarn.resourcemanager.admin.address
EXPOSE 8033
# yarn.resourcemanager.webapp.address
EXPOSE 8088
# yarn.resourcemanager.webapp.https.address
EXPOSE 8090

USER root
COPY start.sh /opt/hadoop-docker/
CMD ["/opt/hadoop-docker/start.sh"]
