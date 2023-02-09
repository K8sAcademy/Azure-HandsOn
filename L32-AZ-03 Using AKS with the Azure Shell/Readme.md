# Deploy an app to AKS using Cloud Shell

Head to https://shell.azure.com/

## List the subscriptions you have access to

    az account list

## Show what is the current subscription

    az account show

## Set the current subscription

    az account set -s <subscription name>

## Get the cluster credentials

    az aks get-credentials --resource-group <resourcegroupName> --name <clusterName>

## Let's check if we have a new context

    kubectl config get-contexts

## Are you connected to our AKS?

    kubectl get nodes

## Upload the azure-vote.yaml file

Click the **upload/download button** in the toolbar and upload the **azure-vote.yaml** file.

Type **ls** to confirm that the file was uploaded.

## Deploy the app

    kubectl apply -f azure-vote.yaml

## Get the pods info

    kubectl get pods 
    kubectl describe pods

## Monitor the load balancer configuration progress

    kubectl get svc --watch

Get the external IP and test in a browser.

## Delete the app

    kubectl delete -f azure-vote.yaml

## Delete the YAML file

    rm azure-vote.yaml
