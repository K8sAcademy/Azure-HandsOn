# Multiple Containers

Let’s test Web App for Containers by using a multi containers app.

## Optionally, build the Reverse Proxy and push it to a registry

    docker build -t [yourRegistry]/reverseproxy:latest .
    docker push [yourRegistry]/reverseproxy:latest

Edit the Docker-Compose file to change the location of the Reverse Proxy image.

## Test the app locally

Use docker-compose to build and run the app locally.

    docker-compose up -d

Open a browser and type http://localhost/hello

In a new browser tab, type http://localhost/bonjour

Notice that the server name is different.

---

## Azure Portal

Head to the Azure Portal and add a new resource: **Web App for Containers**.

Select **Docker Containers** and **Linux** as the OS.

Select your App Service Plan.

Click the **Next: Docker** button to set the container settings.

Select **Docker Compose** and **Docker Hub**.

Upload the **docker-compose.yml** file.

You can now click on the **Create** button.

## Test in a browser

Once created, click on the overview page and locate the app’s URL.  Click the URL to launch a browser window.

Test both routes in your browser and notice that the server names are different.

## Cleanup

In the Portal, delete the resource you just created.

