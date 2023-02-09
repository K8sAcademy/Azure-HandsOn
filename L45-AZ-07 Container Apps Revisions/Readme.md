# L45-AZ-07

Create a Container App revision using the CLI

## Create a resource group

    az group create -n ca-lab7 -l eastus2

## Create an environment

    az containerapp env create -n managedEnvironment-lab7 -g ca-lab7 --location eastus2

## Create a Container App

    az containerapp create -n lab7 -g ca-lab7 --environment managedEnvironment-lab7 --image k8sacademy/hello-app:1.0 --target-port 8080 --cpu 0.5 --memory 1.0Gi --ingress 'external' --revision-suffix 'v1'

In the output of the create, locate the **fqdn** field to get the link to test the app.

## List the revisions

    az containerapp revision list -n lab7 -g ca-lab7 -o table

## Deploy an update

    az containerapp update -n lab7 -g ca-lab7 --image k8sacademy/hello-app:2.0 --revision-suffix 'v2'

    az containerapp revision list -n lab7 -g ca-lab7 -o table

In the output of the create, locate the **fqdn** field to get the link to test the app.

## Set the revision mode to Multiple

    az containerapp revision set-mode --mode multiple -n lab7 -g ca-lab7 

List again adding the --all flag

    az containerapp revision list -n lab7 -g ca-lab7 --all -o table

Open the Portal and look at the revisions.

## Let's try to reach the inactive revision

What's it's URL?

    az containerapp revision show -n lab7 -g ca-lab7 --revision lab7--v1

Try to reach it in a browser. Does it work?  No because it is inactive.

## Activate the V1 revision

    az containerapp revision activate -n lab7 -g ca-lab7 --revision lab7--v1

You should be able to reach it now.

## Traffic split

Let's try to split the traffic between both revisions. Head to the Portal and split the traffic **50-50** between both revisions. Click **Save**.

Locate the app URL (not the revision ones) and refresh the browser page a few times.

## Cleanup

Delete the resource group.

    az group delete -n ca-lab7 --no-wait -y
