#!/bin/bash
~/.kubectx/kubens $1
OUTPUT=`helm list | grep $1`
if [ -z "${OUTPUT}" ];then
    # helm chart is not installed
    echo "installing helm chart"
    helm install --namespace $1 --set image=$2 $1 $1
else
    # helm chart is already installed
    echo "upgrade helm chart"
    helm upgrade --namespace $1 --set image=$2 $1 $1
fi