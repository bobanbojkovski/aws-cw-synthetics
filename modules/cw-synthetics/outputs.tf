output "canary_name" {
  description = "name of the canaries"
  value       = aws_synthetics_canary.this.name
}

output "canary_arn" {
  description = "canary arn"
  value       = aws_synthetics_canary.this.arn
}

output "canary_id" {
  description = "canary id"
  value       = aws_synthetics_canary.this.id
}

output "canary_source_location_arn" {
  description = "canary source location arn"
  value       = aws_synthetics_canary.this.source_location_arn
}

output "canary_status" {
  description = "canary status"
  value       = aws_synthetics_canary.this.status
}

output "this" {
  value = aws_synthetics_canary.this
}
