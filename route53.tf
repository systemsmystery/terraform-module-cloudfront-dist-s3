resource "aws_route53_record" "cdn_record" {
  name    = local.cdn_domain
  type    = "A"
  zone_id = data.aws_route53_zone.zone.id
  alias {
    evaluate_target_health = false
    name                   = aws_cloudfront_distribution.dist.domain_name
    zone_id                = aws_cloudfront_distribution.dist.hosted_zone_id
  }
}
