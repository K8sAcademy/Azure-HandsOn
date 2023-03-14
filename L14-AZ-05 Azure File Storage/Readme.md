# Azure Storage

Let’s see how we can use some external storage with Web App for Containers.

## Create a new storage account

In the portal or from the terminal create a new **storage account**.

Select **Standard** performance and **LRS** for the replication mode.

Next, create a Blob **Container** and a **File Share**.  Name them like this:

* **Blob**: myblobs
* **File Share**: myshare with a 1GB quota

## New Web App for Containers

In the Azure portal, create a new **Web App for Containers**.  See the previous labs for the complete steps.

Use the **guybarrette/kuard:latest** container.

## Configure the Environment Variables

The app listens on port 8080 so we must map that port to the one App Service is listening to.

Click on the **Configuration** menu and click on **New Application Settings**.

Name: **WEBSITES_PORT**, Value: **8080**

Click **Save**

## Mount the blob storage

We need to configure new mounts to the Blob container and File Share we created earlier.

* Click on the **Configuration** menu

* Click on the **Path Mappings** tab

* Click on **New Azure Storage Mount**

* Enter a name for your mount

* Select **Basic configuration**

* Select **Azure Blob** as the storage type

* Select your storage account

* Enter the name of the container

* Enter the mount path like this: **/myblobs/**

* Click **OK**

## Mount storage – File Share

* Click again on **New Azure Storage Mount**

* Enter a name for your mount

* Select your storage account

* Select **Advanced configuration**

* Select **Azure Files** as the storage type

* Enter the name of the share

* Enter the mount path like this: **/myshare/**

* Click **OK**

* Click **Save**

## Azure Storage Explorer

Launch the **Azure Storage Explorer** and upload one file to the Blob container and the File Share.

## Test

Launch the app and click on the **File system browser** menu.  You will see a folder list and the two folders you mapped.

## Cleanup

In the Portal, delete the resource you just created.

