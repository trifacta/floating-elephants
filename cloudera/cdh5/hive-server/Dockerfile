# A cluster node has a datanode, a nodemanager and mapreduce.

FROM trifacta/ubuntu-cdh5-base
MAINTAINER Trifacta, Inc.

RUN apt-get update && apt-get install -y \
    hive-server2 \
    hive-webhcat-server

# hive.server2.thrift.port
EXPOSE 10000
# templeton.port
EXPOSE 50111

USER root
COPY start.sh /opt/hadoop-docker/
CMD ["/opt/hadoop-docker/start.sh"]
