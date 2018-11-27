#!/bin/bash

let memTotal=`cat /proc/meminfo | grep MemTotal | awk '{printf "%d", $2/1024 }'`
echo "INFO: OS total memory: "$memTotal"M"
# if os memory <= 2G
if [ $memTotal -le 2048 ]; then
  SERVICE_OPTS="${SERVICE_OPTS} -Xms1536m -Xmx1536m"
  SERVICE_OPTS="${SERVICE_OPTS} -Xmn768m"
else
  SERVICE_OPTS="${SERVICE_OPTS} -Xms4g -Xmx4g"
  SERVICE_OPTS="${SERVICE_OPTS} -Xmn2g"
fi
