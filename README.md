# RabbitMQcluster

```bash
kubectl create ns rabbits
```

```bash
kubectl -n rabbits apply -f https://raw.githubusercontent.com/EmilOvcina/RabbitMQcluster/main/rabbit-rbac.yaml
kubectl -n rabbits apply -f https://raw.githubusercontent.com/EmilOvcina/RabbitMQcluster/main/rabbit-configmap.yaml
kubectl -n rabbits apply -f https://raw.githubusercontent.com/EmilOvcina/RabbitMQcluster/main/rabbit-secret.yaml
kubectl -n rabbits apply -f https://raw.githubusercontent.com/EmilOvcina/RabbitMQcluster/main/rabbit-statefulset.yaml
```

Test gateway ./app/:
```bash
kubectl -n rabbits apply -f https://raw.githubusercontent.com/EmilOvcina/RabbitMQcluster/main/app/deployment.yaml
```

Queue Mirroring:
```bash
kubectl -n rabbits exec -it rabbitmq-0 bash
```

```bash
rabbitmqctl set_policy ha-fed \
    ".*" '{"federation-upstream-set":"all", "ha-sync-mode":"automatic", "ha-mode":"nodes", "ha-params":["rabbit@rabbitmq-0.rabbitmq.rabbits.svc.cluster.local","rabbit@rabbitmq-1.rabbitmq.rabbits.svc.cluster.local"]}' \
    --priority 1 \
    --apply-to queues
```

```bash
exit
```
