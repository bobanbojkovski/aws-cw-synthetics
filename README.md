<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.7 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cw-alarms"></a> [cw-alarms](#module\_cw-alarms) | ./modules/cw-alarms/ | n/a |
| <a name="module_cw-synthetics"></a> [cw-synthetics](#module\_cw-synthetics) | ./modules/cw-synthetics/ | n/a |
| <a name="module_iam"></a> [iam](#module\_iam) | ./modules/iam/ | n/a |
| <a name="module_kms"></a> [kms](#module\_kms) | ./modules/kms/ | n/a |
| <a name="module_s3"></a> [s3](#module\_s3) | ./modules/s3/ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | AWS account id | `number` | n/a | yes |
| <a name="input_bucket"></a> [bucket](#input\_bucket) | S3 Bucket name | `string` | n/a | yes |
| <a name="input_canary_settings"></a> [canary\_settings](#input\_canary\_settings) | Canary configurations | `map` | n/a | yes |
| <a name="input_create_bucket"></a> [create\_bucket](#input\_create\_bucket) | To create or not S3 Bucket | `bool` | n/a | yes |
| <a name="input_create_kms_alias"></a> [create\_kms\_alias](#input\_create\_kms\_alias) | To create or not KMS alias | `bool` | n/a | yes |
| <a name="input_create_kms_key"></a> [create\_kms\_key](#input\_create\_kms\_key) | To create or not a KMS key | `bool` | n/a | yes |
| <a name="input_create_object"></a> [create\_object](#input\_create\_object) | To create or not S3 Objects | `bool` | n/a | yes |
| <a name="input_key"></a> [key](#input\_key) | S3 Bucket Object name | `string` | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | KMS key name | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Canary name | `string` | n/a | yes |
| <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name) | IAM policy name | `string` | n/a | yes |
| <a name="input_retention_days"></a> [retention\_days](#input\_retention\_days) | Time retention for the canary data | `number` | n/a | yes |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | IAM role name | `string` | n/a | yes |
| <a name="input_sns_topic"></a> [sns\_topic](#input\_sns\_topic) | SNS topic name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_canary_details"></a> [canary\_details](#output\_canary\_details) | Canary identifier details |
| <a name="output_iam_policy"></a> [iam\_policy](#output\_iam\_policy) | IAM policy document |
| <a name="output_iam_role"></a> [iam\_role](#output\_iam\_role) | IAM role |
| <a name="output_key_alias_arn"></a> [key\_alias\_arn](#output\_key\_alias\_arn) | KMS alias arn |
| <a name="output_key_alias_name"></a> [key\_alias\_name](#output\_key\_alias\_name) | KMS alias name |
| <a name="output_key_arn"></a> [key\_arn](#output\_key\_arn) | KMS arn |
| <a name="output_key_id"></a> [key\_id](#output\_key\_id) | KMS unique identifier |
| <a name="output_metric_alarm_arn"></a> [metric\_alarm\_arn](#output\_metric\_alarm\_arn) | Cloudwatch metric alarm arn |
| <a name="output_metric_alarm_id"></a> [metric\_alarm\_id](#output\_metric\_alarm\_id) | Cloudwatch metric alarm id |
| <a name="output_role_policy_attachment"></a> [role\_policy\_attachment](#output\_role\_policy\_attachment) | IAM Policy to an IAM role attachment |
| <a name="output_s3_bucket_arn"></a> [s3\_bucket\_arn](#output\_s3\_bucket\_arn) | S3 Bucket arn |
| <a name="output_s3_bucket_id"></a> [s3\_bucket\_id](#output\_s3\_bucket\_id) | S3 Bucket unique identifier |
| <a name="output_s3_bucket_object_etag"></a> [s3\_bucket\_object\_etag](#output\_s3\_bucket\_object\_etag) | S3 Object ETag |
| <a name="output_s3_bucket_object_id"></a> [s3\_bucket\_object\_id](#output\_s3\_bucket\_object\_id) | S3 Object unique identifier |
| <a name="output_s3_bucket_object_version_id"></a> [s3\_bucket\_object\_version\_id](#output\_s3\_bucket\_object\_version\_id) | S3 Object unique version id |
| <a name="output_s3_bucket_region"></a> [s3\_bucket\_region](#output\_s3\_bucket\_region) | S3 Bucket region |
<!-- END_TF_DOCS -->

## NOTES

Currently (09.2021) terraform [```aws_synthetics_canary```](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/synthetics_canary) does not support environment variables. After the tf apply, manualy add the definitions in AWS Console, 

```
CloudWatch > Application monitoring > Synthetics Canaries
```

Example:

```
url_1     http://<web-site>:<port>
url_2     http://<web-site>:<port>

```

 
The variables are defined in canary script:
``` modules/cw-synthetics/functions/nodejs/node_modules/loadBlueprint.js ```

```
let url_1 = process.env.url_1
let url_2 = process.env.url_2
const urls = [url_1, url_2];
```

