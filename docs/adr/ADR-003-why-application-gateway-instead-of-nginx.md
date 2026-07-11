# ADR-003 — Why Azure Application Gateway instead of NGINX?

## Status

Accepted

---

## Context

The platform required:

- HTTPS termination
- Layer 7 routing
- Web Application Firewall
- Azure-native integration
- Secure internet exposure

---

## Decision

Azure Application Gateway with Web Application Firewall (WAF) was selected as the external entry point for the platform.

Kubernetes Ingress is responsible for routing traffic inside the cluster.

---

## Rationale

Application Gateway provides:

- Managed Layer 7 load balancing
- Native Azure service
- Built-in Web Application Firewall
- SSL termination
- Better integration with Azure networking
- Enterprise-grade security

---

## Alternatives Considered

### NGINX Ingress

Advantages

- Lightweight
- Open source
- Highly configurable

Disadvantages

- Additional maintenance
- WAF requires ModSecurity
- Less Azure-native integration

---

## Consequences

### Positive

- Better security posture
- Reduced operational complexity
- Production-like architecture

### Negative

- Higher Azure cost