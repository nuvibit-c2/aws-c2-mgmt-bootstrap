output "default_region" {
  description = "The AWS region used for bootstrap resources"
  value       = local.default_region
}

output "account_id" {
  description = "The AWS account ID where bootstrap was applied"
  value       = local.current_account_id
}