# Prometheus Server for K8s
RUN
```
docker run -e api="https://xx.xx.xx.xx" \
 -e username="admin" \
 -e password="xxxxxxx" \
 -p 9090:9090 \
 -d -it \
prometheus:latest
```
