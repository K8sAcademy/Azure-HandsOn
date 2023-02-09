# Monitoring

## Configure Kubernetes RBAC authorization

The clusterUser user needs to be granted access to the end points in Kubernetes API.

    kubectl apply -f monitoring.yaml

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

## Monitor

In the **Azure Portal** and in your cluster’s blade, select **Insights**.

Click on **Cluster** tab and look at the data.

Click on **Nodes** tab and look at the data.  Looks like our deployment has some issues.

Click on **Containers** tab and look at the data.  Identify the pod that reach 100% CPU and in the right section, view the logs.

The page will switch to the **Logs page**.  From there you can identy the issue.

## Delete the autoscaler

    kubectl delete hpa hpa-deployment

## Cleanup

    kubectl delete -f deploy-lb.yaml

or

    kubectl delete -f deploy-clusterIP.yaml

