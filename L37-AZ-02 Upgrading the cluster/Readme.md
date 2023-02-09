# Upgrading a cluster

## Are there new versions available?

    az aks get-upgrades -g [resourcegroupName] --name [clusterName]

## Upgrade the cluster to a newer version

    az aks upgrade -g [resourcegroupName] --name [clusterName] --kubernetes-version [version]

## Upgrade the control plane to a newer version

By using the **--control-plane-only** switch, only the control plane will be upgraded.

    az aks upgrade -g [resourcegroupName] --name [clusterName] --kubernetes-version [version] --control-plane-only

## Upgrade a node pool to a newer version

    az aks nodepool upgrade -g [myResourceGroup] --cluster-name [myAKSCluster] --name [mynodepool] --kubernetes-version [version]

