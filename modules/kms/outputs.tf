output "key_arn" {
  description = "arn of the key"
  value       = aws_kms_key.this.*.arn
}

output "key_id" {
  description = "unique identifier for the key"
  value       = aws_kms_key.this.*.id
}

output "key_alias_arn" {
  description = "arn of the key alias"
  value       = aws_kms_alias.this.*.arn
}

output "key_alias_name" {
  description = "name of the key alias"
  value       = aws_kms_alias.this.*.name
}
