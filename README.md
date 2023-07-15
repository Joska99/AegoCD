<h1>ArgoCD template repository</h1>
<img src="https://github.com/Joska99/ArgoCD/blob/main/diagram.drawio.svg">

Template repository for ArgoCD deployment to kubernetes cluster</br>
"application.yaml" ApplicationSet for ArgoCD, need to be deployed to "argocd" NameSpace (same ns where ArgoCD deployed)</br>
This ApplicationSet deploy DesiredState to "app" NameSpace from "k8s" directory in this repository

1. Deploy ArgoCD to your cluster
- Create NameSpace for ArgoCD service
```bash
kubectl create namespace argocd
```
- Apply official ArgoCD Helm chart to a new NameSpace 
```bash
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

2. Access the GUI of ArgoCD service

- Print list of services that were deployed to "argocd" namespace
```bash
kubectl get svc -n argocd
```

- "argocd-service" is IP for GUI  on port 80/443/TCP, you can port-forward to your local machine
```bash
kubectl port-forward -n argocd svc/argocd-server 8080:443
```

- User Name is Admin
- Get password
```bash
kubectl get secret argocd-initial-admin-secret -n argocd -o yaml | grep password: | awk '{print $2}' | base64 --decode
```

3. Apply application.yaml
- Create NameSpace "app" to deploy there desiredState
```bash
kubectl create namespace app
```
- Apply "application.yaml" file to deploy desiredState files from "k8s" directory to "app" namespace
```bash
kubectl apply -n argocd -f application.yaml
```