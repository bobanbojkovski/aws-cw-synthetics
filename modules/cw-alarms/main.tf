resource "aws_cloudwatch_metric_alarm" "this" {
  alarm_name          = var.name
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "Failed requests"
  namespace           = "CloudWatchSynthetics"
  period              = "60"
  statistic           = "Maximum"
  threshold           = "0"
  alarm_description   = "CloudWatchSynthetics canary alarm metric failed"
  actions_enabled     = "true"
  alarm_actions = [
    data.aws_sns_topic.this.arn
  ]

  treat_missing_data = var.treat_missing_data

  dimensions = {
    CanaryName = var.name
  }
}

data "aws_sns_topic" "this" {
  name = var.sns_topic
}
