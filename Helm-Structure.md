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

That's much closer to what I'd recommend for a growing microservices platform.  
