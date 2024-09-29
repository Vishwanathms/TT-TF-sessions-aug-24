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

terraform {
  backend "s3" {
    bucket = "vishwa23082024"
    key = "tt-sep24/dev-tf-tt.tfstate"
    region = "us-east-1"
    profile = "specnet-tf-aug-vms"
  }
}