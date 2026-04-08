# =============================================================================
# NTC Bootstrap Configuration
# =============================================================================
# Fill in the values below and run the bootstrap.
# See README.md for detailed instructions.
# =============================================================================

# -----------------------------------------------------------------------------
# AWS Region
# -----------------------------------------------------------------------------
# The AWS region where the state bucket, KMS key, and OIDC provider
# will be created. This should match the primary region of your deployment.
region = "eu-central-1"

# -----------------------------------------------------------------------------
# State Bucket
# -----------------------------------------------------------------------------
# Name of the S3 bucket for storing Terraform/OpenTofu state files.
# With account-regional namespace enabled (default), the actual bucket name
# will be: <state_bucket_name>-<account_id>-<region>-an
state_bucket_account_regional_namespace = true
state_bucket_name                       = "tfstate"

# -----------------------------------------------------------------------------
# CI/CD Pipeline - OIDC Configuration
# -----------------------------------------------------------------------------
# URL of your CI/CD provider's OIDC endpoint.
# Common values:
#   GitHub Actions:  https://token.actions.githubusercontent.com
#   GitLab CI/CD:    https://gitlab.com
#   Spacelift:       https://ACCOUNT_NAME.app.spacelift.io
oidc_provider_url = "https://token.actions.githubusercontent.com"

# Name of the IAM role that the CI/CD pipeline will assume.
oidc_role_name = "ntc-oidc-github-role"

# OIDC subject claims that are allowed to assume the role.
# This controls which repositories/pipelines can authenticate.
# Examples:
#   GitHub Actions:  ["repo:MY_ORG/MY_REPO:*"]
#   GitLab CI/CD:    ["project_path:MY_GROUP/MY_PROJECT:ref_type:branch:ref:main"]
#   Spacelift:       ["spacelift:ACCOUNT_NAME:space:root:*"]
oidc_subjects = [
  "repo:MY_ORG/MY_REPO:*",
]
