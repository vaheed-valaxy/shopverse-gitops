## 1. Final directory structure  
```text
shopverse-gitops/
│
├── charts/
│   │
│   ├── shopverse-common/
│   │   ├── Chart.yaml
│   │   └── templates/
│   │       └── _helpers.tpl
│   │
│   ├── shopverse-backend/
│   │   ├── Chart.yaml
│   │   ├── values.yaml
│   │   ├── values.schema.json
│   │   └── templates/
│   │       ├── _helpers.tpl
│   │       ├── deployment.yaml
│   │       ├── service.yaml
│   │       ├── serviceaccount.yaml
│   │       ├── configmap.yaml
│   │       └── hpa.yaml
│   │
│   └── shopverse-frontend/
│       ├── Chart.yaml
│       ├── values.yaml
│       ├── values.schema.json
│       └── templates/
│           ├── _helpers.tpl
│           ├── deployment.yaml
│           ├── service.yaml
│           ├── serviceaccount.yaml
│           ├── configmap.yaml
│           └── hpa.yaml
│
└── envs/
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
