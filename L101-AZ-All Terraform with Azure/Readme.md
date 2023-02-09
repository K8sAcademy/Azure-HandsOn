# L101-AZ-03 Providers

Note: All the L101-AZ-[*] labs are part of a sequence and build upon each other.

## Create a new Terraform file

Create a new folder.

Create a new file and name it **main.tf**

## Find the Azure provider settings

Head to https://registry.terraform.io

Locate the Azure provider and click on the **Use Provider** button.

Copy the code and paste it in the main.tf file.

## Edit the code

Replace this line

    # Configuration options

With this

    features {}

Save the file

## Init the folder

    terraform init

You should see some new files and folders being created in the working folder.

## Cleanup

Don't delete the files yet. Keep them for the next lab.

---

# L101-AZ-05 Validate/Format

Note: All the L101-AZ-[*] labs are part of a sequence and build upon each other.

## Let's try the fmt command

Change the position of these two lines a little bit so that they are no longer aligned. Note that the version number can differ, that's OK. Save the file.

    source  = "hashicorp/azurerm"
    version = "2.96.0"

Run the fmt command

    terraform fmt

The lines should be aligned correctly now.

## Let's validate

Run the validate command

    terraform validate

All is good.  Let's change this line

    source  = "hashicorp/azurerm"

to this by changing the source parameter to **sources**. Save the file.

    sources  = "hashicorp/azurerm"

Run validate again

    terraform validate

There's an error now.  Remove the extra character and save the file.

## Create a resource group

Add the following code to create a resource group. You can change the location parameter to a data center closer to you.

    resource "azurerm_resource_group" "labrg" {
      name     = "labrg"
      location = "Canada Central"
    }

Run the validate command

    terraform validate

All is good.  Remove this mandatory parameter. Save the file.

    name     = "labrg"

Run the validate command

    terraform validate

There's an error!  Replace the name parameter, save the file and validate again.

## Cleanup

Don't delete the files yet. Keep them for the next lab.

---

# L101-AZ-07 Plan

**Note: All the L101-AZ-[*] labs are part of a sequence and build upon each other.**

## Let's create a plan

Run the plan command

    terraform plan

Save a plan by typing

    terraform plan -out=myplan

The plan has been saved to the **myplan** file.

## Cleanup

Don't delete the files yet. Keep them for the next lab.

---

# L101-AZ-09 Apply

**Note: All the L101-AZ-[*] labs are part of a sequence and build upon each other.**

## Let's create the resource group

    terraform apply

Head to the portal and validate that the resource group was created or check using the CLI

    az group list --output table

Let's make a change by adding a tag. Add this to the resource group definition in main.tf

    tags = {
      environment = "Terraform Demo"
    }

Format and validate

    terraform fmt
    terraform validate

Check what will Terraform do

    terraform plan

The resource will be updated, not replaced. Good! Let's deploy the change.

    terraform apply

Check that the tag was correctly applied

    az group list --output table

Let's now try to change the name of the resource group. Edit main.tf and change this line

    name     = "labrg"

to

    name     = "labrg2"

Save the file and create a plan

    terraform plan

The resource group will be deleted and replaced with a new one.

    terraform apply

Let's check

    az group list --output table

List the objects in the Terraform state

    terraform state list

There's only one and it's the resource group.  Copy it's name and show it.

    terraform state show [name]

Inspect the state file by clicking on the terraform.state file.

Let's now delete the resource group by typing

    terraform destroy

Let's check

    az group list --output table

## Cleanup

Don't delete the files yet. Keep them for the next lab.

---

# L101-AZ-11 Variables

**Note: All the L101-AZ-[*] labs are part of a sequence and build upon each other.**

## Let's now use variables

Edit the main.tf file by creating a local variable for the resource group name.

    locals {
      rg_name = "labrg"
    }

Now get the name from the variable

    name     = local.rg_name

## Create 2 new files: **variables.tf** and **terraform.tfvars**

Edit the **variables.tf** file to declare 2 variables. Note that project_name does not have a default value.

    variable "project_name" {
      type = string
      description = "The name of the project"
    }
    
    variable "region" {
      type = string
      default = "Canada Central"
      description = "Azure region"
    }

## Edit the **terraform.tfvars** file 

Add these values

    project_name = "My awesome project"
    region = "eastus"

## Edit the **main.tf** file 

Use the newly created variables

    resource "azurerm_resource_group" "labrg" {
      name     = local.rg_name
      location = var.region
      tags = {
        environment = var.project_name
      }
    }

## Let's validate, plan and deploy

The plan outpout should display the values we used as variables

    terraform validate
    terraform plan

Deploy

    terraform apply

Let's check

    az group list --output table

Let's now delete the resource group by typing

    terraform destroy

Let's check

    az group list --output table

Let's try to override the region on the command line. The plan should display that value.

    terraform plan -var="region=westus"

## Cleanup

Don't delete the files yet. Keep them for the next lab.

---

# L101-AZ-13 Workspaces

**Note: All the L101-AZ-[*] labs are part of a sequence and build upon each other.**

Do we have a workspace already?

    terraform workspace list

Of course, it's the default one.

Let's deploy a resource group

    terraform apply
    terraform state list
    terraform state show []

## New workspace

Let's create a new workspace

    terraform workspace new dev
    terraform workspace list

Change the resource group name to something different, and deploy

    rg_name = "demorg"
    terraform apply

Check the state file

    terraform state list
    terraform state show []

Let's destroy this resource group

    terraform destroy

## Switch back to the default workspace

    terraform workspace select default

But we still share the main.tf file between all workspaces!

Change the name back and delete the dev workspace.

    rg_name = "labrg"
    terraform workspace delete dev
    terraform workspace list
    terraform destroy

## Cleanup

Don't delete the files yet. Keep them for the next lab.

---

# L101-AZ-15 Modules

**Note: All the L101-AZ-[*] labs are part of a sequence and build upon each other.**

## The Naming module

Let's use a module from the Terraform registry. It's a module that helps with the naming or resources and we'll use it to generate a unique name for our resource group.  You can look at the documentation here: https://registry.terraform.io/modules/Azure/naming/azurerm/latest

In the **main.tf** file, add the module using the following code. We'll prefix the generated names with the **lab** string.

    module "naming" {
      source  = "Azure/naming/azurerm"
      prefix = [ "lab" ]
    }

Next, replace the resource group name parameter line with this one:

    name     = module.naming.resource_group.name_unique

Save the file and let's create a plan.  We have an error!  We first need to run init to download the module.

    terraform init
    terraform plan
    terraform apply

Let's see what was generated

    az group list --output table

Let's now delete the resource group by typing

    terraform destroy

Let's check

    az group list --output table

## Cleanup

Don't delete the files yet. Keep them for the next lab.

---

# L101-AZ-16 Output variables

**Note: All the L101-AZ-[*] labs are part of a sequence and build upon each other.**

## Create a new file

Create a new file named **output.tf**

## Edit the **output.tf** file

Add the following output variables

    output "rg_name" {
      value = azurerm_resource_group.labrg.name
    }

    output "rg_location" {
      value = azurerm_resource_group.labrg.location
    }

    output "rg_tags" {
      value = azurerm_resource_group.labrg.tags
    }

## Validate and deploy

    terraform validate
    terraform apply

You should see the output values

## Destroy

Let's now delete the resource group by typing

    terraform destroy

Let's check

    az group list --output table

## Cleanup

Delete the **output.tf** file. Keep the rest for the next lab.

---

# L101-AZ-17 HCL Language

**Note: All the L101-AZ-[*] labs are part of a sequence and build upon each other.**

Let's create 3 resource groups by using a for_each loop.

Edit the resource group module in the **main.tf** file and use a for_each to generate 3 resource groups.  Set the name to the for key.

    for_each = toset( ["demo1", "demo2", "demo3"] )
    name = each.key

Generate a plan and deploy

    terraform plan
    terraform apply

Let's see what was generated

    az group list --output table

Let's now delete the resource group by typing

    terraform destroy

Let's check

    az group list --output table

## Cleanup

You can delete the files.