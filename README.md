<h1>ArgoCD template repository</h1>
<img src="https://github.com/Joska99/ArgoCD/blob/main/diagram.drawio.svg">

Template repository for ArgoCD</br>

- For set-up used this oficial ArgoCD page

https://argo-cd.readthedocs.io/en/stable/getting_started/

## Set up

1. Set up script in "argocd-setup" directory 
2. Script apply official manifest to "argocd" namespace
```bash
bash ./argocd-setup/set_up.sh
```

## Login

- User Name: Admin
- Get password:
```bash
kubectl get secret argocd-initial-admin-secret -n argocd -o yaml | grep password: | awk '{print $2}' | base64 --decode
```

## Apply ApplicationSet for simple Kubernetes manifest

<p>
In k8s directory simple deployment file </br>
File "simple_k8s_app_set.yaml" in "argocd-setup" directory ApplicationSet for ArgoCD</br>
Need to be deployed this ApplicationSet to "argocd" NameSpace (same ns where ArgoCD controller deployed), to apply manifest from "k8s" directory to "app" NameSpace
</p>

1. Create NameSpace "app" to deploy there desiredState
```bash
kubectl create namespace app
```
2. Apply ApplicationSet file to deploy desiredState
```bash
kubectl apply -n argocd -f ./argocd-setup/application.yaml
```