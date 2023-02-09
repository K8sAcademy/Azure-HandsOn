# Azure Disks

## Validate that the default StorageClass are available

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
    cd azuredisk
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
    cd azuredisk
    ls
    cat hello.txt
    exit

## Cleanup

    kubectl delete -f pod.yaml --grace-period=0 --force
    kubectl delete -f pvc.yaml

