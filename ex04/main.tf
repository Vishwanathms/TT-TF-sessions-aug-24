provider "aws" {
  region = var.location
  profile = "specnet-tf-aug-vms"
}

resource "random_integer" "name" {
  count = length(var.subnets)
  min = 6
  max = 10
}
locals {
  names = "c1-p1"
}

resource "aws_vpc" "vpc1" {
  cidr_block = var.vpc_cidr
  tags = {
    #"Dep" = "Finance"
    "Name" = "VPC1-${local.names}"
    "Dep" = var.tag_dep
  }
}

resource "aws_subnet" "subnetworks" {
  count = length(var.subnets)
  vpc_id = aws_vpc.vpc1.id
  cidr_block = var.subnets[count.index]
  tags = {
    #"Name" = "sub-${random_integer.name[count.index].result}"
    "Name" = var.sub_names[count.index]
    #"Name"="sub-${count.index}"

    "Dep" = var.tag_dep
  }
}




