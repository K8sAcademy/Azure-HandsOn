# App Service Persistent Storage

Let’s see how we can use the storage included with Web App for Containers.

## New Web App for Containers

In the Azure portal, create a new **Web App for Containers**.  See the previous labs for the complete steps.

Use **Docker Compose** and upload the **docker-compose.yaml** file.

## Configure the Environment Variables

App Service Storage must be enabled.

Click on the **Configuration** menu and edit the **WEBSITES_ENABLE_APP_SERVICE_STORAGE** variable.  Set it to **true**.

Click **Save**

## Test

Launch the app on port 80 and click on the **File system browser** menu.  You will see a folder list and the **azurepersistentstorage folder**.

## Cleanup

In the Portal, delete the resource you just created.

