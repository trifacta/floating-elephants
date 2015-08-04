FROM trifacta/ubuntu-hdp2-base

# Refer to hdfs-site.xml
RUN mkdir -p /var/lib/hadoop-hdfs/cache/hdfs/dfs/name
RUN chown -R hdfs:hadoop /var/lib/hadoop-hdfs/cache/hdfs/dfs/name

# We need skeleton configs to format the namenode
COPY ["conf.skeleton", "/etc/hadoop/conf"]

USER hdfs
RUN /usr/bin/hdfs namenode -format
USER root

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
