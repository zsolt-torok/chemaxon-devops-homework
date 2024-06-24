module "vpc" {
  source = "./modules/aws-vpc"

  account_id           = "112233445566"
  vpc_cidr             = "10.0.0.0/16"
  public_subnets_cidr  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets_cidr = ["10.0.10.0/24", "10.0.11.0/24"]
  enable_dns_support   = true
  enable_dns_hostnames = true
  s3_gateway_policy_config = {
    enabled = true
  }

  context = {
    enabled     = true
    namespace   = "chemaxon-hw"
    environment = "dev"
    stage       = "test"
    name        = "vpc"
    delimiter   = "-"
    attributes  = []
    tags = {
      Terraform   = "true"
      Environment = "development"
    }
    additional_tag_map  = {}
    regex_replace_chars = "/"
    label_order         = ["namespace", "environment", "name"]
    id_length_limit     = 32
    label_key_case      = "lower"
    label_value_case    = "lower"
    descriptor_formats  = {}
    labels_as_tags      = ["name"]
  }
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "internet_gateway_id" {
  value = module.vpc.internet_gateway_id
}

output "nat_gateway_id" {
  value = module.vpc.nat_gateway_id
}

output "subnets" {
  value = module.vpc.subnet_ids
}

output "route_table_id" {
  value = module.vpc.route_table_ids
}
