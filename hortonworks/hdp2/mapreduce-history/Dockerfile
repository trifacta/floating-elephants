FROM trifacta/ubuntu-hdp2-base

RUN chown -R root:hadoop /usr/hdp/current/hadoop-yarn-timelineserver/bin/container-executor && \
    chmod -R 650 /usr/hdp/current/hadoop-yarn-timelineserver/bin/container-executor

# mapreduce.jobhistory.address
EXPOSE 10020
# mapreduce.jobhistory.admin.address
EXPOSE 10033
# mapreduce.jobhistory.webapp.address
EXPOSE 19888
# mapreduce.jobhistory.webapp.https.address
EXPOSE 19890

COPY start.sh /opt/hadoop-docker/
CMD ["/opt/hadoop-docker/start.sh"]
