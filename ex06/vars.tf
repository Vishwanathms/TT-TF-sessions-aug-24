variable "tag_dep" {
  default = "IT"
}

variable "subnets" {
  type = list 
  default = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "sub_names" {
  type = list 
  default = ["sub1", "sub2"]
}

variable "location" {
  validation {
    condition = contains(["us-east-1", "us-east-2"], var.location)
    error_message = "Location must be either east-1 or east-2"
  }
}

variable "vpc_cidr" {}
variable "tag_env" {}

#variable "subnets_map" {
#  type = map 
#  default = {
#    "s1" = "10.10.0.0/24"
#    "s2" = "10.10.1.0/24"
#  }
#}

#variable "subnets_map_list" {
#  type = map(list)
#}

variable "sub_map_object" {
  type = map(object({
    cidr_block = string
    availability_zone = string
    sub_name = string 
  }))
}

variable "aug" {
  type = any 
}