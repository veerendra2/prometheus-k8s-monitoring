# K8s Monitoring with Prometheus + cAdvisor DaemonSet
1. Run cAdvisor Daemonset which K8s deploys the cAdvisor on every node in cluster
```
kubectl create -f https://raw.githubusercontent.com/veerendra2/prometheus-k8s-monitoring/master/cadvisor-daemonset.yml
```
2. Run Prometheus Configmap which provides config for prometheus server. If nessasary edit the config and run
```
kubectl create -f https://raw.githubusercontent.com/veerendra2/prometheus-k8s-monitoring/master/prometheus-configmap.yml
```
3. Apply RBAC
```
kubectl apply -f https://raw.githubusercontent.com/veerendra2/prometheus-k8s-monitoring/master/prometheus-rbac.yml
```
4. Now create `Deployment` which K8s creates Prometheus POD, Service with a NodePort `30901`
```
kubectl create -f https://raw.githubusercontent.com/veerendra2/prometheus-k8s-monitoring/master/prometheus-deployment.yml
```
* Open TCP port 30901 on any node in the cluster.
* Access the Prometheus UI `http://<NODE IP>:30901`
##### NOTE
* I have relabeled `__meta_kubernetes_pod_name` to `container_label_io_kubernetes_pod_name` and `__meta_kubernetes_namespace` to `container_label_io_kubernetes_pod_namespace` which look like `cAdvisor`'s metric tag. So carefull it will add `exported_` for those two metrics like `exported_container_label_io_kubernetes_pod_namespace` and `exported_container_label_io_kubernetes_pod_name`

* run.sh -  https://raw.githubusercontent.com/veerendra2/prometheus-k8s-monitoring/master/run.sh
* kill.sh - https://raw.githubusercontent.com/veerendra2/prometheus-k8s-monitoring/master/kill.sh
