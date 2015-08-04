# Adds Cloudera's repositories for Ubuntu Trusty

FROM trifacta/ubuntu-plus-java
MAINTAINER Trifacta, Inc.

# Add Cloudera repos. Refer to Cloudera docs for more info.
# http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cdh_ig_cdh5_install.html

RUN wget 'http://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh/cloudera.list' -O- \
    > /etc/apt/sources.list.d/cloudera.list

RUN wget http://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh/archive.key \
    -O- | apt-key add -

# "ensures that you get the right ZooKeeper package for the current CDH release"
COPY files/cloudera.pref /etc/apt/preferences.d/cloudera.pref

# Set up space for configuration files
RUN mkdir -p /etc/hadoop/conf.docker_cluster
RUN update-alternatives --install /etc/hadoop/conf hadoop-conf /etc/hadoop/conf.docker_cluster 50
RUN update-alternatives --set hadoop-conf /etc/hadoop/conf.docker_cluster

RUN apt-get update && apt-get install -y hadoop-client
