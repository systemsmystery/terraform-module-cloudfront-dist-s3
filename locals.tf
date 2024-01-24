locals {
  cdn_domain = coalesce(var.cloudfront_name, "cdn.${var.domain_name}")
}
