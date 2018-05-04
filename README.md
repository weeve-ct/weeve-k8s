# weeve Kubernetes



### shell commands:
- Get K8s context `gcloud container clusters get-credentials <cluster name>`
- list kubectl contexts: `kubectl config get-contexts`
- set kubectl context: `kubectl config use-context <context name>`


### Concepts:

- **Pod** - bundle of (Docker) containers that share a "localhost" scope
- **Deployment** - template definition for pods
- **NodePort** - service that externally exposes pods by provisioning a random "high port" (30000+)
- **ClusterIP** - service that internally exposes pods to each other
- **Ingress** - externally facing load balancer that proxies internal services
