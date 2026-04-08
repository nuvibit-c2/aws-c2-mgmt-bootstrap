# =============================================================================
# NTC Bootstrap Configuration
# =============================================================================
#
# INSTRUCTIONS:
#   1. Update configuration values in this file as needed (see comments below)
#   2. Run: tofu init && tofu plan
#   3. Review the plan, then run: tofu apply
#
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
# With account-regional namespace enabled (recommended), the actual bucket
# name will be: <state_bucket_name>-<account_id>-<region>-an
state_bucket_name                       = "tfstate"
state_bucket_account_regional_namespace = true

# -----------------------------------------------------------------------------
# CI/CD Pipeline - OIDC Configuration
# -----------------------------------------------------------------------------
# URL of your CI/CD provider's OIDC endpoint.
# Examples:
#   GitHub Actions:  https://token.actions.githubusercontent.com
#   GitLab CI/CD:    https://gitlab.com
#   Spacelift:       https://<YOUR_ACCOUNT>.app.spacelift.io
oidc_provider_url = "https://token.actions.githubusercontent.com"

# List of OIDC client IDs (audiences) allowed to assume the role
# Examples:
#   GitHub Actions:  ["sts.amazonaws.com"]
#   GitLab CI/CD:    ["https://gitlab.com"]
#   Spacelift:       ["https://<YOUR_ACCOUNT>.app.spacelift.io"]
#   Terraform Cloud: ["aws.workload.identity"]
oidc_client_id_list = ["sts.amazonaws.com"]

# Name of the IAM role that the CI/CD pipeline will assume.
oidc_role_name = "ntc-oidc-github-role"

# This controls which repositories/pipelines can authenticate.
# Replace the placeholder below with your actual org/repo names.
# Examples:
#   GitHub Actions:  ["repo:MY_ORG/MY_REPO:ref:refs/heads/main"]
#   GitLab CI/CD:    ["project_path:MY_GROUP/MY_PROJECT:ref_type:branch:ref:main"]
#   Spacelift:       ["space:MY_SPACE_ID:stack:MY_STACK_ID:run_type:RUN_TYPE:scope:RUN_PHASE"]
#   Terraform Cloud: ["organization:MY_ORG:project:MY_PROJECT:workspace:MY_WORKSPACE:run_phase:PHASE"]
oidc_subjects = [
  "repo:MY_ORG/MY_REPO:*",
]
