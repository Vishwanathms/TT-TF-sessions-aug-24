## How to maintain multiple state file in local for Different Envirnoment 

* Using workspace we an achive it 

* For example -- we will create 3 worksapce and we will have 3 diff .tfvars file and which will create 3 diff state files.

* Create workspace
``` 
terraform workspace new  dev
terraform workspace new  uat
terraform workspace new  prod
```

* To see the current worksapce 
terraform workspace show

* To change the workspace 
terraform workspace select dev
terraform workspace show -- to confirm it

## Problem , it might be little tough to select the right workspace and run the right .tfvars,

* solution:
* Use shell script as below to sort that out
```
#!/bin/bash

terraform workspace select $1
terraform plan -var-file="$1.tfvars"
echo "press yes for applying"
read -p "Enter your value: " approve

if [ $approve == "yes" ]; then
   terraform apply -var-file="$1.tfvars"
fi
```
run as below 
./script.sh <name of env>
* Note: -- make sure the workspace name and .tfvars name are same for the script to run.

## to save the plan 
```
terraform plan -out=devplan
terraform show devplan >> devplan.json
```