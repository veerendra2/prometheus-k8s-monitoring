#!/bin/bash

kubectl delete -f https://raw.githubusercontent.com/veerendra2/prometheus-k8s-monitoring/master/cadvisor-daemonset.yml
kubectl delete -f https://raw.githubusercontent.com/veerendra2/prometheus-k8s-monitoring/master/prometheus-configmap.yml
kubectl delete -f https://raw.githubusercontent.com/veerendra2/prometheus-k8s-monitoring/master/prometheus-rbac.yml
kubectl delete -f https://raw.githubusercontent.com/veerendra2/prometheus-k8s-monitoring/master/prometheus-deployment.yml
