#!/bin/bash

# Create ns for ArgoCD
kubectl create namespace argocd

# Install ArgoCD
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Change service type to LoadBalancer to expose
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'

# Get password
kubectl get secret argocd-initial-admin-secret -n argocd -o yaml | grep password: | awk '{print $2}' | base64 --decode

