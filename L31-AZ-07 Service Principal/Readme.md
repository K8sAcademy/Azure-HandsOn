# Delete the service principal

## Using the Portal

* Head to the **Azure Portal**.
* Type **Active Directory** in the top search bar and select **Azure Active Directory**.
* Click on the **App Registrations menu**.
* Click on the **All Applications** tab.
* Locate the service principal that was created with your cluster and select it.
* Click on **Delete**.


## Using the CLI

Get the service principal ID

    az aks show -g <myResourceGroup> -n <clusterName> --query [servicePrincipalProfile.clientId] -o tsv

Delete the cluster by deleting the resource group

    az group delete --name <myResourceGroup> --yes --no-wait

Delete the service principal

    az ad sp delete --id <servicePrincipalID>

