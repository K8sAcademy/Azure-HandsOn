# L12-AZ-03

Let’s test Web App for Containers by using a simple Nginx Web server image.

## Azure Portal

Head to the Azure Portal and Add anew resource: **Web App for Containers**.

Select **Docker Containers** and **Linux** as the OS.

Select your App Service Plan.  To save on costs, you can use **B1** for this lab.

Click the **Docker** tab to set the container settings.

Select **Single Container** and **Docker Hub**.

Type **nginx** as the image name.

You can now click on the **Create** button.

## Test in a browser

Once created, click on the overview page and locate the app’s URL.  Click the URL to launch a browser window.

## Cleanup

In the Portal, delete the resource you just created.