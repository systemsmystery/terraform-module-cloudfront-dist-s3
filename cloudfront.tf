resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = var.domain_name
}

resource "aws_cloudfront_origin_access_control" "oac" {
  name                              = local.cdn_domain
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "dist" {
  # checkov:skip=CKV_AWS_68
  # checkov:skip=CKV_AWS_310
  # checkov:skip=CKV2_AWS_32
  # checkov:skip=CKV2_AWS_47:
  enabled             = true
  default_root_object = "index.html"
  aliases             = [local.cdn_domain]
  origin {
    domain_name              = data.aws_s3_bucket.bucket.bucket_regional_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.oac.id
    origin_id                = aws_cloudfront_origin_access_identity.origin_access_identity.id
  }
  logging_config {
    bucket          = data.aws_s3_bucket.logging_bucket.bucket_domain_name
    include_cookies = false
    prefix          = var.domain_name
  }
  default_cache_behavior {
    allowed_methods        = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = aws_cloudfront_origin_access_identity.origin_access_identity.id
    viewer_protocol_policy = "redirect-to-https"
    compress               = true

    min_ttl     = 0
    default_ttl = 5 * 60
    max_ttl     = 60 * 60

    forwarded_values {
      query_string = true

      cookies {
        forward = "none"
      }
    }
  }
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  viewer_certificate {
    acm_certificate_arn      = module.cert.certificate_arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }
}
