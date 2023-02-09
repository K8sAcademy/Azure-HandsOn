# Deploy an app to AKS

## Create the cluster

Create the cluster using the default VM size with a node count of 1

    az aks create --resource-group <resourceGroup> --name <myAKSCluster> --node-count 1 --enable-addons monitoring --generate-ssh-keys

## Get the cluster credentials

    az aks get-credentials --resource-group <resourcegroupName> --name <clusterName>

## Let's check if we have a new context

    kubectl config get-contexts

## Are you connected to the cluster?

    kubectl get nodes

## Voting app

The source code is available here: https://github.com/dockersamples/example-voting-app

## Deploy the app

    kubectl create namespace vote
    kubectl create -f vote/

## Get the pods info

    kubectl get pods -n vote
    kubectl describe pods -n vote

## Get the services info

    kubectl get services 
    kubectl describe svc -n vote    

## Monitor the load balancers configuration progress

    kubectl get svc -n vote --watch

Get the external IP for the **vote** service and test in a browser.

Get the external IP for the **result** service and test in a browser to see the results.

## Delete the app

    kubectl delete -f vote/
    kubectl delete ns vote
