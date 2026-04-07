# ---------------------------------------------------------------------------------------------------------------------
# ¦ REQUIRED VARIABLES
# ---------------------------------------------------------------------------------------------------------------------
variable "state_bucket_name" {
  description = "Name of the S3 bucket that will be created for storing Terraform/OpenTofu state files"
  type        = string
}

variable "oidc_configuration" {
  description = "OpenID Connect (OIDC) configuration for CI/CD pipeline integration"
  type = object({
    provider_url                  = string
    client_id_list                = list(string)
    iam_role_name                 = string
    subjects                      = list(string)
    iam_policy_arn                = string
    max_session_duration_in_hours = number
  })
}

# ---------------------------------------------------------------------------------------------------------------------
# ¦ OPTIONAL VARIABLES
# ---------------------------------------------------------------------------------------------------------------------
variable "kms_deletion_window_in_days" {
  description = "Duration in days after which the KMS key is deleted after destruction of the resource (must be between 7 and 30 days)"
  type        = number
  default     = 30
}

variable "kms_key_rotation_enabled" {
  description = "Enable automatic rotation of the KMS key"
  type        = bool
  default     = true
}
