##  Modules 

* created module for below components as single stack 
    * vpc
    * subnet
    * internet Gateway
    * Route-Table
    * Association of subnet to Route-table
    * Adding "0.0.0.0/0" to the Route-table.

* Note: to excute this code, change the profile value to match your local system profile name.

* With the help of modules we can restriict the output values for the users.

## Multiple sub modules and calling one module from another 

## taint 
```
terraform taint module.ec2_instance.aws_instance.ec2
```

## Output 
```
output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.ec2.id
}
```
* In our example the output is stored inside the module folders.
* While calling in the root module, only the outputs that are declared will be available on the root module and not the default output value for that partituclar resource 
* For example, by default for ec2 there are 15+ export values that comes when the ec2 instance resource is created, by tthe root module in our example can see only the "id" and "public_ip" as defined in the output.tf for ec2 module


## Import 
```
terraform import aws_ebs_volume.ebs_volume vol-07b4a18c64845521d
```

* If you are deleting a volume using terraform , there is no intimation that its data volume and data will be lost, but if its already moutned on a linux machine, it would not delete it.
  * But if the volume was formated and moutned as drive on windows, AWS will allow you to delete the volume.
  * You can on the fly increase the volume , which would not disturb the data and mount and the volume will stay back.
  * If you try to decrease, there would be new volume created as per terraform.

