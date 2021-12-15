### iam outputs
output "iam_policy" {
  description = "IAM policy document"
  value       = module.iam.iam_policy
}

output "iam_role" {
  description = "IAM role"
  value       = module.iam.iam_role
}

output "role_policy_attachment" {
  description = "IAM Policy to an IAM role attachment"
  value       = module.iam.role_policy_attachment
}


### kms outputs
output "key_arn" {
  description = "KMS arn"
  value       = module.kms.key_arn
}

output "key_id" {
  description = "KMS unique identifier"
  value       = module.kms.key_id
}

output "key_alias_arn" {
  description = "KMS alias arn"
  value       = module.kms.key_alias_arn
}

output "key_alias_name" {
  description = "KMS alias name"
  value       = module.kms.key_alias_name
}


### s3 outputs
output "s3_bucket_id" {
  description = "S3 Bucket unique identifier"
  value       = module.s3.s3_bucket_id
}

output "s3_bucket_arn" {
  description = "S3 Bucket arn"
  value       = module.s3.s3_bucket_arn
}

output "s3_bucket_region" {
  description = "S3 Bucket region"
  value       = module.s3.s3_bucket_region
}

output "s3_bucket_object_id" {
  description = "S3 Object unique identifier"
  value       = module.s3.s3_bucket_object_id
}

output "s3_bucket_object_etag" {
  description = "S3 Object ETag"
  value       = module.s3.s3_bucket_object_id
}

output "s3_bucket_object_version_id" {
  description = "S3 Object unique version id"
  value       = module.s3.s3_bucket_object_version_id
}


### cw-alarms outputs
output "metric_alarm_arn" {
  description = "Cloudwatch metric alarm arn"
  value       = module.cw-alarms.metric_alarm_arn
}

output "metric_alarm_id" {
  description = "Cloudwatch metric alarm id"
  value       = module.cw-alarms.metric_alarm_id
}


### cw-synthetics outputs
output "canary_details" {
  description = "Canary identifier details"
  value = {
    for canary, details in module.cw-synthetics :
    canary =>
    ({
      "name"                = details.canary_name,
      "arn"                 = details.canary_arn,
      "id"                  = details.canary_id,
      "source_location_arn" = details.canary_source_location_arn,
      "status"              = details.canary_status,
    })
  }
}
