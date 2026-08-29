## File Structure:  
```text
shopverse-gitops/
│
├── helm-charts/
│   ├── frontend/
│   ├── backend/
│   ├── redis/
│   ├── payment/
│   ├── order/
│   └── notification/
│
├── envs/
│   └── dev/
│       ├── values-frontend.yaml
│       ├── values-backend.yaml
│       ├── values-redis.yaml
│       ├── values-payment.yaml
│       ├── values-order.yaml
│       └── values-notification.yaml
│
└── .github/
    └── workflows/
        ├── gitops-ci-pr.yml
        └── reusable-gitops-validation.yml
```
