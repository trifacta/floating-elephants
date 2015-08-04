# Adds an HDFS namenode

FROM trifacta/ubuntu-cdh5-base
MAINTAINER Trifacta, Inc.

RUN apt-get update && apt-get install -y hadoop-hdfs-namenode

# Refer to hdfs-site.xml
RUN mkdir -p /var/lib/hadoop-hdfs/cache/hdfs/dfs/name
RUN chown -R hdfs:hdfs /var/lib/hadoop-hdfs/cache/hdfs/dfs/name

# We need skeleton configs to format the namenode
COPY ["conf.skeleton", "/etc/hadoop/conf.docker_cluster"]

# Before starting the NameNode for the first time you need to format the file system.
RUN service hadoop-hdfs-namenode init

# fs.defaultFS
EXPOSE 8020
# dfs.namenode.servicerpc-address
EXPOSE 8022
# dfs.namenode.http-address (HTTP)
EXPOSE 50070
# dfs.namenode.https-address (HTTPS)
EXPOSE 50470

COPY start.sh /opt/hadoop-docker/
CMD ["/opt/hadoop-docker/start.sh"]
