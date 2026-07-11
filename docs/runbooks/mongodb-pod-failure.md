# Runbook — MongoDB Pod Failure

## Symptoms

- MongoDB pod restarting
- ReplicaSet unhealthy
- Backend unable to connect

---

## Diagnosis

Check pods:

```bash
kubectl get pods
```

Describe pod:

```bash
kubectl describe pod <pod-name>
```

Logs:

```bash
kubectl logs <pod-name>
```

ReplicaSet status:

```bash
mongosh

rs.status()
```

---

## Recovery

Restart pod:

```bash
kubectl delete pod <pod-name>
```

Verify StatefulSet:

```bash
kubectl get statefulsets
```

Verify Persistent Volumes:

```bash
kubectl get pvc
```

---

## Prevention

- Persistent storage
- Readiness probes
- Liveness probes
- ReplicaSet monitoring