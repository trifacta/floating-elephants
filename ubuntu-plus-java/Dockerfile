# Installs Oracle's Java 8 & wget on a vanilla Ubuntu 14.04 container

FROM ubuntu:trusty
MAINTAINER Trifacta, Inc.

RUN apt-get update -y && \
    apt-get install -y software-properties-common wget

# Install Oracle Java 8, as per instructions from:
# http://www.webupd8.org/2012/01/install-oracle-java-jdk-7-in-ubuntu-via.html
RUN add-apt-repository -y ppa:webupd8team/java

# Accept the Oracle licence before installing the package
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true \
    | /usr/bin/debconf-set-selections

RUN apt-get -y update && \
    apt-get install -y oracle-java8-installer oracle-java8-set-default

RUN update-java-alternatives -s java-8-oracle

ENV JAVA_HOME=/usr/lib/jvm/java-8-oracle
