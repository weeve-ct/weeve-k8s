#!/bin/sh

K8_FOLDER=./kubernetes
K8_SECRETS=./secrets

case "$1" in
  create)
    kubectl apply \
      -f $K8_FOLDER/deploy-api.yaml \
      -f $K8_FOLDER/deploy-db.yaml \
      -f $K8_FOLDER/deploy-ui.yaml \
      -f $K8_FOLDER/svc-nodeport-api.yaml \
      -f $K8_FOLDER/svc-nodeport-ui.yaml \
      -f $K8_FOLDER/svc-clusterip-db.yaml \
      -f $K8_FOLDER/ingress.yaml
      ;;

  delete)
    kubectl delete \
      -f $K8_FOLDER/deploy-api.yaml \
      -f $K8_FOLDER/deploy-db.yaml \
      -f $K8_FOLDER/deploy-ui.yaml \
      -f $K8_FOLDER/svc-nodeport-api.yaml \
      -f $K8_FOLDER/svc-nodeport-ui.yaml \
      -f $K8_FOLDER/svc-clusterip-db.yaml \
      -f $K8_FOLDER/ingress.yaml
      ;;

  secrets)
    kubectl delete secret weeve-flask-config
    kubectl create secret generic weeve-flask-config \
      --from-file=$K8_SECRETS/weeve-flask-config.yaml
    ;;

  *)
    echo "Usage: "$1" {create|delete|secrets}"
    exit 1

esac

exit 0
