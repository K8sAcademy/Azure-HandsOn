# Azure Files

## Deploy the StorageClass

    kubectl apply -f sc.yaml

## Look at the StorageClass

    kubectl get sc

## Deploy the claim

    kubectl apply -f pvc.yaml

## Look at the pvc

    kubectl get pvc

## Deploy the pod

    kubectl apply -f pod.yaml

## Connect to the Busybox

    kubectl exec mybox -it -- /bin/sh

## Create a file

    ls
    cd azurefiles
    cat > hello.txt
    Hello World
    Enter and Ctrl-D
    ls
    exit

## Delete and create the Pod again

    kubectl delete -f pod.yaml --grace-period=0 --force
    kubectl apply -f pod.yaml

## Connect to the Busybox

    kubectl exec mybox -it -- /bin/sh
    cd azurefiles
    ls
    cat hello.txt
    exit

## Cleanup

    kubectl delete -f pod.yaml --grace-period=0 --force
    kubectl delete -f pvc.yaml
    kubectl delete -f sc.yaml

