# L45-AZ-03

Create a Container App using the Portal

## Basic settings

Locate the Container App service and click on Create.

Enter **ca-lab1** as the resource group.

Enter **lab1** as the Container app name.

## App settings

Uncheck the **Use quickstart image** checkbox.

Enter **web** as the name.

Select **Docker Hub** as the image source and **public** for the image type.

Enter **nginx:alpine** as the image and tag.

Leave the CPU and memory settings as is.

Enable **HTTP Ingress**.

Select **Accepting traffic from anywhere** and enter 80 as the **Target port**.

Click on the **Review + Create** button and the **Create**.

## Test

In the overview page, click on the **Application Url** link to test the app.

## Cleanup

Locate and delete the resource group.
