FROM ubuntu:16.04
RUN apt-get update && apt-get install -y wget
RUN wget -q http://sensu.global.ssl.fastly.net/apt/pubkey.gpg -O- | apt-key add -
RUN echo "deb     http://sensu.global.ssl.fastly.net/apt sensu main" | tee /etc/apt/sources.list.d/sensu.list
RUN apt-get update && apt-get install -y sensu build-essential curl dnsutils
RUN sensu-install -p sensu-plugins-cpu-checks
RUN sensu-install -p sensu-plugins-io-checks
RUN sensu-install -p sensu-plugins-vmstats
RUN sensu-install -p sensu-plugins-load-checks
RUN sensu-install -p sensu-plugins-disk-checks
RUN sensu-install -p sensu-plugins-http
RUN sensu-install -p sensu-plugins-ntp
RUN sensu-install -p sensu-plugins-network-checks
RUN sensu-install -p sensu-plugins-process-checks
RUN sensu-install -p sensu-plugins-filesystem-checks
RUN mkdir -p /etc/sensu/conf.d
COPY conf.d/* /etc/sensu/conf.d/
COPY client.sh client.sh
RUN chmod +x client.sh
CMD ["./client.sh"]
