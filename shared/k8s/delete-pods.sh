#! /bin/bash
set -e

read -p "Digite o nome do status: " status


for p in $(kubectl get pods | grep $status | awk '{print $1}'); do 
    kubectl delete pod $p --grace-period=0 --force;
done
