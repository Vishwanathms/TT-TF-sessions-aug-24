module "network1" {
  source = "../module/vpc-subnet"
  
  vpc_name            = "production-vpc"
  vpc_cidr            = "10.1.0.0/16"
  subnet_cidrs        = ["10.1.1.0/24", "10.1.2.0/24"]
  availability_zones  = ["us-east-1a", "us-east-1b"]
  map_public_ip       = true
  enable_dns_support  = true
  enable_dns_hostnames = true
}

module "network2" {
  source = "../module/vpc-subnet"
  
  vpc_name            = "test-vpc"
  vpc_cidr            = "10.2.0.0/16"
  subnet_cidrs        = ["10.2.1.0/24", "10.2.2.0/24"]
  availability_zones  = ["us-east-1a", "us-east-1b"]
  map_public_ip       = true
  enable_dns_support  = true
  enable_dns_hostnames = true
}