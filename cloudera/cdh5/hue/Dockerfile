# A cluster node has a datanode, a nodemanager and mapreduce.

FROM trifacta/ubuntu-cdh5-base
MAINTAINER Trifacta, Inc.

RUN apt-get update && apt-get install -y \
    hue \
    hue-beeswax \
    hue-common \
    hue-doc \
    hue-hbase \
    hue-impala \
    hue-pig \
    hue-plugins \
    hue-rdbms \
    hue-search \
    hue-security \
    hue-server \
    hue-spark \
    hue-sqoop \
    hue-zookeeper

# Hue Server
EXPOSE 8888

USER root
COPY start.sh /opt/hadoop-docker/
CMD ["/opt/hadoop-docker/start.sh"]
