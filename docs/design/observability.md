# Observability Design

## Objectives

The platform provides operational visibility through metrics and centralized logging.

---

# Monitoring Stack

```mermaid
flowchart TD

AKS

↓

Prometheus

↓

Grafana
```

---

# Logging

```mermaid
flowchart TD

Pods

↓

Loki

↓

Grafana
```

---

# Metrics

Collected metrics include:

- CPU
- Memory
- Pod Health
- Node Status
- Network

---

# Dashboards

Current dashboards:

- Kubernetes Cluster
- Nodes
- Pods
- Deployments

---

# Logging

Logs are centralized using Loki.

---

# Future Improvements

- Alertmanager
- Azure Monitor
- SLO
- SLA
- Distributed Tracing