## Common Helm library chart  
```text
charts/
└── shopverse-common/
    ├── Chart.yaml
    └── templates/
```
Then each microservice has its own chart:   
```text
charts/
├── frontend/
│   ├── Chart.yaml
│   ├── values.yaml
│   └── templates/
│
├── backend/
│   ├── Chart.yaml
│   ├── values.yaml
│   └── templates/
│
├── product/
│   ├── Chart.yaml
│   ├── values.yaml
│   └── templates/
│
└── cart/
    ├── Chart.yaml
    ├── values.yaml
    └── templates/
```
Each service can then have its own:  
```yaml
# frontend/Chart.yaml

apiVersion: v2
name: frontend
version: 1.3.0
appVersion: "2.8.1"
```
and:  
```yaml
# backend/Chart.yaml

apiVersion: v2
name: backend
version: 2.1.0
appVersion: "5.4.2"
```
while both reuse common templates/helpers.  

## What I would choose for Shopverse:  
```text
That's much closer to what I'd recommend for a growing microservices platform.  
shopverse-gitops/
│
├── charts/
│   │
│   ├── shopverse-common/
│   │
│   ├── frontend/
│   │   ├── Chart.yaml
│   │   ├── values.yaml
│   │   └── templates/
│   │
│   ├── backend/
│   │   ├── Chart.yaml
│   │   ├── values.yaml
│   │   └── templates/
│   │
│   ├── product/
│   ├── cart/
│   ├── user/
│   ├── order/
│   └── notification/
│
└── envs/
    ├── dev/
    │   ├── values-frontend.yaml
    │   ├── values-backend.yaml
    │   ├── values-product.yaml
    │   └── ...
    │
    ├── qa/
    └── prod/
```
## The architecture I would settle on for Shopverse  
```text
                    SHOPVERSE GITOPS
                           │
             ┌─────────────┴─────────────┐
             │                           │
        Helm Charts                  Environments
             │                           │
             │                    ┌──────┼──────┐
             │                    │      │      │
             │                   dev     qa    prod
             │
      ┌──────┴─────────┐
      │                │
      ▼                ▼
shopverse-common   application charts
 library chart           │
                         │
                 ┌───────┴────────┐
                 │                │
                 ▼                ▼
          shopverse-backend  shopverse-frontend
             chart 1.x          chart 1.x
                 │                │
                 │                │
                 ▼                ▼
              Argo CD          Argo CD
                 │                │
                 ▼                ▼
              EKS backend      EKS frontend
```
