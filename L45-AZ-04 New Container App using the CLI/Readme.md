# L45-AZ-04

Create a Container App using the CLI

## Install the extention

Add the Container App extension. This is a one time installation.

    az extension add --name containerapp --upgrade

## Install the required providers

These 2 providers are required. This is a one time installation.

    az provider register --namespace Microsoft.App
    az provider register --namespace Microsoft.OperationalInsights

## Create a resource group

    az group create -n ca-lab2 -l eastus2

## Create an environment

    az containerapp env create -n managedEnvironment-lab2 -g ca-lab2 --location eastus2

## Create a Container App

    az containerapp create -n lab2 -g ca-lab2 --environment managedEnvironment-lab2 --image nginx:alpine --target-port 80 --cpu 0.5 --memory 1.0Gi --ingress 'external' 

## Test

In the output of the create, locate the **fqdn** field to get the link to test the app.

## Cleanup

Delete the resource group.

    az group delete -n ca-lab2 --no-wait -y
