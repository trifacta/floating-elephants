FROM trifacta/ubuntu-hdp2-base

# Refer to hdfs-site.xml
RUN mkdir -p /var/lib/hadoop-hdfs/cache/hdfs/dfs/data && \
    chown -R hdfs:hadoop /var/lib/hadoop-hdfs/cache/hdfs/dfs/data && \
    chmod -R 755 /var/lib/hadoop-hdfs/cache/hdfs/dfs/data

RUN mkdir -p /var/lib/hadoop-yarn/cache/nm-local-dir && \
    chown -R yarn:hadoop /var/lib/hadoop-yarn/cache/nm-local-dir && \
    chmod -R 755 /var/lib/hadoop-yarn/cache/nm-local-dir

COPY start.sh /opt/hadoop-docker/

EXPOSE 50075 50475 50010 8010 50090

CMD ["/opt/hadoop-docker/start.sh"]
