`argocd-cm`
```yaml
data:
  accounts.shopverse-gh-actions-dev: apiKey


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
  - name: github-actions-dev
    policies:
      - p, proj:shopverse-dev:github-actions-dev, applications, get, ...
      - p, proj:shopverse-dev-app-project:github-actions-dev, applications, sync, ...
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
