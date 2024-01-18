module "cert" {
  # checkov:skip=CKV_TF_1
  source                  = "gitlab.com/systemsmystery/terraform-module-acm-certificates/aws"
  version                 = "1.0.0"
  certificate_domain_name = "cdn.${var.domain_name}"
  zone_name               = data.aws_route53_zone.zone.name
  providers = {
    aws = aws.us_east_1
  }
}
