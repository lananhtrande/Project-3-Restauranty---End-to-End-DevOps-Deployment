# Runbook — AKS Node Not Ready

## Symptoms

- Node status becomes `NotReady`
- Pods remain in `Pending`
- Scheduling failures occur

---

## Diagnosis

Check node status:

```bash
kubectl get nodes
```

Describe the node:

```bash
kubectl describe node <node-name>
```

Check events:

```bash
kubectl get events --sort-by=.metadata.creationTimestamp
```

---

## Common Causes

- VM unavailable
- Kubelet failure
- Disk pressure
- Memory pressure
- Network issue

---

## Recovery

Drain node:

```bash
kubectl drain <node-name> --ignore-daemonsets
```

Restart node if required.

Uncordon:

```bash
kubectl uncordon <node-name>
```

Verify:

```bash
kubectl get nodes
```

---

## Prevention

- Monitor node health
- Enable cluster autoscaler
- Configure resource requests and limits