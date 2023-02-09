# Push an image to Azure Container Registry

## Create an Azure Container Registry

    az group create -l <location> -n <mygroup>
    az acr create --resource-group <mygroup> --name <myregistry> --sku Basic


## Azure Portal

Head to the Azure Portal to confirm that the registry was created

## Build the image

    docker build -t <myregistry>.azurecr.io/expressapp:v1 .

## Push the image

    docker push <myregistry>.azurecr.io/expressapp:v1

This will fail if you haven't logged in first.  Log in and try again.

    az acr login --name <myregistry>

## List the images in your ACR

    az acr repository list --name <myregistry> --output table

## Azure Portal

Back in the portal, locate the image you just pushed.

## Pull the image from ACR

Remove the local image first

    docker rmi <myregistry>.azurecr.io/expressapp:v1

Then pull it

    docker pull <myregistry>.azurecr.io/expressapp:v1

## Run

    docker run -d -p 3000:3000 --name myapp-1 <myregistry>.azurecr.io/expressapp:v1

## Test in a browser

Test that the app is running by heading to http://localhost:3000

---

## Create version 2

Let’s first make a change to the code, build a new image and tag it as version 2 and push it to ACR.

## Code change

In code, locate the index.js file in the routes folder. Change the title value from Express to **Express2**. Save the file.

![image](readme_images/L10-AZ-05-01.png)

## Build the image

    docker build -t <myregistry>.azurecr.io/expressapp:v2 .

## Push the image

    docker push <myregistry>.azurecr.io/expressapp:v2

## List the images in your ACR

    az acr repository list --name <myregistry> --output table

## Pull the image

Remove the local image first

    docker rmi <myregistry>.azurecr.io/expressapp:v2

Then pull it

    docker pull <myregistry>.azurecr.io/expressapp:v2

## Run

    docker run -d -p 3001:3000 --name myapp-2 <myregistry>.azurecr.io/expressapp:v2

## Test in a browser

Test that the app is running by heading to http://localhost:3001

## Cleanup

    docker stop myapp-1
    docker rm myapp-1
    docker stop myapp-2
    docker rm myapp-2
    docker rmi <myregistry>.azurecr.io/expressapp:v1
    docker rmi <myregistry>.azurecr.io/expressapp:v2

## Delete the Azure Container Registry

    az acr delete --resource-group <mygroup> --name <myregistry>


