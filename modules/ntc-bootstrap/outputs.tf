output "state_bucket_name" {
  description = "The name of the S3 bucket created for state storage"
  value       = aws_s3_bucket.ntc_tfstate.bucket
}

output "state_bucket_region" {
  description = "The AWS region of the state bucket"
  value       = var.region
}

output "kms_key_alias" {
  description = "The KMS key alias used for state bucket encryption"
  value       = aws_kms_alias.ntc_state_bucket_encryption.name
}

output "oidc_role_arn" {
  description = "The ARN of the IAM role for CI/CD pipeline OIDC authentication"
  value       = aws_iam_role.ntc_oidc_role.arn
}
