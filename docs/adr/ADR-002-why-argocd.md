# ADR-002 — Why ArgoCD?

## Status

Accepted

---

## Context

The platform required a deployment mechanism that was:

- Automated
- Declarative
- Version controlled
- Easy to audit
- Suitable for Kubernetes

Traditional CI/CD deployments directly from GitHub Actions introduce configuration drift over time.

---

## Decision

ArgoCD was selected to implement GitOps continuous delivery.

Git repositories are treated as the single source of truth for Kubernetes resources.

---

## Rationale

ArgoCD provides:

- Declarative deployments
- Automatic synchronization
- Drift detection
- Rollback capabilities
- Git as the deployment source
- Better separation between CI and CD

---

## Consequences

### Positive

- Improved deployment consistency
- Easy rollback
- Infrastructure remains version controlled
- Easier disaster recovery

### Negative

- Additional component to manage
- Learning curve for GitOps workflows