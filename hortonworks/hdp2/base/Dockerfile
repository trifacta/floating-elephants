# Adds Hortonworks' repositories for Ubuntu, and installs common packages

FROM trifacta/ubuntu-plus-java
MAINTAINER Trifacta, Inc.

# http://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.2.6/bk_installing_manually_book/content/config-remote-repositories.html
RUN wget http://public-repo-1.hortonworks.com/HDP/ubuntu12/2.x/updates/2.2.6.0/hdp.list \
    -O /etc/apt/sources.list.d/hdp.list

# Public key "Jenkins (HDP Builds) <jenkin@hortonworks.com>"
RUN gpg --keyserver pgp.mit.edu --recv-keys B9733A7A07513CAD && \
    gpg -a --export 07513CAD | apt-key add -

RUN apt-get update && apt-get install -y \
    hadoop hadoop-hdfs libhdfs0 \
    hadoop-yarn hadoop-mapreduce hadoop-client openssl \
    libsnappy1 libsnappy-dev \
    liblzo2-2 liblzo2-dev hadoop-lzo

# Make the Snappy libraries available to Hadoop
RUN ln -sf /usr/lib64/libsnappy.so /usr/lib/hadoop/lib/native/

RUN chown -R hdfs:hadoop /var/log/hadoop/hdfs && \
    chmod -R 755 /var/log/hadoop/hdfs && \
    chown -R hdfs:hadoop /var/run/hadoop/hdfs && \
    chmod -R 755 /var/run/hadoop/hdfs

RUN chown -R yarn:hadoop /var/log/hadoop/yarn && \
    chmod -R 755 /var/log/hadoop/yarn && \
    chown -R yarn:hadoop /var/run/hadoop/yarn && \
    chmod -R 755 /var/run/hadoop/yarn

RUN chown -R mapred:hadoop /var/log/hadoop/mapreduce && \
    chmod -R 755 /var/log/hadoop/mapreduce && \
    chown -R mapred:hadoop /var/run/hadoop/mapreduce && \
    chmod -R 755 /var/run/hadoop/mapreduce

RUN mkdir -p /etc/hadoop/conf.docker_cluster
RUN update-alternatives --install /etc/hadoop/conf hadoop-conf /etc/hadoop/conf.docker_cluster 50
RUN update-alternatives --set hadoop-conf /etc/hadoop/conf.docker_cluster

RUN /usr/bin/hdp-select set all 2.2.6.0-2800
