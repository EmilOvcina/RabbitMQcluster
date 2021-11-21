#!/bin/sh

kubectl -n rabbits exec -it rabbitmq-0 rabbitmqctl set_policy ha-fed '.*' "{'federation-upstream-set':'all', 'ha-sync-mode':'automatic', 'ha-mode':'nodes', 'ha-params':['rabbit@rabbitmq-0.rabbitmq.rabbits.svc.cluster.local','rabbit@rabbitmq-1.rabbitmq.rabbits.svc.cluster.local']}" --priority 1 --apply-to queues
# rabbitmqctl set_policy ha-fed ".*" '{"federation-upstream-set":"all", "ha-sync-mode":"automatic", "ha-mode":"nodes", "ha-params":["rabbit@rabbitmq-0.rabbitmq.rabbits.svc.cluster.local","rabbit@rabbitmq-1.rabbitmq.rabbits.svc.cluster.local"]}' --priority 1 --apply-to queues

rabbitmqctl set_policy ha-fed \
    ".*" '{"federation-upstream-set":"all", "ha-sync-mode":"automatic", "ha-mode":"nodes", "ha-params":["rabbit@rabbitmq-0.rabbitmq.rabbits.svc.cluster.local","rabbit@rabbitmq-1.rabbitmq.rabbits.svc.cluster.local"]}' \
    --priority 1 \
    --apply-to queues

# exit 