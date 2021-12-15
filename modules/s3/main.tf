# s3 bucket for CloudWatch Synthetics monitoring results
resource "aws_s3_bucket" "this" {
  count = var.create_bucket ? 1 : 0

  bucket = var.bucket
  acl    = var.acl

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = data.aws_kms_key.this.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }

  # (Optional) A configuration of object lifecycle management
  lifecycle_rule {
    id      = var.key
    enabled = true

    expiration {
      days                         = 0
      expired_object_delete_marker = false
    }

    noncurrent_version_expiration {
      days = var.retention_days
    }
  }

  tags = var.tags

}

# s3 directory for canary objects
resource "aws_s3_bucket_object" "this" {
  count = var.create_object ? 1 : 0

  bucket = var.bucket
  key    = "${var.key}/"
  acl    = var.acl

  tags = var.tags

  depends_on = [
    aws_s3_bucket.this,
  ]

}

data "aws_kms_key" "this" {
  key_id = "alias/${var.key_name}"
}
