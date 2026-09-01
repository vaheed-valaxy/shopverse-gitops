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
