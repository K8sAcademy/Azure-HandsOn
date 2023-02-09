# Create a NodePort service

## Deploy the service

    kubectl apply -f nodeport.yaml

## Deploy the app

    kubectl apply -f deploy-app.yaml


## Deploy Busybox

    kubectl apply -f pod.yaml

## Get the pods list

    kubectl get pods -o wide
 
## Connect to the BusyBox container

    kubectl exec mybox -it -- /bin/sh

Get the Nginx home page thru the ClusterIP service.  Note that we don't have to specify a port number.  Why?

    wget -qO- http://svc-example
    exit

## Port forward to the service

Using the service port

    kubectl port-forward service/svc-example 8080:80

Using the nodeport

    kubectl port-forward service/svc-example 8080:32410

## Use the nodeport?

Does a node in an AKS cluster have a public IP address?

    kubectl get nodes -o wide

No, so there's no way to use the NodePort service from outside the cluster.

## Cleanup

    kubectl delete -f nodeport.yaml
    kubectl delete -f deploy-app.yaml
    kubectl delete -f pod.yaml  --grace-period=0 --force

---

© Copyright AZCode, All Rights Reserved | https://kubernetesacademy.online