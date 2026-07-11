# ADR-004 — Why MongoDB ReplicaSet?

## Status

Accepted

---

## Context

Restauranty requires persistent storage for application data.

The platform should simulate production deployments rather than using a single MongoDB instance.

---

## Decision

MongoDB ReplicaSet was deployed on Kubernetes using StatefulSets and Persistent Volumes.

---

## Rationale

ReplicaSet provides:

- High availability
- Automatic failover
- Data redundancy
- Production deployment model
- Stateful Kubernetes workloads

---

## Consequences

### Positive

- Better resiliency
- Production-like database architecture
- Improved understanding of StatefulSets

### Negative

- Higher operational complexity
- Increased resource consumption