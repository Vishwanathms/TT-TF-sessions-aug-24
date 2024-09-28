#!/bin/bash

terraform workspace select $1
terraform plan -var-file="$1.tfvars"
echo "press yes for applying"
read -p "Enter your value: " approve

if [ $approve == "yes" ]; then
   terraform apply -var-file="$1.tfvars"
fi