variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
  default     = "my-ec2-instance"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where the EC2 instance will be deployed"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the security group will be created"
  type        = string
}

variable "security_group_name" {
  description = "Name for the security group"
  type        = string
  default     = "ec2-security-group"
}

variable "ingress_rules" {
  description = "Map of ingress rules, where each rule is a list containing [from_port, to_port, protocol, cidr_blocks]"
  type = map(list(string))
  default = {
    ssh = ["22", "22", "tcp", "0.0.0.0/0"]
    http = ["80", "80", "tcp", "0.0.0.0/0"]
  }
}

variable "egress_rules" {
  description = "Map of egress rules, where each rule is a list containing [from_port, to_port, protocol, cidr_blocks]"
  type = map(list(string))
  default = {
    all_traffic = ["0", "0", "-1", "0.0.0.0/0"]
  }
}


variable "root_volume_size" {
  description = "Size of the root volume in GB"
  type        = number
  default     = 8
}

variable "root_volume_type" {
  description = "Type of the root volume (standard, gp2, io1)"
  type        = string
  default     = "gp2"
}

variable "ebs_device_name" {
  description = "Device name for attaching the EBS volume"
  type        = string
  default     = "/dev/xvdf"
}

variable "ebs_volume_size" {
  description = "Size of the EBS volume in GB"
  type        = number
  default     = 10
}

variable "ebs_volume_type" {
  description = "Type of the EBS volume (standard, gp2, io1)"
  type        = string
  default     = "gp2"
}

variable "availability_zone" {
  description = "The availability zone where the EBS volume will be created"
  type        = string
}
