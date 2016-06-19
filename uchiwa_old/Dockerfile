FROM ubuntu:16.04
RUN apt-get update && apt-get install -y wget
RUN wget http://dl.bintray.com/palourde/uchiwa/uchiwa_0.15.0-1_amd64.deb
RUN dpkg -i uchiwa_0.15.0-1_amd64.deb && apt-get install -f
COPY conf.d/* /etc/sensu/dashboard.d/
CMD ["/opt/uchiwa/bin/uchiwa", "-c", "/etc/sensu/dashboard.d/config.json", "-p", "/opt/uchiwa/src/public"]
