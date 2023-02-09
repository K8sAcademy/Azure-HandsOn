# Connect Grafana to Azure Monitor

**REQUIREMENT:** Go thru the previous lab to install Prometheus and Grafana in AKS.

## Create a service principal

We need to create a service principal that Grafana will use to access Azure Monitor.

* In the Azure Portal, locate you **Azure AD**.

* Click on **App Registrations** and click on **New Registation**.

Enter **grafana** as the name.  Select **Accounts** in this org.  Enter http://localhost:3000 as the **Web URL**.

## Select your Subscription

In the **portal search box**, type **subscriptions** and select subscriptions.  Select your subscription from the list.

## Add Role Assignments

Select the **Access Control** menu and **Add a role assignment**.

Add the **Reader role** to the Grafana account

Next, add the **Log Analytics Reader role**.

Go back to your **Azure AD**, click on **App Registrations** and locate the one you created earlier.

Copy and paste the **Application ID** and **Directory ID** values in the PasteValuesHere.txt file.

## Create a secret

Click on the **Certificates & secrets** menu.

Click on **New client secret**

Enter **grafana** as the name.  Once created, copy the value.  NOTE THAT IT’S THE ONLY CHANCE YOU HAVE.

Paste the value in the PasteValuesHere.txt file.

## View the Grafana dashboard

    kubectl --namespace monitoring port-forward $(kubectl get pods --namespace monitoring -l "app.kubernetes.io/name=grafana" -o jsonpath="{.items[0].metadata.name}") 3000

Username: admin
Password: prom-operator

## Configure Grafana

Add a new Data Source

Select the Azure Monitor plugin

Copy and paste the **Directory ID**, the **Application ID** and the **secret**.

Click on **Load Subscription**.

Select your subscription from the dropdown.

In the **Logs Analytics** section, click **Load Workspace**.

Click **Save & Test**.

## Import the Azure Monitor dashboard

Click on the **+** icon and select **Import**.

Enter **10956** as the dashboard value and click **Load**.

Select **Azure Monitor** from the dropdown and click **Import**.

The dashboard is now available.

## Create the deployment using a load balancer

    kubectl apply -f deploy-lb.yaml

Get the load balancer public IP address

    kubectl get svc --watch

## Or create the deployment using a ClusterIP

    kubectl apply -f deploy-clusterIP.yaml

Port-forward

    kubectl port-forward service/hpa-svc 8080:8080 

## Set the autoscaling limits

    kubectl autoscale deployment hpa-deployment --cpu-percent=50 --min=1 --max=10

## Launch a browser

Launch the Kuard Web app using the IP address you got earlier.

Click on Keygen Workload, check the Enabled checkbox and click on Submit.

## Delete the autoscaler

    kubectl delete hpa hpa-deployment

## Cleanup

    kubectl delete -f deploy-lb.yaml

## Uninstall Prometheus

Delete Prometheus

    helm uninstall prometheus -n monitoring

The CRDs are not deleted by the Helm chart.  Delete them manually.

    kubectl delete crd alertmanagerconfigs.monitoring.coreos.com
    kubectl delete crd alertmanagers.monitoring.coreos.com
    kubectl delete crd podmonitors.monitoring.coreos.com
    kubectl delete crd probes.monitoring.coreos.com
    kubectl delete crd prometheuses.monitoring.coreos.com
    kubectl delete crd prometheusrules.monitoring.coreos.com
    kubectl delete crd servicemonitors.monitoring.coreos.com
    kubectl delete crd thanosrulers.monitoring.coreos.com
