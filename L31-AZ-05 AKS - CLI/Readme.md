# Create a new AKS

Let's create an AKS using the Azure CLI.

## Azure Monitor add-ons

Before starting, let's validate that some required add-ons are installed.

    az provider show -n Microsoft.OperationsManagement -o table
    az provider show -n Microsoft.OperationalInsights -o table

If not registered, use the following commands:

    az provider register --namespace Microsoft.OperationsManagement
    az provider register --namespace Microsoft.OperationalInsights

## Create a resource group

Create a resource group using a location near you.

    az group create --name <resourceGroup> --location <name>

Use this coomand to get the locations names:

    az account list-locations -o table

## Create the cluster

Create the cluster using the default VM size with a node count of 3

    az aks create --resource-group <resourceGroup> --name <myAKSCluster> --node-count 3 --enable-addons monitoring --generate-ssh-keys

## Delete the cluster

Delete the cluster

    az aks delete --resource-group <resourceGroup> --name <myAKSCluster> --no-wait
    az group delete --resource-group <resourceGroup> --no-wait

