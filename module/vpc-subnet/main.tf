resource "aws_vpc" "vpcs" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "subnet" {
  count                  = length(var.subnet_cidrs)
  vpc_id                 = aws_vpc.vpcs.id
  cidr_block             = var.subnet_cidrs[count.index]
  availability_zone      = var.availability_zones[count.index]
  map_public_ip_on_launch = var.map_public_ip
  tags = {
    Name = "${var.vpc_name}-subnet-${count.index}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpcs.id
  tags = {
    Name = "${var.vpc_name}-igw"
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpcs.id
  tags = {
    Name = "${var.vpc_name}-route-table"
  }
}

resource "aws_route" "internet_route" {
  route_table_id         = aws_route_table.route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "subnet_association" {
  count = length(var.subnet_cidrs)
  subnet_id      = aws_subnet.subnet[count.index].id
  route_table_id = aws_route_table.route_table.id
}
