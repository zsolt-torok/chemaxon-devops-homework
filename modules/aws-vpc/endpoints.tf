locals {
  gateway_endpoint_services = {
    s3 = "com.amazonaws.${data.aws_region.this.name}.s3"
  }

  gateway_endpoint_policies = {
    s3 = var.s3_gateway_policy_config.enabled ? data.aws_iam_policy_document.s3_gateway_policy.json : data.aws_iam_policy_document.vpc_endpoint_default_policy.json
  }
}

resource "aws_security_group" "endpoints" {
  name        = "${module.label_vpc.id}-endpoints"
  vpc_id      = aws_vpc.this.id
  description = "Security group for VPC endpoints."

  tags = module.label_endpoints_sg.tags
}

resource "aws_security_group_rule" "ingress" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.endpoints.id
  description       = "HTTPS port"
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.endpoints.id
  description       = "Allow egress"
}

resource "aws_vpc_endpoint" "gateway" {
  for_each          = local.gateway_endpoint_services
  policy            = lookup(local.gateway_endpoint_policies, each.key, null)
  vpc_id            = aws_vpc.this.id
  service_name      = each.value
  vpc_endpoint_type = "Gateway"

  tags = module.label_gw_vpc_endpoint[each.key].tags
}

resource "aws_vpc_endpoint_route_table_association" "gateway" {
  for_each = local.gateway_endpoint_services

  route_table_id  = aws_route_table.private.id
  vpc_endpoint_id = aws_vpc_endpoint.gateway[each.key].id
}
