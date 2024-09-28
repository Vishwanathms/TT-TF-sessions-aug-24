provider "aws" {
  region = "us-east-1"
  profile = "specnet-tf-aug-vms"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.63.1"
    }
  }
}