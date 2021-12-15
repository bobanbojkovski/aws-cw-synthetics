resource "aws_kms_key" "this" {
  count = var.create_kms_key ? 1 : 0

  description = "KMS key to encrypt CloudWatch Synthetics monitoring results"
  is_enabled  = var.enabled

  customer_master_key_spec = var.customer_master_key_spec
  key_usage                = var.key_usage

  deletion_window_in_days = var.deletion_window_in_days
  enable_key_rotation     = var.enable_key_rotation
  policy                  = data.aws_iam_policy_document.this.json

  tags = var.tags
}

resource "aws_kms_alias" "this" {
  count         = var.create_kms_alias ? 1 : 0
  name          = "alias/${var.key_name}"
  target_key_id = aws_kms_key.this.0.key_id
}

data "aws_iam_policy_document" "this" {
  statement {
    effect = "Allow"
    actions = [
      "kms:*"
    ]
    resources = ["*"]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.account_id}:root"]
    }

  }
}
