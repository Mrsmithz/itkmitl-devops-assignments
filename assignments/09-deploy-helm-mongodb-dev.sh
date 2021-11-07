#!/bin/bash
kubectl create secret generic bookinfo-dev-ratings-mongodb-secret --from-literal=mongodb-password=123456 --from-literal=mongodb-root-password=123456
kubectl create configmap bookinfo-dev-ratings-mongodb-initdb --from-file ~/app/ratings/databases/ratings_data.json --from-file ~/app/ratings/databases/script.sh
helm install -f ~/app/ratings/k8s/helm-values/values-bookinfo-dev-ratings-mongodb.yaml bookinfo-dev-ratings-mongodb bitnami/mongodb --version 10.28.4