#!/bin/bash

kubectl delete -f cadvisor-daemonset.yml
kubectl delete -f prometheus-configmap.yml
kubectl delete -f prometheus-rbac.yml
kubectl delete -f prometheus-deployment.yml
