# A cluster node has a datanode, a nodemanager and mapreduce.

FROM trifacta/ubuntu-cdh5-base
MAINTAINER Trifacta, Inc.

RUN apt-get update && apt-get install -y \
    hadoop-hdfs-datanode \
    hadoop-mapreduce \
    hadoop-yarn-nodemanager

# Refer to hdfs-site.xml
RUN mkdir -p /var/lib/hadoop-hdfs/cache/hdfs/dfs/data
RUN chown -R hdfs:hdfs /var/lib/hadoop-hdfs/cache/hdfs/dfs/data

# Refer to yarn-site.xml
RUN mkdir -p /var/lib/hadoop-yarn/cache/nm-local-dir
RUN chown -R yarn:yarn /var/lib/hadoop-yarn/cache/nm-local-dir

RUN mkdir -p /var/log/hadoop-yarn/containers
RUN chown -R yarn:yarn /var/log/hadoop-yarn/containers

# dfs.datanode.address
EXPOSE 50010
# dfs.datanode.address (Secure)
EXPOSE 1004
# dfs.datanode.http.address
EXPOSE 50075
# dfs.datanode.https.address
EXPOSE 50475
# dfs.datanode.http.address (Secure)
EXPOSE 1006
# dfs.datanode.ipc.address
EXPOSE 50020

# mapreduce.shuffle.port (created by the YARN NodeManager?)
EXPOSE 13562

USER root
COPY start.sh /opt/hadoop-docker/
CMD ["/opt/hadoop-docker/start.sh"]
