# RabbitMQcluster

Install RabbitMQ Cluster Operator:
```bash
kubectl apply -f "https://github.com/rabbitmq/cluster-operator/releases/latest/download/cluster-operator.yml"
```

Create RabbitMQ Cluster:
```bash
kubectl apply -f "https://raw.githubusercontent.com/EmilOvcina/RabbitMQcluster/master/rabbitmq.yaml"
```

Get details of the RabbitMQ cluster:
```bash
username="$(kubectl get secret rapid-default-user -o jsonpath='{.data.username}' | base64 --decode)"
password="$(kubectl get secret rapid-default-user -o jsonpath='{.data.password}' | base64 --decode)"
service="$(kubectl get service rapid -o jsonpath='{.spec.clusterIP}')"
```


