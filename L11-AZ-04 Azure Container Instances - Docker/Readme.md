# Create a serverless container

You’ll use Azure Container Instances to launch a container.

## Azure Portal

Head to the Azure Portal and add a new resource.

Type **Container Instances** to locate the service and select it.

Type a container name (no need to be unique).

Use this image: **guybarrette/kuard:latest**

Select **Linux** as the OS type and leave the size as is.

![image](readme_images/L11-AZ-03-01.png)

In the Networking step, **add TCP port 8080** and enter a **unique name** for the DNS name.

![image](readme_images/L11-AZ-03-02.png)

Click on Create.

## Test in a browser

In the service’s overview section, locate the URL and copy/paste it in a browser.  Don’t forget that the container is listening on port **8080**.

You should see something like this:

![image](readme_images/L11-AZ-03-03.png)

## Cleanup

In the Portal, delete the resource you just created.

