# CI/CD Design

## Purpose

This document explains the software delivery workflow used by the platform.

---

# Goals

- Fully automated deployment
- GitOps
- Reproducible builds
- Infrastructure as Code

---

# Pipeline

```mermaid
flowchart TD

Developer

↓

GitHub

↓

GitHub Actions

↓

Docker Build

↓

Azure Container Registry

↓

Terraform

↓

ArgoCD

↓

AKS
```

---

# CI Responsibilities

GitHub Actions performs:

- Build
- Test
- Docker Image
- Push Image
- Infrastructure Deployment

---

# CD Responsibilities

ArgoCD performs:

- Deployment
- Drift Detection
- Rollback
- Synchronization

---

# Deployment Strategy

Current:

Rolling Update

Future:

Blue/Green

Canary

---

# Benefits

- Declarative deployments
- GitOps
- Easy rollback
- Reproducible releases