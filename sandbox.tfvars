### common variables
account_id = "<aws_account_id>"
region     = "<aws_region>"
team       = "<team>"
vpc_id     = "<vpc_id>"
stage      = "sandbox"

### kms
create_kms_key   = true
create_kms_alias = true
key_name         = "cw/synthetics"

### s3
create_bucket  = true
create_object  = true
bucket         = "cw-syn-results"
key            = "canary"
retention_days = "31"

### iam
policy_name = "CloudWatchSyntheticsPolicy"
role_name   = "CloudWatchSyntheticsRole"

### cw-synthetics
name = "<synthetics_name>"
canary_settings = {
  1 = {
    name                     = "<name>",
    handler_name             = "loadBlueprint",
    runtime_version          = "syn-nodejs-puppeteer-3.3",
    schedule_cron_expression = "cron(0 5-15 ? * MON-FRI *)",
    duration_time            = "300",
    success_retention_period = "7",
    failure_retention_period = "7",
    security_group_id        = "<security_group_id>",
  },
  2 = {
    name                     = "<name>",
    handler_name             = "loadBlueprint",
    runtime_version          = "syn-nodejs-puppeteer-3.3",
    schedule_cron_expression = "cron(0 5-15 ? * MON-FRI *)",
    duration_time            = "300",
    success_retention_period = "7",
    failure_retention_period = "7",
    security_group_id        = "<security_group_id>",
  },
  3 = {
    name                     = "<name>",
    handler_name             = "loadBlueprint",
    runtime_version          = "syn-nodejs-puppeteer-3.3",
    schedule_cron_expression = "cron(0 5-15 ? * MON-FRI *)",
    duration_time            = "300",
    success_retention_period = "7",
    failure_retention_period = "7",
    security_group_id        = "<security_group_id>",
  },
}


### cw-alarms
sns_topic = "<sns_topic>"
