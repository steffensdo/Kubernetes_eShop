#!/bin/bash

sleep 20;

echo "ok" > /tmp/ok.txt

java -jar /opt/app/eshop_service/eshop_k8s_product-service.jar --spring.config.location=/opt/app/eshop_service/config/application.yml
