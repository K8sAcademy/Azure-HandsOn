# L101-AZ-19

![Hands-On Files](https://kubernetesacademy.online/wp-content/uploads/2021/06/checked-files-50px.png)

## Create a blob container

To use a backend in Azure, let's first create a resource group and a storage account using the Azure CLI. Note that the storage account name must be unique, so edit the placeholder using a few random digits.

    az group create -l eastus -n backendrg
    az storage account create -n backendsa[123] -g backendrg -l eastus --sku Standard_LRS
    az storage container create --account-name backendsa[123] --name tfstate

## Edit the main.tf file

Edit the main.tf file and replace the storage account name for the one you used.

## Let's init the backend

    terraform init

Head to the Azure portal, locate you storage account. You should see the tfstate file.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/03/L102-AZ-01-01.png)

## Cleanup

Delete the resource group

    az group delete -n backendrg