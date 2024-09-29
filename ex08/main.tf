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

module "ec2_instance" {
  source = "../module/ec2"

  instance_name          = "web-server"
  ami_id                 = "ami-0ebfd941bbafe70c6"
  instance_type          = "t3.micro"
  key_name               = "skv-key1"
  subnet_id              = module.network1.subnet_ids[0]
  vpc_id                 = module.network1.vpc_id
  security_group_name = "wb-sg01"
  
  
  ingress_rules = {
    ssh  = ["22", "22", "tcp", "0.0.0.0/0"]
    http = ["80", "80", "tcp", "0.0.0.0/0"]
    icmp   = ["-1", "-1", "icmp", "0.0.0.0/0"]
  }

  egress_rules = {
    all_traffic = ["0", "0", "-1", "0.0.0.0/0"]
  }
  root_volume_size       = 10
  root_volume_type       = "gp2"
  ebs_device_name        = "/dev/xvdg"
  ebs_volume_size        = 20
  ebs_volume_type        = "gp2"
  availability_zone      = "us-east-1a"
}


resource "null_resource" "stop-httpd" {
  connection {
    type = "ssh"
    user = "ec2-user"
    host = module.ec2_instance.public_ip
    private_key = file("~/Downloads/skv-key1.pem")
  }

  provisioner "remote-exec" {
    inline = [
      "sleep 60",
      "sudo systemctl stop httpd",

      "echo -e 'n\np\n1\n\n\nw' | sudo fdisk /dev/xvdg",
      "sudo mkfs.ext4 /dev/nvme1n1p1",
      "sudo mkdir -p /mnt/data",
      "sudo mount /dev/nvme1n1p1 /mnt/data",
      "sudo chown ec2-user:ec2-user /mnt/data",
      "sudo echo 'line in file1' >> /mnt/data/file1"
    ]
  }
}