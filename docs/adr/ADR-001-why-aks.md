# ADR-001 — Why Azure Kubernetes Service (AKS)?

## Status

Accepted

---

## Context

Restauranty was designed as a production-style cloud platform deployed on Microsoft Azure.

The platform required:

- Managed Kubernetes
- High availability
- Integration with Azure networking
- Infrastructure as Code
- GitOps deployments
- Production observability
- Autoscaling

Managing Kubernetes manually on Azure virtual machines would introduce unnecessary operational complexity.

---

## Decision

Azure Kubernetes Service (AKS) was selected as the orchestration platform.

Infrastructure is provisioned using Terraform and workloads are deployed through GitOps using ArgoCD.

---

## Rationale

Advantages include:

- Fully managed Kubernetes control plane
- Native Azure networking integration
- Support for multiple node pools
- Horizontal Pod Autoscaler
- Integration with Azure Monitor
- Native support for Azure Key Vault
- Terraform support
- Production-ready networking

---

## Consequences

### Positive

- Reduced operational overhead
- Easier Kubernetes upgrades
- Production-like deployment model
- Cloud-native architecture
- Better learning of enterprise Kubernetes

### Negative

- Vendor lock-in to Azure
- Slightly higher cloud cost than self-managed clusters