output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.this.id
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.this.id
}

output "nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = aws_nat_gateway.this.id
}

output "subnet_ids" {
  description = "The IDs of the public and private subnets"
  value = {
    public  = aws_subnet.public[*].id
    private = aws_subnet.private[*].id
  }
}

output "route_table_ids" {
  description = "The IDs of the public and private route tables"
  value = {
    public  = aws_route_table.public.id
    private = aws_route_table.private.id
  }
}
