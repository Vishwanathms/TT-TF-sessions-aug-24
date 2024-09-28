## How to efficiently create subnets 

## Example of map(string)
```
variable "subnets_map" {
  type = map 
  default = {
    "s1" = "10.10.0.0/24"
    "s2" = "10.10.1.0/24"
  }
}

subnets_map = {
    "sub1" = "10.10.0.0/24"
    "sub2" = "10.10.1.0/24"
  }
```

* Usage 
```
resource "aws_subnet" "subnetworks" {
  for_each = var.subnets_map
  vpc_id = aws_vpc.vpc1.id
  cidr_block = each.value
  tags = {
    "Name" = each.key
  }
}
```
Here the for_each loop is used and "each.key" and each.value.


## Example of map(list)
```
variable "subnets_map_list" {
  type = map(list)
}

subnets_map_list = {
    "sub1" = ["10.10.0.0/24", "sub1", "us-east-1a"]
    "sub2" = ["10.10.1.0/24", "sub1", "us-east-1a"]
  }

```
* Usage 
```
resource "aws_subnet" "subnetworks" {
  for_each = var.subnets_map_list
  vpc_id = aws_vpc.vpc1.id
  cidr_block = each.value[0]
  availability_zone = each.value[2]
  tags = {
    "Name" = each.value[1]
  }
}
```

## Example of map(object)