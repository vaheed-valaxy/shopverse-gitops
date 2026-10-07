## Get ArgoCD initial admin secret
```text
argocd user: admin
kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 --decode && echo
```
## ArgoCD port forward
```bash
kubectl port-forward svc/argocd-server -n argocd 8090:443 --address 0.0.0.0
```
## Login to ArgoCD
```bash
argocd login 127.0.0.1:8080 --username admin --password ZjVNPFGA3cAJIcXC --insecure
argocd account get-user-info
```
## Install ArgoCD cli
```bash
VERSION=$(curl -L -s https://raw.githubusercontent.com/argoproj/argo-cd/stable/VERSION)

curl -sSL \
  -o argocd-linux-amd64 \
  https://github.com/argoproj/argo-cd/releases/download/v${VERSION}/argocd-linux-amd64

sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd

rm -f argocd-linux-amd64

argocd version --client
```
