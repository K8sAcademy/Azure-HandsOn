# L45-AZ-13

Scaling

## Create a resource group

    az group create -n ca-lab13 -l eastus2

## Create an environment

    az containerapp env create -n managedEnvironment-lab13 -g ca-lab13 --location eastus2

## Create a Container App

    az containerapp create -n lab13 -g ca-lab13 --environment managedEnvironment-lab13 --image nginx:alpine --target-port 80 --cpu 0.5 --memory 1.0Gi --ingress 'external'

## Enable scaling

Head to the portal. Locate the container app and click **Scale** in the left menu, then click on the **Edit and deploy** link.

Click on the **Scale tab**. You can see that by default, the app scales from zero to 10 instances.

Add a scale rule. Enter a name and select **HTTP scaling** from the type dropdown. Set the **Concurrent Requests** value to 10 and click **Add**. Click on **Create**.

## Load test using Bombardier

Head to https://github.com/codesenberg/bombardier/releases and download Bombardier for your OS. On Windows, you can install it using Chocolatey.

    choco install bombardier -y

On Linux

    sudo apt-get install -y bombardier

Copy the Container App URL and replace the placeholder in the following command. Run the command in a terminal. Bombardier will run up to 200 simulaneous requests for 60 seconds.

    bombardier -c 200 -d 60s [url]

In the Portal, click on Metrics in the left menu. Select the replica count. You should see it jump from 0 to the max number that you set and then down after a moment.

## Cleanup

Delete the resource group.

    az group delete -n ca-lab13 --no-wait -y
