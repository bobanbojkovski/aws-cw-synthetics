output "metric_alarm_arn" {
  description = "cloudwatch metric alarm arn"
  value       = aws_cloudwatch_metric_alarm.this.arn
}

output "metric_alarm_id" {
  description = "cloudwatch metric alarm id"
  value       = aws_cloudwatch_metric_alarm.this.id
}
