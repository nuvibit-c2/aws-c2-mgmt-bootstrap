# ---------------------------------------------------------------------------------------------------------------------
# ¦ NTC BOOTSTRAP
# ---------------------------------------------------------------------------------------------------------------------
module "ntc_bootstrap" {
  source = "./modules/ntc-bootstrap"

  # Region where the state bucket and KMS key will be created
  region = "eu-central-1"

  # Whether the S3 bucket should use a regional namespace. This allows naming the state bucket the same across acccounts
  state_bucket_account_regional_namespace = true

  # S3 bucket name for storing Terraform/OpenTofu state files  
  state_bucket_name = "tfstate"

  # OpenID Connect (OIDC) configuration for GitHub Actions integration
  oidc_configuration = {
    provider_url    = "https://token.actions.githubusercontent.com"
    client_id_list  = ["sts.amazonaws.com"]
    iam_role_name   = "ntc-oidc-github-role"
    subjects        = [
      "repo:GITHUB_ORG/REPO_NAME:*",
    ]
    iam_policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
    max_session_duration_in_hours = 1
  }
}
