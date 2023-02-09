# Create an Helm chart

We'll create a simple chart using the default values provided by Helm.

## Create a chart

    helm create mynginx

## Edit the chart

    Edit the values.yaml file and change the service type from ClusterIP to NodePort
 
## Install the chart

    helm install mychart mynginx

## Launch K9s to look at what’s happening

    k9s

## List the deployments

    helm ls 

## See the history

    helm history mychart

## Uninstall the deployment

    helm uninstall mychart

