# L102-AZ-02

## Create a new AKS

We'll use the azurerm_kubernetes_cluster resource from the Azure prodider. The documentation is available here:
https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster

## Initialize

    terraform init

## Let's test the plan

    terraform validate
    terraform plan

## Let's create the cluster

    terraform apply

Head to the Azure portal and validate the cluster creation.

## Cleanup

    terraform destroy
