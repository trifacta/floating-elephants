FROM trifacta/ubuntu-hdp2-base

# yarn.resourcemanager.address
EXPOSE 8032
# yarn.resourcemanager.scheduler.address
EXPOSE 8030
# yarn.resourcemanager.resource-tracker.address
EXPOSE 8031
# yarn.resourcemanager.admin.address
EXPOSE 8033
# yarn.resourcemanager.webapp.address
EXPOSE 8088
# yarn.resourcemanager.webapp.https.address
EXPOSE 8090

COPY start.sh /opt/hadoop-docker/
CMD ["/opt/hadoop-docker/start.sh"]
