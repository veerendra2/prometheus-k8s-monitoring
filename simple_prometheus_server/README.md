# Simple Prometheus Server for K8s
* An old method to deploy Prometheus server on K8s which cAdvisor has to deploy manually on every node in cluster

## How to launch as pods in K8s
1. Get Username, Password and K8s API server IP from `~./kube/config`
2. Get the `prometheus-pod.yaml` file from [here]() and change `api`, `username` and `password`
3. `kubectl create -f prometheus-pod.yaml`
4. Open the port `31909` in any node of your cluster
5. Access UI http:<NODE_IP>:31909/graph

## Run the container
```
docker run -d -it  -p 9090:9090 \
-e api="https://xx.xx.xx.xx" \
-e username="xxxx" \
-e password="xxxxxxxx" \
quay.io/veerendra2/prometheus-server:latest
```
And open http://localhost:9090
