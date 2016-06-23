#!/bin/bash
sed -i 's/POD_IP/'"$POD_IP"'/g' /etc/sensu/conf.d/client.json
sed -i 's/POD_NAME/'"$POD_NAME"'/g' /etc/sensu/conf.d/client.json
/opt/sensu/bin/sensu-client -d /etc/sensu/conf.d -v
