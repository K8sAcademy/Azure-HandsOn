# Using the Linkerd CLI

If not already installed, go back to the previous lab and install Linkerd and the Emojivoto app.

## Launch a Linkerd dashboard

    linkerd viz dashboard

## Get the metrics for all the deployments in the emojivoto namespace

    linkerd viz stat deploy -n emojivoto -o wide

Narrow traffic from the web deployment to the emoji deployment

    linkerd viz stat -n emojivoto deploy/web --to deploy/emoji
    linkerd viz stat -n emojivoto deploy/web --to deploy/voting

To all deployments that to the web deployment

    linkerd viz stat -n emojivoto deploy --from deploy/web

## View traffic sorted by the most popular paths

    linkerd viz top deploy -n emojivoto
    linkerd viz top deploy/web -n emojivoto

## Show all the traffic from the web deployment

    linkerd viz tap deploy/web -n emojivoto

## Show all the traffic from the web deployment to the voting deployment

    linkerd viz tap deploy/web -n emojivoto --to deployment/voting

To the /emojivoto.v1.VotingService/VoteDoughnut path of the voting deployment

    linkerd viz tap deploy/web -n emojivoto --to deployment/voting --path /emojivoto.v1.VotingService/VoteDoughnut

## Connections between objects

    linkerd viz edges po -n emojivoto
    linkerd viz edges deploy -n emojivoto

## Show the metrics per-service (no service profile defined yet)

    linkerd viz routes deploy/web  -n emojivoto

Generate the service profiles and save the YAML files

    linkerd profile -n emojivoto --proto Voting.proto voting-svc  > vote-sp.yml
    linkerd profile web-svc --tap deploy/web --tap-duration 10s -n emojivoto > web-sp.yml
    linkerd profile emoji-svc --tap deploy/emoji --tap-duration 10s -n emojivoto  > emoji-sp.yml

    kubectl apply -f vote-sp.yml
    kubectl apply -f web-sp.yml
    kubectl apply -f emoji-sp.yml

OR

    linkerd profile -n emojivoto --proto Voting.proto voting-svc | kubectl apply -f -
    linkerd profile web-svc --tap deploy/web --tap-duration 10s -n emojivoto | kubectl apply -f -
    linkerd profile emoji-svc --tap deploy/emoji --tap-duration 10s -n emojivoto | kubectl apply -f -

Linkerd's service profile has enabled us to see that the /api/list route is successful 100% of the time, but the /api/vote route has some errors.

    linkerd viz routes deploy/web -n emojivoto
    linkerd viz routes deploy/voting -n emojivoto

# Traffic Split

Deploy the updated version of the web service

    kubectl apply -f web-svc-2.yml

List the Pod and service

    kubectl get po --selector app=web-svc-2 -n emojivoto
    kubectl get svc web-svc-2  -n emojivoto

View the page

    kubectl port-forward svc/web-svc-2  -n emojivoto 8080:80

Create is the apex service

    kubectl apply -f web-apex.yml

    kubectl get ep -n emojivoto

let's look at the stats for the services. there are no pods currently backing this service
linkerd stat po -n emojivoto

Create the traffic split

    kubectl apply -f web-svc-ts.yml

Check it

    linkerd viz stat ts -n emojivoto

Update the vote-bot deployment to send traffic to the web-apex service, rather than web-svc.

    kubectl apply -f vote-bot-update.yml

Check it again

    linkerd viz stat ts -n emojivoto
    linkerd viz stat po -n emojivoto

Change the traffic split

    kubectl apply -f 75-25.yml
    linkerd viz stat ts -n emojivoto
    kubectl apply -f 100-0.yml
    linkerd viz stat ts -n emojivoto

## Cleanup

    kubectl delete ns emojivoto
    linkerd viz uninstall | kubectl delete -f -
    linkerd uninstall | kubectl delete -f -

