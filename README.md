# Terraform Module - CloudFront Distruibution back by S3

This module will create a Cloudfront Distruibution back by S3. The cloudfront will then be pointed to
`cdn.yourdomain.com`.

## Terraform Resources

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.31.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.31.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cert"></a> [cert](#module\_cert) | gitlab.com/systemsmystery/terraform-module-acm-certificates/aws | 1.0.0 |

## Resources

| Name | Type |
|------|------|
| [aws_cloudfront_distribution.dist](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/cloudfront_distribution) | resource |
| [aws_cloudfront_origin_access_control.oac](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/cloudfront_origin_access_control) | resource |
| [aws_cloudfront_origin_access_identity.origin_access_identity](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/cloudfront_origin_access_identity) | resource |
| [aws_route53_record.cdn_record](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/route53_record) | resource |
| [aws_s3_bucket_policy.bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/s3_bucket_policy) | resource |
| [aws_iam_policy_document.bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/data-sources/iam_policy_document) | data source |
| [aws_route53_zone.zone](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/data-sources/route53_zone) | data source |
| [aws_s3_bucket.bucket](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/data-sources/s3_bucket) | data source |
| [aws_s3_bucket.logging_bucket](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/data-sources/s3_bucket) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Bucket name | `string` | n/a | yes |
| <a name="input_cloudfront_name"></a> [cloudfront\_name](#input\_cloudfront\_name) | Cloudfront name, this overrides the default name (cdn.{{domain\_name}} | `string` | `""` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The domain name to use for the Route53 zone | `string` | n/a | yes |
| <a name="input_logging_bucket_name"></a> [logging\_bucket\_name](#input\_logging\_bucket\_name) | Bucket name for logging | `string` | n/a | yes |
| <a name="input_zone_name"></a> [zone\_name](#input\_zone\_name) | The name of the Route53 zone (if different from domain\_name | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudfront_distribution_arn"></a> [cloudfront\_distribution\_arn](#output\_cloudfront\_distribution\_arn) | Cloudfront distribution object for Mastodon CDN |
| <a name="output_cloudfront_distribution_id"></a> [cloudfront\_distribution\_id](#output\_cloudfront\_distribution\_id) | Cloudfront distribution ID for Mastodon CDN |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
