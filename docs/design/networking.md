# Networking Design

## Purpose

This document describes the networking architecture used by the Restauranty Platform.

---

# Objectives

The networking layer is designed to provide:

- Secure public access
- Traffic isolation
- Layer 7 routing
- High availability
- Production-style architecture

---

# Architecture

```mermaid
flowchart TD

Internet

↓

Application Gateway

↓

Web Application Firewall

↓

AKS Ingress

↓

Frontend

↓

Backend

↓

MongoDB
```

---

# Components

## Azure Virtual Network

Hosts all platform resources.

---

## Subnets

- AKS
- Application Gateway

---

## Application Gateway

Responsibilities:

- SSL Termination
- Layer 7 Routing
- WAF
- Load Balancing

---

## Kubernetes Ingress

Routes requests inside the cluster.

---

## Internal Communication

Pods communicate through Kubernetes Services.

---

# Security

Traffic flow:

HTTPS

↓

Application Gateway

↓

Ingress

↓

Services

↓

Pods

No workloads are directly exposed to the Internet.

---

# Future Improvements

- Private Endpoints
- Azure Firewall
- Network Policies
- Service Mesh