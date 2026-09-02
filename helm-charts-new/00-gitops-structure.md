## Gitops - Structure  
```text
shopverse-gitops/
│
├── charts/
│   │
│   ├── common/
│   │   ├── Chart.yaml
│   │   ├── values.yaml
│   │   └── templates/
│   │       ├── _helpers.tpl
│   │       ├── deployment.yaml
│   │       ├── service.yaml
│   │       ├── configmap.yaml
│   │       ├── hpa.yaml
│   │       └── serviceaccount.yaml
│   │
│   ├── backend/
│   │   ├── Chart.yaml
│   │   └── values.yaml
│   │
│   └── frontend/
│       ├── Chart.yaml
│       └── values.yaml
│
└── envs/
    │
    ├── dev/
    │   ├── values-backend.yaml
    │   └── values-frontend.yaml
    │
    ├── qa/
    │   ├── values-backend.yaml
    │   └── values-frontend.yaml
    │
    └── prod/
        ├── values-backend.yaml
        └── values-frontend.yaml
```
