#!/bin/bash

kubectl apply -f https://raw.githubusercontent.com/veerendra2/prometheus-k8s-monitoring/master/cadvisor-daemonset.yml
kubectl apply -f https://raw.githubusercontent.com/veerendra2/prometheus-k8s-monitoring/master/prometheus-configmap.yml
kubectl apply -f https://raw.githubusercontent.com/veerendra2/prometheus-k8s-monitoring/master/prometheus-rbac.yml
kubectl apply -f https://raw.githubusercontent.com/veerendra2/prometheus-k8s-monitoring/master/prometheus-deployment.yml
echo ""
kubectl get services | grep prometheus
