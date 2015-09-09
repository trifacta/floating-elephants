# A cluster node has a datanode, a nodemanager and mapreduce.

FROM trifacta/ubuntu-cdh5-base
MAINTAINER Trifacta, Inc.

RUN apt-get update && apt-get install -y \
    hive-metastore \
    libmysql-java

# MySQL driver needs to be in a place where Hive can find it.
# http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cdh_ig_hive_metastore_configure.html
RUN ln -s /usr/share/java/mysql-connector-java.jar /usr/lib/hive/lib/mysql-connector-java.jar

# Hive Metastore port
EXPOSE 9083

USER root
COPY start.sh /opt/hadoop-docker/
CMD ["/opt/hadoop-docker/start.sh"]
