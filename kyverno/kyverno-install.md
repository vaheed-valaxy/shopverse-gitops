## Helm Install  
```bash
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-4
chmod 700 get_helm.sh
./get_helm.sh

helm version
```
## Non-Production Kyverno Installation  
```bash
helm repo add kyverno https://kyverno.github.io/kyverno/
helm repo update
helm install kyverno kyverno/kyverno -n kyverno --create-namespace
```

## High Availability Installation  
```bash
helm install kyverno kyverno/kyverno -n kyverno --create-namespace \
--set admissionController.replicas=3 \
--set backgroundController.replicas=2 \
--set cleanupController.replicas=2 \
--set reportsController.replicas=2
```

## Check kyverno version  
```bash
kyverno version

kyverno version --client

kubectl -n kyverno get deployment kyverno-admission-controller \
  -o jsonpath='{.spec.template.spec.containers[0].image}'
```
