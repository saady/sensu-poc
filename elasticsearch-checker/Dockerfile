FROM ubuntu:16.04
RUN apt-get update && apt-get install -y wget
RUN wget -q http://sensu.global.ssl.fastly.net/apt/pubkey.gpg -O- | apt-key add -
RUN echo "deb     http://sensu.global.ssl.fastly.net/apt sensu main" | tee /etc/apt/sources.list.d/sensu.list
RUN apt-get update && apt-get install -y sensu build-essential curl dnsutils
RUN sensu-install -p sensu-plugins-elasticsearch
RUN mkdir -p /etc/sensu/conf.d
COPY conf.d/* /etc/sensu/conf.d/
COPY client.sh client.sh
RUN chmod +x client.sh
CMD ["./client.sh"]
