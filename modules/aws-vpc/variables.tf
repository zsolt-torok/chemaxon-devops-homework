variable "context" {
  type        = any
  description = <<-EOT
    Naming context used by naming convention module
  EOT
  default = {
    enabled             = true
    namespace           = null
    resource_type       = null
    environment         = null
    stage               = null
    name                = null
    delimiter           = null
    attributes          = []
    tags                = {}
    additional_tag_map  = {}
    regex_replace_chars = null
    label_order         = []
    id_length_limit     = null
    label_key_case      = null
    label_value_case    = null
    descriptor_formats  = {}
    labels_as_tags      = ["unset"]
  }

  validation {
    condition = lookup(var.context, "label_key_case", null) == null ? true : contains([
      "lower", "title", "upper"
    ], var.context["label_key_case"])
    error_message = "Allowed values: `lower`, `title`, `upper`."
  }

  validation {
    condition = lookup(var.context, "label_value_case", null) == null ? true : contains([
      "lower", "title", "upper", "none"
    ], var.context["label_value_case"])
    error_message = "Allowed values: `lower`, `title`, `upper`, `none`."
  }
}

variable "account_id" {
  type        = string
  description = "Id of the deploying account."
  validation {
    condition     = can(regex("^[0-9]{12}$", var.account_id))
    error_message = "Invalid account id."
  }
}

#################################
#            vpc                #
#################################

variable "vpc_cidr" {
  type        = string
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/16"
}

variable "enable_dns_support" {
  type        = bool
  description = "Enable DNS support in the VPC."
  default     = true
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames in the VPC."
  default     = true
}

#################################
#            subnets            #
#################################

variable "public_subnets_cidr" {
  type        = list(string)
  description = "A list of CIDR blocks for the public subnets."
}

variable "private_subnets_cidr" {
  type        = list(string)
  description = "A list of CIDR blocks for the private subnets."
}

#################################
#            endpoints          #
#################################

variable "s3_gateway_policy_config" {
  type = object({
    enabled = bool
  })
  description = "Configuration for S3 gateway endpoint policy."
  default = {
    enabled = false
  }
}
