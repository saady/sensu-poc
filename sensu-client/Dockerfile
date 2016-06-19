FROM ubuntu:16.04
RUN apt-get update && apt-get install -y wget
RUN wget -q http://sensu.global.ssl.fastly.net/apt/pubkey.gpg -O- | apt-key add -
RUN echo "deb     http://sensu.global.ssl.fastly.net/apt sensu main" | tee /etc/apt/sources.list.d/sensu.list
RUN apt-get update && apt-get install -y sensu build-essential
COPY sensu-plugins-docker/sensu-plugins-docker-1.1.1.gem .
RUN sensu-install -p sensu-plugins-docker-1.1.1.gem -v
RUN sensu-install -p sensu-plugins-kubernetes
RUN sensu-install -p sensu-plugins-disk-checks
RUN sensu-install -p sensu-plugins-http
RUN mkdir -p /etc/sensu/conf.d
COPY conf.d/* /etc/sensu/conf.d/
COPY client.sh client.sh
RUN chmod +x client.sh
CMD ["./client.sh"]
