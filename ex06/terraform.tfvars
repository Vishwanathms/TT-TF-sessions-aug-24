tag_env = "Dev"
tag_dep = "HR"
subnets = ["10.10.0.0/24", "10.10.1.0/24"]
sub_names = ["s1", "s2"]
location = "us-east-1"

vpc_cidr = "10.10.0.0/16"

sub_map_object = {
  "s1" = {
    cidr_block = "10.10.0.0/24"
    availability_zone = "us-east-1a"
    sub_name = "sub1"
  }
  "s2" = {
    cidr_block = "10.10.1.0/24"
    availability_zone = "us-east-1b"
    sub_name = "sub2"
  }

}