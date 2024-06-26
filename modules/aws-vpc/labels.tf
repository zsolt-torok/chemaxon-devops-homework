module "label_vpc" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  context = var.context
}

module "label_igw" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  context = merge(var.context, { name = "igw" })
}

module "label_nat_gw" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  context = merge(var.context, { name = "nat-gw" })
}

module "label_eip" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  context = merge(var.context, { name = "eip" })
}

module "label_public_subnets" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  context = merge(var.context, { name = "public-subnet" })
}

module "label_private_subnets" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  context = merge(var.context, { name = "private-subnet" })
}

module "label_public_rt" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  context = merge(var.context, { name = "public-rt" })
}

module "label_private_rt" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  context = merge(var.context, { name = "private-rt" })
}

module "label_endpoints_sg" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  context = merge(var.context, { name = "endpoints-sg" })
}

module "label_gw_vpc_endpoint" {
  for_each = local.gateway_endpoint_services

  source  = "cloudposse/label/null"
  version = "0.25.0"

  context = merge(var.context, { name = "gw-vpc-endpoint-${each.key}" })
}
