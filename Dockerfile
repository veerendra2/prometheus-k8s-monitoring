FROM ubuntu:14.04
RUN apt-get update && apt-get upgrade -y
RUN apt-get install python -y
RUN apt-get install python-yaml wget -y
MAINTAINER OpsMx
RUN wget -qO /opt/promethes.tar.gz https://github.com/prometheus/prometheus/releases/download/v2.0.0/prometheus-2.0.0.linux-amd64.tar.gz
RUN tar -xf /opt/promethes.tar.gz -C /opt/
RUN mv /opt/prometheus-2.0.0.linux-amd64 /opt/prometheus
ADD update_config.py /opt/update_config.py
ADD run.sh /opt/run.sh
RUN chmod +x /opt/run.sh
CMD ["/opt/run.sh"]