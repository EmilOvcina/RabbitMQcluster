#!/bin/sh
kind create cluster --name rabbit --image tempkind --config cluster.yaml

kubectl create ns rabbits

kubectl -n rabbits apply -f rabbit-rbac.yaml
kubectl -n rabbits apply -f rabbit-configmap.yaml
kubectl -n rabbits apply -f rabbit-secret.yaml
kubectl -n rabbits apply -f rabbit-statefulset.yaml

# kubectl -n rabbits exec -t rabbitmq-0 bash

# rabbitmqctl set_policy ha-fed \
#     ".*" '{"federation-upstream-set":"all", "ha-sync-mode":"automatic", "ha-mode":"nodes", "ha-params":["rabbit@rabbitmq-0.rabbitmq.rabbits.svc.cluster.local","rabbit@rabbitmq-1.rabbitmq.rabbits.svc.cluster.local"]}' \
#     --priority 1 \
#     --apply-to queues

# exit 

kubectl -n rabbits apply -f app/deployment.yaml 