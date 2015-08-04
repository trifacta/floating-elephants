# Floating Elephants

[Docker](https://www.docker.com/) containers for [Hadoop](https://hadoop.apache.org/).

<p align="center">
<img src="img/floating-elephants.png" width="200" height="314" alt="Elephant held by coloured balloons">
</p>

Easily reproduce a multi-node Hadoop cluster on a local machine.

## Requirements

- A [docker](http://docs.docker.com/) daemon, with at least 4 GB of RAM
- [docker-compose](http://docs.docker.com/compose/install/)

## Getting Started

Pick one of the available Hadoop distributions, eg.

```
cd cloudera/cdh5     # or,
cd hortonworks/hdp2
```

Build the images for the distribution:

```
cd base
./build.sh           # Builds an image with common components
cd ..
docker-compose build
```

Start the containers:

```
docker-compose up -d --no-recreate
```


## Networking

Hadoop services typically use [DNS](https://wiki.apache.org/hadoop/UnknownHost) to connect with one another. One of the containers is a DNS container that automatically adds a DNS entry for every running container.

The hostnames are pre-configured in the Hadoop XML configuration files in `conf.docker_cluster`, and in `docker-compose.yml`. All of these hostnames end with `.dockerdomain`.

To connect to the containers from the host machine using these hostnames, you'll need to add DNS and routing table entries to your host.

### OS X

Assuming you're using [`boot2docker`](http://boot2docker.io/):

```
export DOCKER_HOST_IP=$(boot2docker ip)

echo "nameserver $DOCKER_HOST_IP" | sudo tee /etc/resolver/dockerdomain
sudo route -n add -net 172.17.0.0 $DOCKER_HOST_IP
```

If you're using [`docker-machine`](https://docs.docker.com/machine/) instead, replace the first line with

```
export DOCKER_HOST_IP=$(docker-machine ip $DOCKER_MACHINE_NAME)
```

To remove these settings at a later point, run

```
sudo rm /etc/resolver/dockerdomain
sudo route -n delete 172.17.0.0
```

## Verify your cluster is running

Visit the Web UIs for the services:

Service | Web UI URL
--------|-----------
HDFS Namenode | http://hdfs-namenode.dockerdomain:50070/
YARN Resource Manager | http://yarn-resource-manager.dockerdomain:8088/
MapReduce History Server | http://mapreduce-history.dockerdomain:19888/

## Multiple worker nodes

You can scale the number of "clusternodes" - nodes that run an HDFS Datanode and a YARN Node Manager. For example, to run 5 such nodes:

```
docker-compose scale clusternode=5
```

## Supported Hadoop Distributions

Vendor | Distro | Directory
------- | ---------- | --------
Cloudera | CDH 5 | `cloudera/cdh5`
Hortonworks | HDP 2 | `hortonworks/hdp2`

## Roadmap

In no particular order,

* Kerberos
* High Availability
* Hive + HCatalog
* Spark

## People

* Seshadri Mahalingam, primary contributor
* Jeremy Mailen, architectural & ideological support
* Alexander Vaughn, the awesome project logo
* Vihang Mehta, various contributions
* Many more Trifactans who tried it out, contributing feedback & moral support

<p align="center">
<a href="http://www.trifacta.com">
<img src="img/trifacta-logo.png" width="320" height="100" alt="Developed by Trifacta"><br />
</a>
</p>
