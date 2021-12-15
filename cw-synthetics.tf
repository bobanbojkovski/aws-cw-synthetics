module "cw-synthetics" {
  source = "./modules/cw-synthetics/"

  bucket    = "${var.bucket}-${var.account_id}-${var.region}"
  role_name = "${var.role_name}-${var.name}"

  for_each                 = var.canary_settings
  name                     = each.value.name
  handler_name             = each.value.handler_name
  runtime_version          = each.value.runtime_version
  schedule_cron_expression = each.value.schedule_cron_expression
  duration_time            = each.value.duration_time
  success_retention_period = each.value.success_retention_period
  failure_retention_period = each.value.failure_retention_period
  security_group_id        = each.value.security_group_id

  vpc_id = var.vpc_id

  depends_on = [
    module.s3
  ]

}
