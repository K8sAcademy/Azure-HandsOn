# L45-AZ-09

Logging and monitoring

## Create a resource group

    az group create -n ca-lab9 -l eastus2

## Create an environment

    az containerapp env create -n managedEnvironment-lab9 -g ca-lab9 --location eastus2

## Create a Container App

    az containerapp create -n lab9 -g ca-lab9 --environment managedEnvironment-lab9 --image nginx:alpine --target-port 80 --cpu 0.5 --memory 1.0Gi --ingress 'external'

In the output of the create, locate the **fqdn** field to get the link to test the app.

## Console using the Portal

Let's open a console using the Portal.

Locate the container app and select **Console** from the left menu.

Select **/bin/sh** as the start up command and click on **Connect**.

## Console using the terminal

Let's open a console using the terminal.

    az containerapp exec -n lab9 -g ca-lab9 --command sh

Use ctrl + D to exit.

## Log stream using the Portal

Let's stream the logs using the Portal.

Locate the container app and select **Log stream** from the left menu.

Open a browser and refresh the page a few times to see new log entries appearing.

## Log stream using the terminal

Let's open a console using the terminal.

    az containerapp logs show -n lab9 -g ca-lab9 --follow 

Use ctrl + C to exit.

## Metrics

Let's take a look at the metrics. Click on **Metrics** in the left menu.

Select Replica Count in the Metrics dropdown. The graph will display the replica count.

Try other metrics like **Requests** ot **Network Out Bytes**.

## Logs Analytics

Let's analyse the logs. Click on **Logs** in the left menu and dismiss the popup window.

Enter the following kusto query and click **Run**.

    ContainerAppConsoleLogs_CL
    | where ContainerAppName_s == 'lab9'
    | project Time=TimeGenerated, AppName=ContainerAppName_s, Revision=RevisionName_s, Container=ContainerName_s, Message=Log_s
    | take 100

The last 100 logs entries will be displayed. Click on the arrow left to one of a log entry to see it's details.

## Logs Analytics using the terminal

Let's retrieve the system logs using the terminal. These are different from the application logs.

To run the command, you'll need to provide the Logs Analytics workspace ID. Locate the workspace from the resource group where the Container App was created, copy the Workspace ID and replace the placeholder in the next command.

    az monitor log-analytics query --workspace [workspaceID] --analytics-query "ContainerAppSystemLogs_CL | where ContainerAppName_s == 'lab9' | project Time=TimeGenerated, AppName=ContainerAppName_s, Message=Log_s | take 10" --out table

## Cleanup

Delete the resource group.

    az group delete -n ca-lab9 --no-wait -y
