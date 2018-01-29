#!/bin/bash

kubectl apply -f cadvisor-daemonset.yml
kubectl apply -f prometheus-configmap.yml
kubectl apply -f prometheus-rbac.yml
kubectl apply -f prometheus-deployment.yml
