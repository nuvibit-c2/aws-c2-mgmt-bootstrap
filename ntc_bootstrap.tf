locals {
  
}

# ---------------------------------------------------------------------------------------------------------------------
# ¦ NTC BOOTSTRAP
# ---------------------------------------------------------------------------------------------------------------------
module "ntc_bootstrap" {
  source = "./modules/ntc-bootstrap"

  # S3 bucket name for storing Terraform/OpenTofu state files  
  state_bucket_name = "${partner_id}-${aws_management_account_id}-tfstate"

  # OpenID Connect (OIDC) configuration for GitHub Actions integration
  oidc_configuration = {
    provider_url    = "https://token.actions.githubusercontent.com"
    client_id_list  = ["sts.amazonaws.com"]
    iam_role_name   = "${aws_oidc_role_name}"
    subjects        = [
      "repo:nuvibit-partners/${partner_id}-01-aws-mgmt-organizations:*",
      "repo:nuvibit-partners/${partner_id}-02-aws-mgmt-account-factory:*",
      "repo:nuvibit-partners/${partner_id}-03-aws-mgmt-identity-center:*",
    ]
    iam_policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
    max_session_duration_in_hours = 1
  }
}
