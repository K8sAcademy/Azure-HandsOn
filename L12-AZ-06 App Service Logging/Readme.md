# L12-AZ-06

Let’s test Web App for Containers by using a simple Nginx Web server image.

## Azure Portal

Head to the Azure Portal and Add anew resource: **Web App for Containers**.

Select **Docker Containers** and **Linux** as the OS.

Select your App Service Plan.  You can use **B1** for this lab.

Click the **Next: Docker** button to set the container settings.

Select **Single Container** and **Docker Hub**.

Type **nginx** as the image name.

You can now click on the **Create** button.

## Test in a browser

Once created, click on the overview page and locate the app’s URL.  Click the URL to launch a browser window.

## Look at the startup logs

If your container does not start, this is very useful for troubleshooting.

Click on the **Deployment Center menu** and locate the logs.

## Enable App Service Logs

Enable the App Service logs.

Click on the **App Service Logs menu** and enable the logs.

You can also enable them using the CLI.

    az webapp log config --name <app-name> --resource-group <resourceGroup> --docker-container-logging filesystem

## Stream the logs

Let’s take a look at the logs.  

Click on the **Log Stream menu**. **Refresh** the page displaying the Web app (not the portal). You should see the log entries created by Nginx.  Note that this can take a minute or two.

You can stream the logs in a terminal.

    az webapp log tail --name <app-name> --resource-group <resourceGroup>

## Using the Advanced Tools

Let’s use the Advanced Tools to look at the logs.  

Click on the **Advanced Tools menu**. This will open a page in a new tab.

Click on the **Bash menu** and locate the log files.

    ls
    cd LogFiles
    ls

You can also stream the logs by clicking on the **Log Stream menu**

## Cleanup

In the Portal, delete the resource you just created.