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
│   │       ├── _deployment.tpl
│   │       ├── _service.tpl
│   │       ├── _configmap.tpl
│   │       ├── _hpa.tpl
│   │       └── _serviceaccount.tpl
│   │
│   ├── backend/
│   │   ├── Chart.yaml
|   |   ├── values.yaml
│   │   └── templates/
│   │       └── resources.yaml
│   │
│   └── frontend/
│       ├── Chart.yaml
|       ├── values.yaml
│       └── templates/
|           └── resources.yaml      
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
