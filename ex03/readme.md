## variables 

* precedence (lowest to highest)
  * it would ask for the value if the values was not found anywhere in the code or folder, during the run time of plan and apply
  * default value 

  * terraform plan  -var tag_dep="HR" -- has the highest precedence
  
  * sperated the variables to another file 
  * added list variables 
  * Created subnet1
  * Create Subnet2

* How to create multiple subnets for exmaple below with a loop 
```
resource "aws_subnet" "sub1" {
  vpc_id = aws_vpc.vpc1.id
  cidr_block = "10.0.0.0/24"
  tags = {
    #"Dep" = "Finance"
    "Name" = "sub1"
    "Dep" = var.tag_dep
  }
}

resource "aws_subnet" "sub2" {
  vpc_id = aws_vpc.vpc1.id
  cidr_block = "10.0.1.0/24"
  tags = {
    #"Dep" = "Finance"
    "Name" = "sub2"
    "Dep" = var.tag_dep
  }
}
```

* With loop 
  * create an variable with list 
  * use count along with count.index for a for loop
  * count = "2" -- instead of value we can use length(var.subnets)
  use list of rsubnet names as well and attach the count.index to it 
```

```

* Expirements 
  * add tag , see if the resource is updated or created
  * Change cidr_block in subnet -- ?? Check 
  * 

* plan with the variables
  * terraform plan -var sub_names='["sub1", "sub2"]'
