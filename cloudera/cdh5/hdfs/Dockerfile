# Adds hdfs client libraries

FROM trifacta/ubuntu-cdh5-base
MAINTAINER Trifacta, Inc.

RUN apt-get update && apt-get install -y hadoop-client

USER hdfs
ENTRYPOINT ["hdfs"]
