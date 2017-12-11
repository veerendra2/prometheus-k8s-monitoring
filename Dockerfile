FROM ubuntu:14.04
RUN apt-get update && apt-get upgrade -y
RUN apt-get install python -y
RUN apt-get install python-yaml -y
MAINTAINER OpsMx
ADD prometheus /opt/prometheus/
ADD update_config.py /opt/update_config.py
ADD run.sh /opt/run.sh
RUN chmod +x /opt/run.sh
CMD ["/opt/run.sh"]