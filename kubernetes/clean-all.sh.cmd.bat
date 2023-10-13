::#!/bin/bash

kubectl delete deployment --all
kubectl delete rc --all
kubectl delete svc --all
kubectl delete pod --all
kubectl delete secret --all
kubectl delete pv --all
kubectl delete pvc --all
kubectl delete configmap --all

ping 127.1 -n 2

kubectl get pod -A
