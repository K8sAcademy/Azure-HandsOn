# Installing Prometheus and Grafana on AKS

Let's deploy Prometheus and Grafana using the Helm chart provided here:

    https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack

## Update Helm

    helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
    helm repo update

## Install Prometheus stack

Install Prometheus in the **monitoring namespace**.

    kubectl create namespace monitoring

    helm install prometheus prometheus-community/kube-prometheus-stack -n monitoring

## Validate that all pods the monitoring pods are running

    kubectl -n monitoring get pods     

## Create the deployment using a load balancer

    kubectl apply -f deploy-lb.yaml

Get the load balancer public IP address

    kubectl get svc --watch

## Or create the deployment using a ClusterIP

    kubectl apply -f deploy-clusterIP.yaml

Port-forward

    kubectl port-forward service/hpa-svc 8080:8080   

## Set the autoscaling limits

    kubectl autoscale deployment hpa-deployment --cpu-percent=25 --min=1 --max=20

## Launch a browser

Launch the Kuard Web app using the IP address you got earlier.

Click on Keygen Workload, check the Enabled checkbox and click on Submit.

## View the Prometheus dashboard

    kubectl -n monitoring port-forward prometheus-prometheus-kube-prometheus-prometheus-0 9090

## View the Grafana dashboard

    kubectl --namespace monitoring port-forward $(kubectl get pods --namespace monitoring -l "app.kubernetes.io/name=grafana" -o jsonpath="{.items[0].metadata.name}") 8080:3000

Username: admin
Password: prom-operator

## Open a Grafana dashboard

Click on the **dashboard icon** and select **Manage**.

Select **Nodes**.

You should see some metrics for the nodes.

## Delete the autoscaler

    kubectl delete hpa hpa-deployment

## Cleanup

    kubectl delete -f deploy-clusterip.yaml

or

    kubectl delete -f deploy-lb.yaml

## Uninstall Prometheus

NOTE: the next lab uses Grafana.  If you plan to complete that lab, do not uninstall Prometheus at this moment.

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

