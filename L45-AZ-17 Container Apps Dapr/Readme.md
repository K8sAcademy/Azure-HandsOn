# L45-AZ-17

Dapr integration

## Create a resource group

    az group create -n ca-lab17 -l eastus2

## Storage account

Create the storage account

    az storage account create -n lab17[your initials] -g ca-lab17 -l eastus2 --sku Standard_LRS --kind StorageV2

Get the key

    az storage account keys list -n lab17[your initials] -g ca-lab17 --query '[0].value' --out tsv

## edit the statestore.yaml file

Replace the **<accountName>** placeholder with your storage account name.

Replace the **<accountKey>** placeholder with the storage account key.

## Create an environment

    az containerapp env create -n managedEnvironment-lab17 -g ca-lab17 --location eastus2

## Configure Dapr

    az containerapp env dapr-component set --name managedEnvironment-lab17 -g ca-lab17 --dapr-component-name statestore --yaml statestore.yaml

## Deploy the Node App

    az containerapp create -n nodeapp -g ca-lab17 --environment managedEnvironment-lab17 --image dapriosamples/hello-k8s-node:latest --target-port 3000 --ingress 'internal' --min-replicas 1 --max-replicas 1 --enable-dapr --dapr-app-id nodeapp --dapr-app-port 3000 --env-vars 'APP_PORT=3000'

## Deploy the order generator

    az containerapp create -n pythonapp -g ca-lab17 --environment managedEnvironment-lab17 --image dapriosamples/hello-k8s-python:latest --min-replicas 1 --max-replicas 1 --enable-dapr --dapr-app-id pythonapp

## Test

Head to the portal. Locate the storage account and the Blob container. You should see the order file there.

## Cleanup

Delete the resource group.

    az group delete -n ca-lab17 --no-wait -y
