#!/bin/bash

# http://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.2.6/bk_installing_manually_book/content/ch_install_zookeeper_chapter.html
su - zookeeper -c "/usr/hdp/current/zookeeper-server/bin/zkServer.sh start"

tail -f /var/lib/zookeeper/zookeeper.out `find /var/log -name *.log -or -name *.out`
