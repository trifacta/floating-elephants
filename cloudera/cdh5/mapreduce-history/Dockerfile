# Runs a MapReduce History Server and a YARN proxy server

FROM trifacta/ubuntu-cdh5-base
MAINTAINER Trifacta, Inc.

# Cloudera says install both of these one "one host". We're not going to use
# the yarn proxy server just yet.
RUN apt-get update && apt-get install -y \
    hadoop-mapreduce-historyserver \
    hadoop-yarn-proxyserver

# mapreduce.jobhistory.address
EXPOSE 10020
# mapreduce.jobhistory.admin.address
EXPOSE 10033
# mapreduce.jobhistory.webapp.address
EXPOSE 19888
# mapreduce.jobhistory.webapp.https.address
EXPOSE 19890

USER root
COPY start.sh /opt/hadoop-docker/
CMD ["/opt/hadoop-docker/start.sh"]
