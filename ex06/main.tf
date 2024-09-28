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
    "Env" = var.tag_env
  }
}

resource "aws_subnet" "subnetworks" {
  for_each = var.sub_map_object
  vpc_id = aws_vpc.vpc1.id
  cidr_block = each.value.cidr_block
  availability_zone = each.value.availability_zone
  tags = {
    "Name" = each.value.sub_name
    #"Name"="sub-${count.index}"

    "Dep" = var.tag_dep
    "Env" = var.tag_env
  }
}




