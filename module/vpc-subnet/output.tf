output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.vpcs.id
}

output "subnet_ids" {
  description = "The IDs of the created subnets"
  value       = aws_subnet.subnet[*].id
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.igw.id
}

output "route_table_id" {
  description = "The ID of the Route Table"
  value       = aws_route_table.route_table.id
}
