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