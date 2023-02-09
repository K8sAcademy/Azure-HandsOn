# L45-AZ-11

Secrets

## Create a resource group

    az group create -n ca-lab11 -l eastus2

## Create an environment

    az containerapp env create -n managedEnvironment-lab11 -g ca-lab11 --location eastus2

## Create a Container App

    az containerapp create -n lab11 -g ca-lab11 --environment managedEnvironment-lab11 --image k8sacademy/kuard:latest --target-port 8080 --cpu 0.5 --memory 1.0Gi --ingress 'external' --secrets mysecret=MySecretValue --env-vars "thesecret=secretref:mysecret"

Locate the Container App URL, launch the app in a browser and try to locate the environment variable referecing the secret.

## Create a secret

    az containerapp secret set -n lab11 -g ca-lab11 --secrets mysecret2=MySecretValue2

## Create a revision

Let's reference this newly created secret.

List the revision and copy the revision name.

    az containerapp revision list  -n lab11 -g ca-lab11 -o table

Replace the revision placeholder with the one you just copied.

    az containerapp revision show  -n lab11 -g ca-lab11 --revision [revName] -o yaml > app.yaml

Edit the app.yaml file.

1-Remove the name suffix from something like this **lab11--qjfb9ty** to this: **lab11**

2-Add a new environment variable

    - env:
        - name: thesecret
        secretRef: mysecret
        value: ''
        - name: thesecret2
        secretRef: mysecret2
        value: ''

3-Change the type from this

    type: Microsoft.App/containerapps/revisions

to (remove **/revisions**)

    type: Microsoft.App/containerapps

Create the revision

    az containerapp update -n lab11 -g ca-lab11 --yaml app.yaml

## Console using the terminal

Let's open a console using the terminal.

    az containerapp exec -n lab11 -g ca-lab11 --command sh

Display the enviroment variables

    echo $thesecret
    echo $thesecret2

Use ctrl + D to exit.

## Cleanup

Delete the resource group.

    az group delete -n ca-lab11 --no-wait -y
