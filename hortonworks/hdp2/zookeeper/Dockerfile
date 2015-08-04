FROM trifacta/ubuntu-hdp2-base

RUN apt-get update && apt-get install zookeeper && \
    usermod -s /bin/bash zookeeper

COPY files/* /etc/zookeeper/conf/

RUN mkdir -p /var/log/zookeeper && \
    chown -R zookeeper:hadoop /var/log/zookeeper && \
    chmod -R 755 /var/log/zookeeper

RUN mkdir -p /var/run/zookeeper && \
    chown -R zookeeper:hadoop /var/run/zookeeper && \
    chmod -R 755 /var/run/zookeeper

RUN mkdir -p /var/lib/zookeeper && \
    chmod -R 755 /var/lib/zookeeper && \
    chown -R zookeeper:hadoop /var/lib/zookeeper

RUN chmod a+x /etc/zookeeper/conf/ && \
    chown -R zookeeper:hadoop /etc/zookeeper && \
    chmod -R 755 /etc/zookeeper

COPY start.sh /opt/zookeeper/start.sh

EXPOSE 2181

CMD ["/opt/zookeeper/start.sh"]
