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
## Follow this:
| Component                         | Recommendation                          |
| --------------------------------- | --------------------------------------- |
| Frontend CI                       | Application-specific reusable workflows |
| Backend CI                        | Application-specific reusable workflows |
| Docker build                      | Reusable workflow                       |
| Trivy image                       | Reusable workflow                       |
| Cosign                            | Reusable workflow                       |
| Update GitOps values              | Reusable workflow                       |
| GitOps PR                         | Created by application CI               |
| GitOps CI trigger                 | `pull_request`                          |
| GitOps validation                 | Separate GitOps workflow                |
| Helm/Kubeconform/Trivy            | Reusable GitOps validation workflow     |
| Validate all components initially | **Yes**                                 |
| Changed-component detection       | **Later, when needed**                  |
| Argo CD                           | Deploy after GitOps merge               |
| Kyverno                           | Final admission enforcement             |
