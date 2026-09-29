

```bash
kubectl get configmap argocd-cm -n argocd
kubectl get configmap argocd-cm -n argocd -o yaml
```
`argocd-cm`
```yaml
data:
  accounts.shopverse-gh-actions-dev: apiKey
---------------------------------------------

apiVersion: v1
kind: ConfigMap
metadata:
  name: argocd-cm
  namespace: argocd
data:
  application.namespaces: argocd        # Ensure **Application** CRDs should be created in `argocd` namespace

  accounts.shopverse-gh-actions-dev: apiKey
```

`Your AppProject`
```yaml
roles:
  - name: shopverse-gh-actions-dev
    policies:
        # Allow GitHub Actions to read the DEV applications
        - p, proj:shopverse-dev:shopverse-gh-actions-dev, applications, get, shopverse-dev-app-project/*, allow 

        # Allow GitHub Actions to sync the DEV applications
        - p, proj:shopverse-dev:shopverse-gh-actions-dev, applications, sync, shopverse-dev-app-project/*, allow
```

Generate token:  
```bash
argocd account generate-token --account github-actions-dev
```

Store token in GitHub:  
```text
DEV_ARGOCD_AUTH_TOKEN
```

```bash
kubectl get configmap argocd-cm -n argocd -o yaml
kubectl get applications.argoproj.io -n argocd
```
