# L45-AZ-15

# Temporary Storage

## Create a resource group

    az group create -n ca-lab15 -l eastus2

Locate the subscription ID in the JSON returned by the command and copy it.

## Edit the tempstorage.yaml file

Open the tempstorage.yaml file and locate the **<SUBSCRIPTION_ID>** placeholder. Replace it with your subscription ID and save the file.

## Create an environment

    az containerapp env create -n managedEnvironment-lab15 -g ca-lab15 --location eastus2

## Create a Container App

    az containerapp create -n lab15 -g ca-lab15 --environment managedEnvironment-lab15 --yaml "tempstorage.yaml"

## Test

Open the app in a browser and click on **File system browser** in the left menu of the Kuard app. You should see the mapped folder.

Head to the portal. Locate the container app and click **Console** in the left menu. Select the container and **/bin/sh** as the startup command. Type **ls** list the folders.

Create a file

    cd myempty
    echo WORLD! > hello.txt

Refresh the Kuard page. You should see the file.

## Restart the revision

Get the revison's name and restart it

    az containerapp revision list -n lab15 -g ca-lab15 -o table
    az containerapp revision restart -n lab15 -g ca-lab15 --revision [name]

Check if the file that you created earlier is still there.

## Delete the app

    az containerapp delete -n lab15 -g ca-lab15

---

# Azure Files

Create the storage account

    az storage account create -n lab15[your initials] -g ca-lab15 -l eastus2 --sku Standard_LRS

Create the File Share

    az storage share create --account-name lab15[your initials] --name myfileshare

Get the storage account key

    az storage account keys list -n lab15[your initials] -g ca-lab15 --query '[0].value' --out tsv

## Configure

In the following command, replace the **<STORAGE_ACCOUNT_NAME>** placeholder with the storage account name.

Replace the **<STORAGE_ACCOUNT_KEY>** placeholder with the storage account name.

    az containerapp env storage set --name managedEnvironment-lab15 -g ca-lab15 --storage-name mystorage --azure-file-account-name <STORAGE_ACCOUNT_NAME> --azure-file-account-key <STORAGE_ACCOUNT_KEY> --azure-file-share-name myfileshare --access-mode ReadWrite


## Create a Container App

Open the filestorage.yaml file and replace the **<SUBSCRIPTION_ID>** placeholder with your subscription ID.

Create the app.

    az containerapp create -n lab15 -g ca-lab15 --environment managedEnvironment-lab15 --yaml "filestorage.yaml"

## Test

Open the app in a browser and click on **File system browser** in the left menu of the Kuard app. You should see the mapped folder.

Head to the portal. Locate the storage account and upload a file to the File Share. Refresh the Kuard page. You should see the file listed.

## Cleanup

Delete the resource group.

    az group delete -n ca-lab15 --no-wait -y
