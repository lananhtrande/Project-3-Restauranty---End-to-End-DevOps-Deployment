# Security Design

## Objectives

The platform follows cloud-native security principles.

---

# Secrets

Azure Key Vault stores:

- Database credentials
- API Keys
- TLS certificates

Secrets are injected into Kubernetes workloads.

---

# Identity

Authentication is handled using Azure identities.

GitHub Secrets are used during CI.

---

# Network Security

External traffic

↓

Application Gateway

↓

WAF

↓

Ingress

↓

AKS

---

# Container Security

Current:

- Official Images
- Image Version Pinning

Future:

- Trivy
- Image Signing
- SBOM

---

# RBAC

Access is controlled through Kubernetes RBAC.

---

# Future Improvements

- Workload Identity
- Kyverno
- OPA Gatekeeper
- Security Scanning