data "aws_s3_bucket" "logging_bucket" {
  bucket = var.logging_bucket_name
}

data "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}

data "aws_route53_zone" "zone" {
  name = coalesce(var.zone_name, var.domain_name)
}

data "aws_iam_policy_document" "bucket_policy" {
  statement {
    actions = [
      "s3:GetObject",
    ]
    resources = ["${data.aws_s3_bucket.bucket.arn}/*"]
    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }
    condition {
      test     = "StringEquals"
      values   = [aws_cloudfront_distribution.dist.arn]
      variable = "AWS:SourceArn"
    }
    condition {
      test     = "Bool"
      values   = [true]
      variable = "AWS:SecureTransport"
    }
  }
}
