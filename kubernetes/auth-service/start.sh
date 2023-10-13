#!/bin/bash

sleep 10;

echo   `date`"----ok"  > ok.txt

java -jar /opt/app/eshop_service/eshop_k8s_auth_service.jar --spring.config.location=/opt/app/eshop_service/config/application.yml
