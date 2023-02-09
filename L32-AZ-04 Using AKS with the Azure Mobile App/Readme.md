# Azure Mobile App

Available on iOS and Android.  Look for the links at the bottom of the Home page in the Azure Portal.

Launch the shell

## Set the subscription

    az account list
    az account show
    az account set -s <subscription name>

## Get the cluster credentials

    az aks get-credentials -g <resourcegroupName> -n <clusterName>

## Let's check if we have a new context

    kubectl config get-contexts

## Are you connected to our AKS?

    kubectl get nodes
