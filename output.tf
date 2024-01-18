output "cloudfront_distribution_arn" {
  value       = aws_cloudfront_distribution.dist.arn
  description = "Cloudfront distribution object for Mastodon CDN"
}

output "cloudfront_distribution_id" {
  value       = aws_cloudfront_distribution.dist.id
  description = "Cloudfront distribution ID for Mastodon CDN"
}
