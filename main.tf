# ---------------------------------------------------------------------------------------------------------------------
# ¦ PROVIDER
# ---------------------------------------------------------------------------------------------------------------------
provider "aws" {
  region = "eu-central-1"
  default_tags {
    tags = local.default_tags
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# ¦ REQUIREMENTS
# ---------------------------------------------------------------------------------------------------------------------
terraform {
  required_version = ">= 1.10.6"

  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = "~> 6.0"
      configuration_aliases = []
    }
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# ¦ DATA
# ---------------------------------------------------------------------------------------------------------------------
data "aws_region" "default" {}
data "aws_partition" "current" {}
data "aws_caller_identity" "current" {}

# ---------------------------------------------------------------------------------------------------------------------
# ¦ LOCALS
# ---------------------------------------------------------------------------------------------------------------------
locals {
  # default tags are applied to all resources the provider creates
  default_tags = {
    ManagedBy = "OpenTofu"
  }
  default_region               = data.aws_region.default.region
  current_partition            = data.aws_partition.current.partition  # e.g. "aws"
  current_partition_dns_suffix = data.aws_partition.current.dns_suffix # e.g. "amazonaws.com"
  current_account_id           = data.aws_caller_identity.current.account_id
}

# ---------------------------------------------------------------------------------------------------------------------
# ¦ NTC BOOTSTRAP
# ---------------------------------------------------------------------------------------------------------------------
module "ntc_bootstrap" {
  source = "./modules/ntc-bootstrap"

  region                                  = var.region
  state_bucket_name                       = var.state_bucket_name
  state_bucket_account_regional_namespace = var.state_bucket_account_regional_namespace

  oidc_configuration = {
    provider_url                  = var.oidc_provider_url
    client_id_list                = var.oidc_client_id_list
    iam_role_name                 = var.oidc_role_name
    subjects                      = var.oidc_subjects
    iam_policy_arn                = var.oidc_policy_arn
    max_session_duration_in_hours = var.oidc_max_session_duration_hours
  }
}
