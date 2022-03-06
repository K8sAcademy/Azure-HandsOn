# L103-AZ-02

![Hands-On Files](https://kubernetesacademy.online/wp-content/uploads/2021/06/checked-files-50px.png)

## Terraform Cloud

Log into your Terraform account

    https://app.terraform.io/

## Terminal

In VS Code, open a terminal, log using your Terraform Cloud credentials

    terraform login

## New workspace

Create a new CLI based workspace.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/03/L103-AZ-02-01.png)

Locate the config code section

![image](https://kubernetesacademy.online/wp-content/uploads/2022/03/L103-AZ-02-02.png)

In the **main.tf** file, replacing the organization and workspace names.

Init the workspace

    terraform init

Apply to see if everything's is working

    terraform apply

Click on the **Runs tab**, you should see your first run.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/03/L103-AZ-02-03.png)

We will create a resource group and get the name, location and tag from variables set in the workspace.  Uncomment this section in the **main.tf** file.

    resource "azurerm_resource_group" "labrg" {
      name     = var.resourcegroup_name
      location = var.region
      tags = {
        environment = var.project_name
      }
    }

Let's add the variables in the Terraform Cloud workspace.

    resourcegroup_name = labrg
    region = canadacentral
    project_name = lab

![image](https://kubernetesacademy.online/wp-content/uploads/2022/03/L103-AZ-02-04.png)

## Azure Service Principal

Terraform Cloud needs to authenticate with Azure. One way is to use a Service principal.

In the terminal, get the subscription ID by typing

    az account show

Create the Service Principal and replace the **[SUBSCRIPTION_ID]** placeholder with your subscription ID.

    az ad sp create-for-rbac --name="Lab" --role="Contributor" --scopes="/subscriptions/[SUBSCRIPTION_ID]"

Copy and paste the info in the azure.txt file so we can retrieve them later.

## Add 4 sensitive variables to the workspace with their corresponding values

    subscription_id
    client_id
    client_secret
    tenant_id

## Uncomment this section in the **main.tf** file

    /*
      subscription_id = var.subscription_id
      client_id       = var.client_id
      client_secret   = var.client_secret
      tenant_id       = var.tenant_id
    */

## Save the file and validate

    terraform validate

## Deploy

    terraform apply

## Let's see what was generated

    az group list --output table

## Cleanup

Let's now delete the resource group by typing

    terraform destroy

Let's check

    az group list --output table

Delete the service principal using the appId

    az ad sp delete --id [appId]

If you lost it, use this command to retrieve it

    az ad sp list --display-name=Lab

Delete the workspace by clicking on the **Settings tab** and on the **Delete from Terraform Cloud** button.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/03/L103-AZ-02-05.png)