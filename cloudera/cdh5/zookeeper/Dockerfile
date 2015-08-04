# Adds a ZooKeeper server

FROM trifacta/ubuntu-cdh5-base
MAINTAINER Trifacta, Inc.

RUN apt-get update && apt-get install -y zookeeper-server

# ZooKeeper (default) data directory
RUN mkdir -p /var/lib/zookeeper
RUN chown -R zookeeper /var/lib/zookeeper/

EXPOSE 2181

# ZooKeeper needs to be initialized
RUN service zookeeper-server init

COPY start.sh /opt/zookeeper/
CMD ["/opt/zookeeper/start.sh"]
