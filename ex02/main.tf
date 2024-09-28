provider "aws" {
  region = "us-east-1"
  profile = "specnet-tf-aug-vms"
}

resource "aws_vpc" "vpc1" {
  cidr_block = "10.0.0.0/16"
  tags = {
    #"Dep" = "Finance"
    "Dep" = var.tag_dep
  }
}



variable "tag_dep" {
  default = "IT"
}