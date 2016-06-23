#!/bin/bash
HOSTNAME=$(curl http://169.254.169.254/latest/meta-data/local-hostname)
IP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)

sed -i 's/IP_ADDRESS/'"$IP"'/g' /etc/sensu/conf.d/client.json
sed -i 's/POD_NAME/'"$HOSTNAME"'/g' /etc/sensu/conf.d/client.json
/opt/sensu/bin/sensu-client -d /etc/sensu/conf.d -v
