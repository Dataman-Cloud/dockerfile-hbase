FROM nerdammer/hbase:1.1.0.1
MAINTAINER Nicola Ferraro <nibbio84@gmail.com>

RUN yum install openssh-clients -y

ADD hbase-site.xml.template /opt/hbase/conf/hbase-site.xml.template
ADD docker-entrypoint.sh /usr/local/sbin/docker-entrypoint.sh

ENV HBASE_MANAGES_ZK false
ENV ZK_ADDRESS 127.0.0.1
ENV HDFS_NAMENODE 127.0.0.1
ENV REGION_SERVERS 127.0.0.1
ENV HBASE_HEAPSIZE 2048

# zookeeper
# EXPOSE 2181
# HBase Master API port
EXPOSE 60000
# HBase Master Web UI
EXPOSE 60010
# Regionserver API port
EXPOSE 60020
# HBase Regionserver web UI
EXPOSE 60030

WORKDIR /opt/hbase/bin

ENV PATH=$PATH:/opt/hbase/bin

RUN chmod a+x /usr/local/sbin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/sbin/docker-entrypoint.sh"]

CMD ["/opt/hbase/bin/start-hbase.sh"]
