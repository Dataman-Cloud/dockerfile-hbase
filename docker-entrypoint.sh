#!/bin/bash

sed "s/HBASE_NAMENODE/$HBASE_NAMENODE/;s/ZK_ADDRESS/$ZK_ADDRESS/" /opt/hbase/conf/hbase-site.xml.template > /opt/hbase/conf/hbase-site.xml

cat /opt/hbase/conf/hbase-site.xml

echo $REGION_SERVERS | awk -F ',' '{for(i=1;i<=NF;i++) print $i}' > /opt/hbase/conf/regionservers

cat /opt/hbase/conf/regionservers

exec "$@"

