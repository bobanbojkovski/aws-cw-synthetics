resource "aws_synthetics_canary" "this" {
  name                 = var.name
  artifact_s3_location = "s3://${data.aws_s3_bucket.this.id}/"
  execution_role_arn   = data.aws_iam_role.this.arn
  handler              = "${var.handler_name}.handler"
  zip_file             = data.archive_file.this.output_path
  runtime_version      = var.runtime_version

  schedule {
    # expression = "var.schedule_rate_expression"
    expression = var.schedule_cron_expression
    #duration_in_seconds = var.duration_time
  }

  success_retention_period = var.success_retention_period
  failure_retention_period = var.failure_retention_period

  # lambda configuration
  run_config {
    timeout_in_seconds = var.config_timeout_in_seconds
    memory_in_mb       = var.config_memory_in_mb
    active_tracing     = var.config_active_tracing
  }

  vpc_config {
    subnet_ids         = data.aws_subnet_ids.this.ids
    security_group_ids = [data.aws_security_group.this.id]
  }

  start_canary = var.start_canary

  # NOTE Environment variables not supported yet
  # https://github.com/hashicorp/terraform-provider-aws/issues/17948

  lifecycle {
    create_before_destroy = true
    ignore_changes        = [artifact_s3_location]
  }

  tags = var.tags

}

data "archive_file" "this" {
  type        = "zip"
  source_dir  = "${path.module}/functions/"
  output_path = "${path.module}/${var.handler_name}.zip"
}

data "aws_s3_bucket" "this" {
  bucket = var.bucket
}

data "aws_iam_role" "this" {
  name = var.role_name
}

data "aws_subnet_ids" "this" {
  vpc_id = var.vpc_id
  tags = {
    Name = "*private*"
  }

}

data "aws_security_group" "this" {
  id = var.security_group_id
}
