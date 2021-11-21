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

```bash
kubectl -n rabbits apply -f https://raw.githubusercontent.com/EmilOvcina/RabbitMQcluster/main/app/deployment.yaml
```
