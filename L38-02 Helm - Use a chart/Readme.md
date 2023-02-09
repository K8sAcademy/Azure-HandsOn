# Using an Helm chart

## If not already installed, install Helm

Windows

    choco install kubernetes-helm

Mac

    brew install helm

Linux

Check the documentation

    https://helm.sh/docs/intro/install/

## Add the repo

    helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

Update the local cache

    helm repo update

Validate that the repos where installed

    helm repo list

## Search the repo for Nginx

    helm search repo nginx

## Display the Nginx chart

    helm show chart ingress-nginx/ingress-nginx

## Display the values

    helm show values ingress-nginx/ingress-nginx

## Pull the Nginx chart

    helm pull --untar ingress-nginx/ingress-nginx

## List available the versions

    helm search repo ingress-nginx -l

## Install the Nginx chart in your cluster

    helm install mynginx ingress-nginx/ingress-nginx --version 3.28.0

## Launch K9s to look at what’s happening

    k9s

## List the deployment

    helm ls 

## Upgrade

    helm upgrade mynginx ingress-nginx/ingress-nginx

## List the deployment again

    helm ls

## Get the deployment history

    helm history mynginx

## Rollback to the previous version

    helm rollback mynginx

## Uninstall the deployment

    helm uninstall mynginx
