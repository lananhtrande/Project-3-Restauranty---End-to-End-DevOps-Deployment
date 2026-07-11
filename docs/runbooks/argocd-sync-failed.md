# Runbook — ArgoCD Sync Failed

## Symptoms

- Application OutOfSync
- Sync failed
- Resources not updated

---

## Diagnosis

Check application:

```bash
argocd app list
```

Describe application:

```bash
argocd app get restauranty
```

Review events.

Check repository connection.

---

## Recovery

Manual sync:

```bash
argocd app sync restauranty
```

Force sync if required:

```bash
argocd app sync restauranty --force
```

---

## Common Causes

- Invalid manifests
- Missing secrets
- Image unavailable
- Resource conflict

---

## Prevention

- Validate manifests before merge
- Automated CI checks
- GitOps workflow reviews