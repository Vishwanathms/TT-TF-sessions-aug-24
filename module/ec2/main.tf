resource "aws_security_group" "ec2_sg" {
  name        = var.security_group_name
  description = "Security group for EC2 instance"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value[0]
      to_port     = ingress.value[1]
      protocol    = ingress.value[2]
      cidr_blocks = [ingress.value[3] ]
    }
  }

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      from_port   = egress.value[0]
      to_port     = egress.value[1]
      protocol    = egress.value[2]
      cidr_blocks = [egress.value[3] ]
    }
  }

  tags = {
    Name = var.security_group_name
  }
}

resource "aws_instance" "ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = var.instance_name
  }

  root_block_device {
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
  }

  /*ebs_block_device {
    device_name = var.ebs_device_name
    volume_size = var.ebs_volume_size
    volume_type = var.ebs_volume_type
    delete_on_termination = true
  }*/
}

resource "aws_volume_attachment" "ebs_attachment" {
  device_name = var.ebs_device_name
  volume_id   = aws_ebs_volume.ebs_volume.id
  instance_id = aws_instance.ec2.id
}

resource "aws_ebs_volume" "ebs_volume" {
  availability_zone = var.availability_zone
  size              = var.ebs_volume_size
  type              = var.ebs_volume_type
  tags = {
    Name = "${var.instance_name}-ebs-volume"
  }
}
