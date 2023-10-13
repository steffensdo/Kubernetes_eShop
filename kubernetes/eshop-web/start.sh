#!/bin/bash

sleep 10;

echo   `date`"----ok"  > ok.txt

java -jar /opt/app/eshop_service/eshop_k8s_eshop_web.jar --spring.config.location=/opt/app/eshop_service/config/application.yml
