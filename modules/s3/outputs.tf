output "s3_bucket_id" {
  description = "The name of the bucket."
  value       = element(concat(aws_s3_bucket.this.*.id, [""]), 0)
}

output "s3_bucket_arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value       = element(concat(aws_s3_bucket.this.*.arn, [""]), 0)
}

output "s3_bucket_region" {
  description = "The AWS region this bucket resides in."
  value       = element(concat(aws_s3_bucket.this.*.region, [""]), 0)
}

output "s3_bucket_object_id" {
  description = "The key of S3 object"
  value       = element(concat(aws_s3_bucket_object.this.*.id, [""]), 0)
}

output "s3_bucket_object_etag" {
  description = "The ETag generated for the object (an MD5 sum of the object content)."
  value       = element(concat(aws_s3_bucket_object.this.*.etag, [""]), 0)
}

output "s3_bucket_object_version_id" {
  description = "A unique version ID value for the object, if bucket versioning is enabled."
  value       = element(concat(aws_s3_bucket_object.this.*.version_id, [""]), 0)
}
