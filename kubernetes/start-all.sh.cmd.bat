::#!/bin/bash

kubectl create configmap eshop-configmap --from-file=eshop-auth-conf=auth-service/application.yml --from-file=eshop-web-conf=eshop-web/application.yml --from-file=eshop-cart-conf=cart-service/application.yml --from-file=eshop-product-conf=product-service/application.yml

::kubectl create -f redis-svc.yaml
ping 127.1 -n 2
kubectl create -f redis-svc.yaml

::sh start-mysql.sh
echo 'create mysql deployment ....'
echo -n 123456 > password.txt
rm -rf /data/docker/pv-4/
mkdir -p  /data/docker/pv-4/
kubectl create secret generic mysql-pass --from-file=password.txt
kubectl create -f mysql-svc.yaml
ping 127.1 -n 2

::sh start-auth.sh
echo 'create auth deployment.....'
kubectl create -f auth-service/eshop-auth.yaml
ping 127.1 -n 2

::sh start-product.sh
echo 'create producet deployment ......'
kubectl create -f product-service/eshop-product.yaml
ping 127.1 -n 2

::sh start-cart.sh
echo 'create cart deployment ...'
kubectl create -f cart-service/eshop-cart.yaml
ping 127.1 -n 2

::sh start-eshop-web.sh
echo 'create eshop web deployment ...'
kubectl create -f  eshop-web/eshop-web.yaml
ping 127.1 -n 2

::kubectl get pod
kubectl get pod