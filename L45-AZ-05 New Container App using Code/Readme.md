# L45-AZ-05

Create a Container App using VS Code

## Create the environment

In the left menu, click on the **Azure extension** icon. Locate the **ContainerApps** section, **right-click** on your subscription and select **Create Container Apps Environment**.

Enter **ca-env-lab3** as the environment name and select a region. The environment will be created.

In the Container Apps section, click on the **refresh icon** to see the newly created environment.

## Create the container app

Right-click on the environment and select **Create Container App**.

Enter **lab3** as the Container app name.

Select **Docker Hub Registry**.

Enter **k8sacademy** as the Docker Hub namespace.

Select **hello-app** as the repository.

Select the **1.0** tag.

Skip the environment variables.

**Enable** the Ingress and select **External**.

Enter **8080** for the port number.

## Test

In the Container Apps section, right-click on the container app you just created and select **Browse**.

## Cleanup

While you can right-click on the Container App Environment to delete it, this won't delete the Log Analytics workspace and the resource group. Head to the Portal, locate and delete the resource group.
