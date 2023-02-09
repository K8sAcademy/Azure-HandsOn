# Scaling Nodes

## Get the nodepool name using the portal or the command line

    az aks nodepool list -g [resourcegroupName] --cluster-name [clusterName]

## Enable the autoscaler

    az aks nodepool update -g [resourcegroupName] --cluster-name [clusterName] --name [nodepoolName] --enable-cluster-autoscaler --min-count 1 --max-count 5

## Deploy 10 pods

    kubectl apply -f deploy.yaml

    kubectl get pods

    kubectl get nodes

## Delete the pods

    kubectl delete -f deploy.yaml

## Disable the autoscaler

    az aks nodepool update -g [resourcegroupName] --cluster-name [clusterName] --name [nodepoolName] --disable-cluster-autoscaler
