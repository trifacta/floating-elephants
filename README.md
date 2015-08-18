# Floating Elephants

[Docker](https://www.docker.com/) containers for [Hadoop](https://hadoop.apache.org/).

<p align="center">
<img src="img/floating-elephants.png" width="300" height="363" alt="Elephant held by coloured balloons">
</p>

An easy way to reproduce a multi-node Hadoop cluster on a local machine.

## Requirements

- A [docker](http://docs.docker.com/) daemon, with at least 4 GB of RAM
- [docker-compose](http://docs.docker.com/compose/install/)

## Getting Started

Pick one of the available Hadoop distributions:

```
cd cloudera/cdh5     # or,
cd hortonworks/hdp2
```

Build the images for the distribution:

```
docker-compose build
```

Start the containers:

```
docker-compose up -d --no-recreate
```


## Networking

Hadoop services typically use [DNS](https://wiki.apache.org/hadoop/UnknownHost) to connect to each other. One of the containers is a DNS container that automatically adds a DNS entry for every running container.

The hostnames are pre-configured in the Hadoop XML configuration files in `conf.docker_cluster` and `docker-compose.yml`. All of these hostnames end with `.dockerdomain`.

To connect to the containers from the host machine using these hostnames, you must add DNS and routing table entries to your host.

### OS X

If you're using [`boot2docker`](http://boot2docker.io/):

```
export DOCKER_HOST_IP=$(boot2docker ip)

echo "nameserver $DOCKER_HOST_IP" | sudo tee /etc/resolver/dockerdomain
sudo route -n add -net 172.17.0.0 $DOCKER_HOST_IP
```

If you're using [`docker-machine`](https://docs.docker.com/machine/), replace the first line with the following:

```
export DOCKER_HOST_IP=$(docker-machine ip $DOCKER_MACHINE_NAME)
```

To remove these settings at a later point, run the following:

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

You can scale the number of "clusternodes", which are nodes that run an HDFS Datanode and a YARN Node Manager. For example, to run 5 clusternodes:

```
docker-compose scale clusternode=5
```

## Supported Hadoop Distributions

Vendor | Distro | Directory
------- | ---------- | --------
Cloudera | CDH 5 | `cloudera/cdh5`
Hortonworks | HDP 2 | `hortonworks/hdp2`

## Roadmap

In no particular order:

* Kerberos
* High Availability
* Hive + HCatalog
* Spark

## Contributing

We welcome pull requests! Borrowing from the [docker project](https://github.com/docker/docker/blob/master/CONTRIBUTING.md#sign-your-work)'s guide:

Your signature certifies that you wrote the patch or otherwise have the right to pass it on as an open-source patch. If you can certify the below (from [http://developercertificate.org](http://developercertificate.org)):

```
Developer Certificate of Origin
Version 1.1

Copyright (C) 2004, 2006 The Linux Foundation and its contributors.
660 York Street, Suite 102,
San Francisco, CA 94110 USA

Everyone is permitted to copy and distribute verbatim copies of this
license document, but changing it is not allowed.

Developer's Certificate of Origin 1.1

By making a contribution to this project, I certify that:

(a) The contribution was created in whole or in part by me and I
    have the right to submit it under the open source license
    indicated in the file; or

(b) The contribution is based upon previous work that, to the best
    of my knowledge, is covered under an appropriate open source
    license and I have the right under that license to submit that
    work with modifications, whether created in whole or in part
    by me, under the same open source license (unless I am
    permitted to submit under a different license), as indicated
    in the file; or

(c) The contribution was provided directly to me by some other
    person who certified (a), (b) or (c) and I have not modified
    it.

(d) I understand and agree that this project and the contribution
    are public and that a record of the contribution (including all
    personal information I submit with it, including my sign-off) is
    maintained indefinitely and may be redistributed consistent with
    this project or the open source license(s) involved.
```
Then you just add a line to every git commit message:

```
Signed-off-by: Joe Smith <joe.smith@email.com>
```

If you set your `user.name` and `user.email` git configs, you can sign your commit automatically with `git commit -s`.


## People

* Seshadri Mahalingam, primary contributor
* Jeremy Mailen, architectural & ideological support
* Alexander Vaughn, the awesome project logo
* Vihang Mehta, various contributions
* Many more Trifactans who tried it out and contributed feedback & moral support

<p align="center">
<a href="http://www.trifacta.com">
<img src="img/trifacta-logo.png" width="320" height="100" alt="Developed by Trifacta"><br />
</a>
</p>
