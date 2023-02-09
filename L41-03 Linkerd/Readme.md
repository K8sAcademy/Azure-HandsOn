# Using the Linkerd service mesh

## Validate that Linkerd can be installed on the cluster

    linkerd check --pre

## Install the control plane into the 'linkerd' namespace

    linkerd install | kubectl apply -f -
    linkerd viz install | kubectl apply -f -

## Validate that everything worked

    linkerd check
    kubectl get svc -n linkerd -o wide
    kubectl get pod -n linkerd -o wide

## Deploy the app

    kubectl apply -f emojivoto.yml 

## Port-forward to the web-svc

    kubectl port-forward svc/web-svc -n emojivoto 8080:80

Launch a browser and test the app

## Launch the linkerd dashboard

    linkerd viz dashboard

Notice that the emojivoto app is “meshed” because we used an annotation in the app namespace.

## Injecting Linkerd into an app

Let's say that you need to mesh an application already deployed, you would use this (don't run the command because emojivoto is already meshed!):

    kubectl get -n emojivoto deploy -o yaml | linkerd inject - | kubectl apply -f -

## Grafana

Click on the **Grafana icon** to the right of the Web deployment to launch a Grafana dashboard.

## Investigate!

A load generator is calling our app and there's an error.  Use the Linkerd dashboard to find the source of the error.

## Cleanup

Don't delete these if you plan to do the next lab.

    kubectl delete ns emojivoto
    linkerd viz uninstall | kubectl delete -f -
    linkerd uninstall | kubectl delete -f -

