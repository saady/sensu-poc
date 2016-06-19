#!/bin/bash
sed -i 's/POD_IP_ADDRESS/'"$POD_IP"'/g' /etc/sensu/conf.d/client.json
sed -i 's/POD_NAME/'"$POD_NAME"'/g' /etc/sensu/conf.d/client.json
/opt/sensu/bin/sensu-client -d /etc/sensu/conf.d -v -l /var/log/sensu/client.log
tail -f /var/log/sensu/client.log
