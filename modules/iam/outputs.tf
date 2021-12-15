
output "iam_policy" {
  description = "iam policy"
  value       = aws_iam_policy.this
}

output "iam_role" {
  description = "iam role"
  value       = aws_iam_role.this
}

output "role_policy_attachment" {
  description = "iam role policy attachmentle"
  value       = aws_iam_role_policy_attachment.this
}
