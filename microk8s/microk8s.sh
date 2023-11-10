#! /bin/bash

snap install microk8s --classic
microk8s status --wait-ready
microk8s enable dashboard
microk8s enable dns
microk8s enable registry
microk8s enable istio

microk8s kubectl get all --all-namespaces


microk8s.kubectl get nodes
sudo snap alias microk8s.kubectl kubectl
kubectl get nodes
sudo microk8s.status
sudo snap info microk8s
kubectl create deployment nginx --image=nginx
kubectl get deployments
kubectl get pods
kubectl get all --all-namespaces
microk8s dashboard-proxy
