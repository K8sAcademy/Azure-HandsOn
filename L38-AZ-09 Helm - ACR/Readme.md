# Push a chart to ACR

https://docs.microsoft.com/en-us/azure/container-registry/container-registry-helm-repos

## Create an ACR

    az acr create -g [rsname] --name [name] --sku Basic --admin-enabled true

## Enable OCI support

Set the following environment variable to enable OCI support in the Helm 3 client. Currently, this support is experimental.

    export HELM_EXPERIMENTAL_OCI=1

Powershell:

    $Env:HELM_EXPERIMENTAL_OCI = 1

## Get a list of the configured repos

    helm repo list

    helm registry login [name].azurecr.io --username [user]

## Push the chart to ACR

    helm chart push ./mynginx labgb.azurecr.io/helm/hello-world:v1

## Show the chart

    helm show chart [name]/mynginx

## Delete the chart

    az acr helm delete mynginx

## Remove the repo from the local list

    helm repo remove [name]

## Update the charts list

    helm repo update

