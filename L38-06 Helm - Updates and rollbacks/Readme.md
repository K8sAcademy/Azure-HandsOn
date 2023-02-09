# Create an Helm chart

We'll create a simple chart using the default values provided by Helm.

## Create a chart

    helm create mynginx

## Install the chart

    helm install mychart mynginx

## Launch K9s to look at what’s happening

    k9s

## List the deployments

    helm ls 

## Edit the chart

    Edit the values.yaml file and change the replicaCount from 1 to 3

## Change the chart version

    Edit the Chart.yaml file and change the version from 0.1.0 to 0.2.0

## Install the chart

    helm upgrade mychart .\mynginx

## List the deployments and see the history

    helm ls 
    helm history mychart

## Rollback

    helm rollback mychart 1

## See the history

    helm history mychart

## Uninstall the deployment

    helm uninstall mychart

